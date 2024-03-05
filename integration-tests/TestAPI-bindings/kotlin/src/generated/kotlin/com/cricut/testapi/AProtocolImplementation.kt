package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(AProtocolImplementation, conformances: [AProtocol]) -->
 */
data class AProtocolImplementation(
    override var foo: Long
): AProtocol {

    companion object {
        init { loadNativeLibs() }
    }
}
