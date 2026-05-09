package com.cricut.fishyjoes.runtime

import java.io.BufferedOutputStream
import java.io.File
import java.io.FileOutputStream
import java.nio.file.Files

object LibraryLoader {
    /// This should only be implemented by singleton objects, who should call `LibraryLoader.loadRepresentative(this)` in their initializer
    interface LibraryRepresentative {
        fun ensureLoaded()

        val nativeLibs: List<String>
        val dependencies: List<LibraryRepresentative>
    }

    private val libDirectory = lazy {
        val path = Files.createTempDirectory("java-libs-")
        path.toFile().deleteOnExit()
        path
    }

    /// This method must not be called by anyone but the initializer of the representative object.
    /// It relies on the class loader for synchronization.
    fun loadRepresentative(representative: LibraryRepresentative) {
        for (dep in representative.dependencies) {
            dep.ensureLoaded()
        }
        for (nativeLib in representative.nativeLibs) {
            loadLibrary(nativeLib)
        }
    }

    private fun unpackLibrary(libraryName: String): File {
        // Figure out which version of the library to grab
        val osName = System.getProperty("os.name")

        val pathInJar: String
        val prefix: String
        val ext: String

        if (osName.contains("Linux")) {
            pathInJar = "/linux/lib$libraryName.so"
            prefix = "lib"
            ext = "so"
        } else if (osName.contains("Mac")) {
            pathInJar = "/mac/lib$libraryName.dylib"
            prefix = "lib"
            ext = "dylib"
        } else if (osName.contains("Windows")) {
            pathInJar = "/windows/$libraryName.dll"
            prefix = ""
            ext = "dll"
        } else {
            error("$libraryName unsupported OS: $osName")
        }
        return extractLibraryFromJar(javaClass, pathInJar, "$prefix$libraryName.$ext")
    }

    internal fun <T> extractLibraryFromJar(relativeClass: Class<T>, pathInJar: String, outFileName: String): File {
        // Extract dynamic library from jar to temporary file
        val stream = relativeClass.getResourceAsStream(pathInJar)
            ?: error("couldn't find $pathInJar")
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

        if (vendor.contains("Android")) {
            // android libraries are loaded differently
            System.loadLibrary(libraryName)
            return
        }

        println("attempting to load $libraryName")
        val file = unpackLibrary(libraryName)

        // Load library
        System.load(file.absolutePath)

        // Eager cleanup if the OS allows it
        if (osName.contains("Mac")) {
            file.delete()
        }
    }
}
