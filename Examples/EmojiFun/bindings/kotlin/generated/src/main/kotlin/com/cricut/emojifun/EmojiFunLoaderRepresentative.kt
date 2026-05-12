package com.cricut.emojifun

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

public object EmojiFunLoaderRepresentative: LibraryLoader.LibraryRepresentative {
    override fun ensureLoaded() {}
    override val nativeLibs = listOf("EmojiFun", "EmojiFun-java")
    override val dependencies: List<LibraryLoader.LibraryRepresentative> = listOf(
        FishyJoesRuntimeRepresentative
    )

    init {
        LibraryLoader.loadRepresentative(this)
    }
}
internal fun loadNativeLibs() {
    EmojiFunLoaderRepresentative.ensureLoaded()
}
