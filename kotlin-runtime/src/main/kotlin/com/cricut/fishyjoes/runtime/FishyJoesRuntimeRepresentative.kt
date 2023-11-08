package com.cricut.fishyjoes.runtime

import java.io.BufferedOutputStream
import java.io.File
import java.io.FileOutputStream
import java.nio.file.Files
import com.cricut.androidswiftruntime.SwiftStdlib

object FishyJoesRuntimeRepresentative: LibraryLoader.LibraryRepresentative {
    override fun ensureLoaded() {}
    override val nativeLibs: List<String>
    override val dependencies = listOf<LibraryLoader.LibraryRepresentative>()

    init {
        unpackStdLib()
        val vendor = System.getProperty("java.vendor")
        if (vendor.contains("Android")) {
            // dynamic loader needs help with these two for unknown reasons
            nativeLibs = listOf("icuuc", "icui18n", "FishyJoesJavaRuntime")
        } else {
            nativeLibs = listOf("FishyJoesJavaRuntime")
        }
        LibraryLoader.loadRepresentative(this)
    }

    private fun unpackStdLib() {
        val osName = System.getProperty("os.name")
        val vendor = System.getProperty("java.vendor")

        if (!osName.contains("Linux") || vendor.contains("Android")) { return }

        val stdlibLibraries = SwiftStdlib.javaClass.getResource("/linux/stdlib.txt")!!
            .readText()
            .split('\n')
            .filter { it.isNotEmpty() }

        for (lib in stdlibLibraries) {
            // TODO: put back in this code once we have correct symlinks in place
//            if (lib.endsWith(".so")) {
//                // copy file
            LibraryLoader.extractLibraryFromJar(SwiftStdlib.javaClass, "/linux/$lib", lib)
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
    }
}
internal fun loadNativeLibs() {
    FishyJoesRuntimeRepresentative.ensureLoaded()
}
