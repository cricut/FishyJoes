package com.cricut.fishyjoes.runtime

import java.io.BufferedOutputStream
import java.io.File
import java.io.FileOutputStream
import java.nio.file.Files
import com.cricut.androidswiftruntime.SwiftStdlib

object LibraryLoader {
    private var startedLoad = mutableSetOf<String>()
    private var unpackedStdlib = false
    private val libDirectory = lazy {
        val path = Files.createTempDirectory("java-libs-")
        path.toFile().deleteOnExit()
        path
    }

    fun ensureLoaded(libraryName: String) {
        synchronized(this) {
            if (startedLoad.contains(libraryName)) {
                return
            }
            unpackStdLib()
            startedLoad.add(libraryName)
            loadLibrary(libraryName)
        }
    }

    private fun unpackLibrary(libraryName: String): File {
        // Figure out which version of the library to grab
        val osName = System.getProperty("os.name")

        val jarPath: String
        val prefix: String
        val ext: String

        if (osName.contains("Linux")) {
            jarPath = "/linux/lib$libraryName.so"
            prefix = "lib"
            ext = "so"
        } else if (osName.contains("Mac")) {
            jarPath = "/mac/lib$libraryName.dylib"
            prefix = "lib"
            ext = "dylib"
        } else if (osName.contains("Windows")) {
            jarPath = "/windows/$libraryName.dll"
            prefix = ""
            ext = "dll"
        } else {
            error("$libraryName unsupported OS: $osName")
        }
        return extractLibraryFromJar(javaClass, jarPath, "$prefix$libraryName.$ext")
    }

    private fun <T> extractLibraryFromJar(relativeClass: Class<T>, jarPath: String, outFileName: String): File {
        // Extract dynamic library from jar to temporary file
        val stream = relativeClass.getResourceAsStream(jarPath)
            ?: error("couldn't find $jarPath")
        val file = libDirectory.value.resolve(outFileName).toFile()
        file.deleteOnExit()
        val out = BufferedOutputStream(FileOutputStream(file))

        val buf = ByteArray(8 * 1024)
        while (true) {
            val length = stream.read(buf)
            if (length <= 0) {
                break
            }
            out.write(buf, 0, length);
        }
        //stream.transferTo(out)
        out .close()

        return file
    }

    private fun loadLibrary(libraryName: String) {
        val osName = System.getProperty("os.name")
        val vendor = System.getProperty("java.vendor")

        if (vendor.contains("Android"))
        {
            // android libraries are loaded differently
            System.loadLibrary(libraryName)
            return
        }

        val file = unpackLibrary(libraryName)

        // Load library
        System.load(file.absolutePath)

        // Eager cleanup if the OS allows it
        if (osName.contains("Mac")) {
            file.delete()
        }
    }

    private fun unpackStdLib() {
        if (unpackedStdlib) { return }

        val osName = System.getProperty("os.name")
        val vendor = System.getProperty("java.vendor")

        if (!osName.contains("Linux") || vendor.contains("Android")) { return }

        val stdlibLibraries = SwiftStdlib.javaClass.getResource("/linux/stdlib.txt")!!
            .readText()
            .split('\n')
            .filter { !it.isEmpty() }

        for (lib in stdlibLibraries) {
            // TODO: put back in this code once we have correct symlinks in place
//            if (lib.endsWith(".so")) {
                // copy file
                extractLibraryFromJar(SwiftStdlib.javaClass, "/linux/$lib", lib)
//            }
        }
//        for (lib in stdlibLibraries) {
//            if (!lib.endsWith(".so")) {
//                // create symlink
//                val trailingIndex = lib.lastIndexOf(".so") + 3
//                val linkTarget = libDirectory.value.resolve(lib.removeRange(trailingIndex, lib.length))
//                val linkLocation = libDirectory.value.resolve(lib)
//                Files.createLink(linkLocation, linkTarget)
//            }
//        }
        unpackedStdlib = true
    }
}
