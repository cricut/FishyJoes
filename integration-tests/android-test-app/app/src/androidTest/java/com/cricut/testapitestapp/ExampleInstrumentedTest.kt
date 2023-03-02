package com.cricut.testapitestapp

import androidx.test.ext.junit.runners.AndroidJUnit4

import com.cricut.testapi.*

import org.junit.Test
import org.junit.runner.RunWith

import org.junit.Assert.*

/**
 * Instrumented test, which will execute on an Android device.
 *
 * See [testing documentation](http://d.android.com/tools/testing).
 */
@RunWith(AndroidJUnit4::class)
class ExampleInstrumentedTest {
    @Test
    fun useAppContext() {
          assertEquals(Primitives.maxInt8, 0x7f.toByte())
    }
}