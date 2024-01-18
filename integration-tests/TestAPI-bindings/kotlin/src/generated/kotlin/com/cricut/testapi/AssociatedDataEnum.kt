package com.cricut.testapi

/**
 * <!-- FishyJoes.export(AssociatedDataEnum) -->
 */
sealed class AssociatedDataEnum {
    data class Thing(
        var value: Long
    ) : AssociatedDataEnum()

    companion object {
        init { loadNativeLibs() }
    }
}
