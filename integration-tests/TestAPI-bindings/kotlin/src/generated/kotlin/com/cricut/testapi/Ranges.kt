package com.cricut.testapi

/**
 * <!-- FishyJoes.export(Ranges) -->
 */
sealed class Ranges {

    companion object {
        /**
         * <!-- FishyJoes.export(closedIntRange) -->
         */
        val closedIntRange: ClosedRange<Long>
          get() = __jni_get_closedIntRange()
        @JvmStatic
        @JvmName("__jni_get_closedIntRange")
        private external fun __jni_get_closedIntRange(): ClosedRange<Long>

        /**
         * <!-- FishyJoes.export(echo) -->
         */
        fun echo(
            closedIntRange: ClosedRange<Long>
        ): ClosedRange<Long> = __jni_echo(closedIntRange)
        @JvmStatic
        @JvmName("__jni_echo")
        private external fun __jni_echo(
            closedIntRange: ClosedRange<Long>
        ): ClosedRange<Long>

        init { loadNativeLibs() }
    }
}
