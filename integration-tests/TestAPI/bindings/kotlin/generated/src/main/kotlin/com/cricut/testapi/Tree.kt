package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(Tree) -->
 */
data class Tree(
    val value: Long,
    val children: kotlin.collections.List<com.cricut.testapi.Tree>
) {

    companion object {
        init { loadNativeLibs() }
    }
}
