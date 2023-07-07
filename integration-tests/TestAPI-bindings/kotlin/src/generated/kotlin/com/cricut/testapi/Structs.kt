package com.cricut.testapi

/**
 * <!-- FishyJoes.export(Structs) -->
 */
sealed class Structs {

    companion object {
        init { loadNativeLibs() }
    }

    /**
     * <!-- FishyJoes.export(Structs.MutableStruct) -->
     */
    data class MutableStruct(
        var i: Long
    )
     {
        /**
         * <!-- FishyJoes.export(increment) -->
         */
        fun increment(
        ): kotlin.Unit = __jni_increment()
        @JvmName("__jni_increment")
        private external fun __jni_increment(
        ): kotlin.Unit

        /**
         * <!-- FishyJoes.export(incrementAsync) -->
         */
        fun incrementAsync(
            _asyncCallback: ((kotlin.Unit) -> kotlin.Unit)
        ) = __jni_incrementAsync(_asyncCallback)
        @JvmName("__jni_incrementAsync")
        private external fun __jni_incrementAsync(
            _asyncCallback: ((kotlin.Unit) -> kotlin.Unit)
        )

        companion object {
            /**
             * <!-- FishyJoes.export(create) -->
             */
            fun create(
            ): com.cricut.testapi.Structs.MutableStruct = __jni_create()
            @JvmStatic
            @JvmName("__jni_create")
            private external fun __jni_create(
            ): com.cricut.testapi.Structs.MutableStruct

            init { loadNativeLibs() }
        }
    }

    /**
     * <!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->
     */
    class ReferenceStruct private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
        /**
         * <!-- FishyJoes.export(immutable) -->
         */
        var immutable: kotlin.String
          get() = __jni_get_immutable()
          set(value) { __jni_set_immutable(value) } 
        @JvmName("__jni_get_immutable")
        private external fun __jni_get_immutable(): kotlin.String
        @JvmName("__jni_set_immutable")
        private external fun __jni_set_immutable(newValue: kotlin.String)

        /**
         * <!-- FishyJoes.export(mutable) -->
         */
        var mutable: kotlin.String
          get() = __jni_get_mutable()
          set(value) { __jni_set_mutable(value) } 
        @JvmName("__jni_get_mutable")
        private external fun __jni_get_mutable(): kotlin.String
        @JvmName("__jni_set_mutable")
        private external fun __jni_set_mutable(newValue: kotlin.String)

        override fun equals(
            other: Any?
        ): Boolean = (other is com.cricut.testapi.Structs.ReferenceStruct) && __jni_swiftEquals(this, other)

        override fun hashCode(
        ): Int = __jni_hashCode()
        @JvmName("__jni_hashCode")
        private external fun __jni_hashCode(
        ): Int

        companion object {
            /**
             * <!-- FishyJoes.export(create) -->
             */
            fun create(
            ): com.cricut.testapi.Structs.ReferenceStruct = __jni_create()
            @JvmStatic
            @JvmName("__jni_create")
            private external fun __jni_create(
            ): com.cricut.testapi.Structs.ReferenceStruct

            fun swiftEquals(
                lhs: com.cricut.testapi.Structs.ReferenceStruct,
                rhs: com.cricut.testapi.Structs.ReferenceStruct
            ): Boolean = __jni_swiftEquals(lhs, rhs)
            @JvmStatic
            @JvmName("__jni_swiftEquals")
            private external fun __jni_swiftEquals(
                lhs: com.cricut.testapi.Structs.ReferenceStruct,
                rhs: com.cricut.testapi.Structs.ReferenceStruct
            ): Boolean

            init { loadNativeLibs() }
        }
    }

    /**
     * <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
     */
    data class MemberwiseStruct(
        var immutable: kotlin.String,
        var mutable: kotlin.String
    )
     {

        companion object {
            /**
             * <!-- FishyJoes.export(create) -->
             */
            fun create(
            ): com.cricut.testapi.Structs.MemberwiseStruct = __jni_create()
            @JvmStatic
            @JvmName("__jni_create")
            private external fun __jni_create(
            ): com.cricut.testapi.Structs.MemberwiseStruct

            init { loadNativeLibs() }
        }
    }
}
