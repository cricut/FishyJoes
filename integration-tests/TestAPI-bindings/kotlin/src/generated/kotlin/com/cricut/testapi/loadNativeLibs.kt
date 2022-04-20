package com.cricut.testapi

import com.cricut.fishyjoes.runtime.LibraryLoader

internal fun loadNativeLibs() {
    LibraryLoader.ensureLoaded("FishyJoesJavaRuntime")
    LibraryLoader.ensureLoaded("TestAPI")
    LibraryLoader.ensureLoaded("TestAPI-java")
}
