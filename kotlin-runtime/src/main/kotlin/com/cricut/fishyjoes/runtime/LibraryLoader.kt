package com.cricut.fishyjoes.runtime

import java.io.BufferedOutputStream
import java.io.File
import java.io.FileOutputStream
import java.nio.file.Files

object LibraryLoader {
    private var startedLoad = mutableSetOf<String>()
    private val libDirectory = lazy {
        val path = Files.createTempDirectory("java-libs-")
        path.toFile().deleteOnExit()
        path
    }

    fun ensureLoaded(libraryName: String) {
        synchronized(this) {
            if (startedLoad.contains(libraryName)) { return }
            startedLoad.add(libraryName)
            loadLibrary(libraryName)
        }
    }

    private fun loadLibrary(libraryName: String) {
        // Figure out which version of the library to grab
        val osName = System.getProperty("os.name")
        val vendor = System.getProperty("java.vendor")

        if (vendor.contains("Android")) {
            // android libraries are loaded differently
            System.loadLibrary("$libraryName")
            return
        }

        val jarPath: String
        val ext: String

        if (osName.contains("Linux")) {
            jarPath = "/linux/lib$libraryName.so"
            ext = "so"
        } else if (osName.contains("Mac")) {
            jarPath = "/mac/lib$libraryName.dylib"
            ext = "dylib"
        } else if (osName.contains("Windows")) {
            jarPath = "/windows/$libraryName.dll"
            ext = "dll"
        } else {
            error("$libraryName unsupported OS: $osName")
        }

        // Extract dynamic library from jar to temporary file
        val stream = javaClass.getResourceAsStream( jarPath)
            ?: error("couldn't find $jarPath")
        val file = libDirectory.value.resolve("lib$libraryName.$ext").toFile()t
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
        out.close()

        // Load library
        System.load(file.absolutePath)

        // Eager cleanup if the OS allows it
        if (!osName.contains("Windows")) {
            file.delete()
        }
    }
}
