package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * A type whose name matches a case of ``ShadowBox``. Inside ShadowBox's
 * generated Python class body, the case-type attribute (`Shade: ClassVar[...]`)
 * shadows this type's import, so annotations meaning this type must resolve
 * through a module-level alias in the generated stub.
 * <!-- FishyJoes.export(Shade) -->
 */
data class Shade(
    var darkness: Double
) {

    companion object {
        init { loadNativeLibs() }
    }
}
