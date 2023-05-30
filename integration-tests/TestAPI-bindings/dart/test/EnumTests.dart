// package com.cricut.testapi

// import org.junit.jupiter.api.Test
// import org.junit.jupiter.api.Assertions.*
// import org.junit.jupiter.api.assertThrows

// class EnumTests {
//     @Test
//     fun testEmptyEnum() {
//         assertThrows<Error> {
//             when (EmptyEnum.notGoingToHappen()) {
//                 else -> assert(false)
//             }
//         }
//     }

//     @Test
//     fun testSimpleEnum() {
//         assertEquals(0xff0000, SimpleEnum.Red.hex)
//         assertEquals(0x00ff00, SimpleEnum.Green.hex)
//         assertEquals(0x0000ff, SimpleEnum.Blue.hex)
//         assertEquals(SimpleEnum.Red, SimpleEnum.pickAColor(0))
//         assertEquals(SimpleEnum.Green, SimpleEnum.pickAColor(1))
//         assertEquals(SimpleEnum.Blue, SimpleEnum.pickAColor(2))
//     }

//     @Test
//     fun testAssociatedDataEnum() {
//         fun shape1(x: Long) = AssociatedDataEnum.Thing(x)
//         fun shape2(x: String, y: String, z: Long) = AssociatedDataEnum.Bar(x, AssociatedDataEnum.Other(y, z))

//         assertEquals(4, shape1(4).intValue)
//         assertEquals(11, shape2("hello", "world", 8).intValue)
//         assertEquals(shape1(9), shape1(2).plus(shape2("x", "y", 4)))
//         assertEquals(shape2("y","z", 7), shape2("y", "z", 2).plus(shape1(5)))
//     }
// }
