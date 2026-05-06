package com.cricut.barebones

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

public object BareBonesLoaderRepresentative: LibraryLoader.LibraryRepresentative {
    override fun ensureLoaded() {}
    override val nativeLibs = listOf("BareBones", "BareBones-java")
    override val dependencies: List<LibraryLoader.LibraryRepresentative> = listOf(
        FishyJoesRuntimeRepresentative
    )

    init {
        LibraryLoader.loadRepresentative(this)
    }
}
internal fun loadNativeLibs() {
    BareBonesLoaderRepresentative.ensureLoaded()
}
