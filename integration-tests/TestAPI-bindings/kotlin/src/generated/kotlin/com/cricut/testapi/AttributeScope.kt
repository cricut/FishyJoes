package com.cricut.testapi

/**
 * <!-- FishyJoes.exportReference(AttributeScope) -->
 */
class AttributeScope private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {

    companion object {
        init { loadNativeLibs() }
    }
}
