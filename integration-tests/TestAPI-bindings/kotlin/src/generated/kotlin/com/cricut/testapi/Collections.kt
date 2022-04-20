package com.cricut.testapi

/**
 * <!-- FishyJoes.exportReference(Collections) -->
 */
class Collections private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {

    companion object {
        /**
         * <!-- FishyJoes.export(arrayOfInt) -->
         */
        val arrayOfInt: kotlin.collections.List<Long>
          get() = __jni_get_arrayOfInt()
        @JvmStatic
        @JvmName("__jni_get_arrayOfInt")
        private external fun __jni_get_arrayOfInt(): kotlin.collections.List<Long>

        /**
         * <!-- FishyJoes.export(setOfInt) -->
         */
        val setOfInt: kotlin.collections.Set<Long>
          get() = __jni_get_setOfInt()
        @JvmStatic
        @JvmName("__jni_get_setOfInt")
        private external fun __jni_get_setOfInt(): kotlin.collections.Set<Long>

        /**
         * <!-- FishyJoes.export(dictionaryOfIntToInt) -->
         */
        val dictionaryOfIntToInt: kotlin.collections.Map<Long, Long>
          get() = __jni_get_dictionaryOfIntToInt()
        @JvmStatic
        @JvmName("__jni_get_dictionaryOfIntToInt")
        private external fun __jni_get_dictionaryOfIntToInt(): kotlin.collections.Map<Long, Long>

        /**
         * <!-- FishyJoes.export(maybeArrayOfInt) -->
         */
        val maybeArrayOfInt: kotlin.collections.List<Long>?
          get() = __jni_get_maybeArrayOfInt()
        @JvmStatic
        @JvmName("__jni_get_maybeArrayOfInt")
        private external fun __jni_get_maybeArrayOfInt(): kotlin.collections.List<Long>?

        /**
         * <!-- FishyJoes.export(maybeSetOfInt) -->
         */
        val maybeSetOfInt: kotlin.collections.Set<Long>?
          get() = __jni_get_maybeSetOfInt()
        @JvmStatic
        @JvmName("__jni_get_maybeSetOfInt")
        private external fun __jni_get_maybeSetOfInt(): kotlin.collections.Set<Long>?

        /**
         * <!-- FishyJoes.export(maybeDictionaryOfIntToInt) -->
         */
        val maybeDictionaryOfIntToInt: kotlin.collections.Map<Long, Long>?
          get() = __jni_get_maybeDictionaryOfIntToInt()
        @JvmStatic
        @JvmName("__jni_get_maybeDictionaryOfIntToInt")
        private external fun __jni_get_maybeDictionaryOfIntToInt(): kotlin.collections.Map<Long, Long>?

        /**
         * <!-- FishyJoes.export(maybeArrayOfMaybeInt) -->
         */
        val maybeArrayOfMaybeInt: kotlin.collections.List<Long?>?
          get() = __jni_get_maybeArrayOfMaybeInt()
        @JvmStatic
        @JvmName("__jni_get_maybeArrayOfMaybeInt")
        private external fun __jni_get_maybeArrayOfMaybeInt(): kotlin.collections.List<Long?>?

        /**
         * <!-- FishyJoes.export(maybeSetOfMaybeInt) -->
         */
        val maybeSetOfMaybeInt: kotlin.collections.Set<Long?>?
          get() = __jni_get_maybeSetOfMaybeInt()
        @JvmStatic
        @JvmName("__jni_get_maybeSetOfMaybeInt")
        private external fun __jni_get_maybeSetOfMaybeInt(): kotlin.collections.Set<Long?>?

        /**
         * <!-- FishyJoes.export(maybeDictionaryOfMaybeIntToMaybeInt) -->
         */
        val maybeDictionaryOfMaybeIntToMaybeInt: kotlin.collections.Map<Long?, Long?>?
          get() = __jni_get_maybeDictionaryOfMaybeIntToMaybeInt()
        @JvmStatic
        @JvmName("__jni_get_maybeDictionaryOfMaybeIntToMaybeInt")
        private external fun __jni_get_maybeDictionaryOfMaybeIntToMaybeInt(): kotlin.collections.Map<Long?, Long?>?

        /**
         * <!-- FishyJoes.export(defaultCollectionHolder) -->
         */
        val defaultCollectionHolder: com.cricut.testapi.Collections.CollectionHolder
          get() = __jni_get_defaultCollectionHolder()
        @JvmStatic
        @JvmName("__jni_get_defaultCollectionHolder")
        private external fun __jni_get_defaultCollectionHolder(): com.cricut.testapi.Collections.CollectionHolder

        /**
         * <!-- FishyJoes.export(echoArrayOfInt) -->
         */
        fun echoArrayOfInt(
            arrayOfInt: kotlin.collections.List<Long>
        ): kotlin.collections.List<Long> = __jni_echoArrayOfInt(arrayOfInt)
        @JvmStatic
        @JvmName("__jni_echoArrayOfInt")
        private external fun __jni_echoArrayOfInt(
            arrayOfInt: kotlin.collections.List<Long>
        ): kotlin.collections.List<Long>

        /**
         * <!-- FishyJoes.export(echoSetOfInt) -->
         */
        fun echoSetOfInt(
            setOfInt: kotlin.collections.Set<Long>
        ): kotlin.collections.Set<Long> = __jni_echoSetOfInt(setOfInt)
        @JvmStatic
        @JvmName("__jni_echoSetOfInt")
        private external fun __jni_echoSetOfInt(
            setOfInt: kotlin.collections.Set<Long>
        ): kotlin.collections.Set<Long>

        /**
         * <!-- FishyJoes.export(echoDictionaryOfIntToInt) -->
         */
        fun echoDictionaryOfIntToInt(
            dictionaryOfIntToInt: kotlin.collections.Map<Long, Long>
        ): kotlin.collections.Map<Long, Long> = __jni_echoDictionaryOfIntToInt(dictionaryOfIntToInt)
        @JvmStatic
        @JvmName("__jni_echoDictionaryOfIntToInt")
        private external fun __jni_echoDictionaryOfIntToInt(
            dictionaryOfIntToInt: kotlin.collections.Map<Long, Long>
        ): kotlin.collections.Map<Long, Long>

        /**
         * <!-- FishyJoes.export(echoMaybeArrayOfMaybeInt) -->
         */
        fun echoMaybeArrayOfMaybeInt(
            maybeArrayOfMaybeInt: kotlin.collections.List<Long?>?
        ): kotlin.collections.List<Long?>? = __jni_echoMaybeArrayOfMaybeInt(maybeArrayOfMaybeInt)
        @JvmStatic
        @JvmName("__jni_echoMaybeArrayOfMaybeInt")
        private external fun __jni_echoMaybeArrayOfMaybeInt(
            maybeArrayOfMaybeInt: kotlin.collections.List<Long?>?
        ): kotlin.collections.List<Long?>?

        /**
         * <!-- FishyJoes.export(echoMaybeSetOfMaybeInt) -->
         */
        fun echoMaybeSetOfMaybeInt(
            maybeSetOfMaybeInt: kotlin.collections.Set<Long?>?
        ): kotlin.collections.Set<Long?>? = __jni_echoMaybeSetOfMaybeInt(maybeSetOfMaybeInt)
        @JvmStatic
        @JvmName("__jni_echoMaybeSetOfMaybeInt")
        private external fun __jni_echoMaybeSetOfMaybeInt(
            maybeSetOfMaybeInt: kotlin.collections.Set<Long?>?
        ): kotlin.collections.Set<Long?>?

        /**
         * <!-- FishyJoes.export(echoMaybeDictionaryOfMaybeIntToMaybeInt) -->
         */
        fun echoMaybeDictionaryOfMaybeIntToMaybeInt(
            maybeDictionaryOfMaybeIntToMaybeInt: kotlin.collections.Map<Long?, Long?>?
        ): kotlin.collections.Map<Long?, Long?>? = __jni_echoMaybeDictionaryOfMaybeIntToMaybeInt(maybeDictionaryOfMaybeIntToMaybeInt)
        @JvmStatic
        @JvmName("__jni_echoMaybeDictionaryOfMaybeIntToMaybeInt")
        private external fun __jni_echoMaybeDictionaryOfMaybeIntToMaybeInt(
            maybeDictionaryOfMaybeIntToMaybeInt: kotlin.collections.Map<Long?, Long?>?
        ): kotlin.collections.Map<Long?, Long?>?

        init { loadNativeLibs() }
    }

    /**
     * <!-- FishyJoes.export(Collections.CollectionHolder) -->
     */
    data class CollectionHolder(
        var boolArray: kotlin.collections.List<Boolean>,
        var boolSet: kotlin.collections.Set<Boolean>,
        var boolDictionary: kotlin.collections.Map<Boolean, Boolean>,
        var integerArray: kotlin.collections.List<Long>,
        var integerSet: kotlin.collections.Set<Long>,
        var integerDictionary: kotlin.collections.Map<Long, Long>,
        var stringArray: kotlin.collections.List<String>,
        var stringSet: kotlin.collections.Set<String>,
        var stringDictionary: kotlin.collections.Map<String, String>
    )
     {

        companion object {
            /**
             * <!-- FishyJoes.export(staticPropery) -->
             */
            val staticPropery: kotlin.collections.List<Long?>
              get() = __jni_get_staticPropery()
            @JvmStatic
            @JvmName("__jni_get_staticPropery")
            private external fun __jni_get_staticPropery(): kotlin.collections.List<Long?>

            /**
             * <!-- FishyJoes.export(staticMutablePropery) -->
             */
            var staticMutablePropery: kotlin.collections.List<Long?>
              get() = __jni_get_staticMutablePropery()
              set(value) { __jni_set_staticMutablePropery(value) } 
            @JvmStatic
            @JvmName("__jni_get_staticMutablePropery")
            private external fun __jni_get_staticMutablePropery(): kotlin.collections.List<Long?>
            @JvmStatic
            @JvmName("__jni_set_staticMutablePropery")
            private external fun __jni_set_staticMutablePropery(newValue: kotlin.collections.List<Long?>)

            init { loadNativeLibs() }
        }
    }
}
