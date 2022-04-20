package com.cricut.testapi

import com.cricut.fishyjoes.runtime.LibraryLoader

internal fun loadNativeLibs() {
    LibraryLoader.ensureLoaded("TestAPI")
}
