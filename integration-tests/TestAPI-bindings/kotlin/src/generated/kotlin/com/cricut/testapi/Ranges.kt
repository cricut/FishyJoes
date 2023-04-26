package com.cricut.testapi

/**
 * <!-- FishyJoes.export(Ranges) -->
 */
sealed class Ranges {

    companion object {
        /**
         * <!-- FishyJoes.export(closedIntRange) -->
         */
        val closedIntRange: kotlin.ranges.ClosedRange<Long>
          get() = __jni_get_closedIntRange()
        @JvmStatic
        @JvmName("__jni_get_closedIntRange")
        private external fun __jni_get_closedIntRange(): kotlin.ranges.ClosedRange<Long>

        /**
         * <!-- FishyJoes.export(echo) -->
         */
        fun echo(
            closedIntRange: kotlin.ranges.ClosedRange<Long>
        ): kotlin.ranges.ClosedRange<Long> = __jni_echo(closedIntRange)
        @JvmStatic
        @JvmName("__jni_echo")
        private external fun __jni_echo(
            closedIntRange: kotlin.ranges.ClosedRange<Long>
        ): kotlin.ranges.ClosedRange<Long>

        init { loadNativeLibs() }
    }
}
