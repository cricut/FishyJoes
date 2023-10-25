//
//  TypeSetup.swift
//  FishyJoes
//
//  Created by Matt Stoker on 6/26/23.
//

import Foundation

@_cdecl("JNI_OnLoad")
public func jniOnLoad(vm: UnsafeMutablePointer<JavaVM?>, reserved: UnsafeMutableRawPointer) -> jint {
    var envRaw: UnsafeMutableRawPointer?
    guard vm.pointee!.pointee.GetEnv(vm, &envRaw, JNI_VERSION_1_4) == JNI_OK else {
        fatalError("Couldn't obtain jvm environment")
    }
    let env = UnsafeMutablePointer<JNIEnv?>(OpaquePointer(envRaw))
    return FishyJoesJavaRuntime.callbackBody(env!) { env in
        // print("setting up Void...")
        try VoidConverter.javaSetup(env: env)
        // print("setting up Bool...")
        try Bool.javaSetup(env: env)
        // print("setting up UInt8...")
        try UInt8.javaSetup(env: env)
        // print("setting up UInt16...")
        try UInt16.javaSetup(env: env)
        // print("setting up UInt32...")
        try UInt32.javaSetup(env: env)
        // print("setting up UInt64...")
        try UInt64.javaSetup(env: env)
        // print("setting up UInt...")
        try UInt.javaSetup(env: env)
        // print("setting up Int8...")
        try Int8.javaSetup(env: env)
        // print("setting up Int16...")
        try Int16.javaSetup(env: env)
        // print("setting up Int32...")
        try Int32.javaSetup(env: env)
        // print("setting up Int64...")
        try Int64.javaSetup(env: env)
        // print("setting up Int...")
        try Int.javaSetup(env: env)
        // print("setting up Float...")
        try Float.javaSetup(env: env)
        // print("setting up Double...")
        try Double.javaSetup(env: env)
        // print("setting up String...")
        try String.javaSetup(env: env)
        // print("setting up Data...")
        try Data.javaSetup(env: env)
        // print("setting up AttributedString...")
        try AttributedString.javaSetup(env: env)
        return JNI_VERSION_1_4
    }
}
