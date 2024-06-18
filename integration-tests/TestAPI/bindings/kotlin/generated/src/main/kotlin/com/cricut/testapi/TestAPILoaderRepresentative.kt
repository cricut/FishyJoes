package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

public object TestAPILoaderRepresentative: LibraryLoader.LibraryRepresentative {
    override fun ensureLoaded() {}
    override val nativeLibs = listOf("TestAPI", "TestAPI-java")
    override val dependencies: List<LibraryLoader.LibraryRepresentative> = listOf(
        FishyJoesRuntimeRepresentative
    )

    init {
        LibraryLoader.loadRepresentative(this)
    }
}
internal fun loadNativeLibs() {
    TestAPILoaderRepresentative.ensureLoaded()
}
