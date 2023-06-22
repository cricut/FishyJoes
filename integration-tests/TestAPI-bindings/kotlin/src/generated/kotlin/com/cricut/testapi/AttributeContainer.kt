package com.cricut.testapi

/**
 * <!-- FishyJoes.exportReference(AttributeContainer) -->
 */
class AttributeContainer private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
    /**
     * <!-- FishyJoes.export(attributes) -->
     */
    val attributes: kotlin.collections.Map<kotlin.String, kotlin.String>
      get() = __jni_get_attributes()
    @JvmName("__jni_get_attributes")
    private external fun __jni_get_attributes(): kotlin.collections.Map<kotlin.String, kotlin.String>

    /**
     * <!-- FishyJoes.export(merge) -->
     */
    fun merge(
        other: com.cricut.testapi.AttributeContainer,
        mergePolicy: com.cricut.testapi.AttributedString.AttributeMergePolicy? = null
    ): kotlin.Unit = __jni_merge(other, mergePolicy)
    @JvmName("__jni_merge")
    private external fun __jni_merge(
        other: com.cricut.testapi.AttributeContainer,
        mergePolicy: com.cricut.testapi.AttributedString.AttributeMergePolicy?
    ): kotlin.Unit

    companion object {
        /**
         * <!-- FishyJoes.export(createEmpty) -->
         */
        fun createEmpty(
        ): com.cricut.testapi.AttributeContainer = __jni_createEmpty()
        @JvmStatic
        @JvmName("__jni_createEmpty")
        private external fun __jni_createEmpty(
        ): com.cricut.testapi.AttributeContainer

        init { loadNativeLibs() }
    }
}
