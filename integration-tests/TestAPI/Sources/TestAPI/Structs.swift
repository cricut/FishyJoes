//
//  Structs.swift
//  FishyJoes
//
//  Created by Matt Stoker on 12/22/21.
//

/// <!-- FishyJoes.export(Structs) -->
public enum Structs {
    /// <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
    public struct MemberwiseStruct: Hashable {
        public private(set) var immutable = "Eternal"
        public var mutable = "Fickle"

        // NOTE: Structs exposed by value must posess a member-wise initializer in order for the types to be instantiated in other language contexts
        public init(immutable: String, mutable: String) {
            self.immutable = immutable
            self.mutable = mutable
        }

        /// <!-- FishyJoes.export(create) -->
        public init() { }

        /// <!-- FishyJoes.export(asyncGetMutable) -->
        public func asyncGetMutable() async -> String {
//            fatalError("Swift: \(#line) \(#function)")
            await Task.yield()
            return mutable
        }
    }

    /// <!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->
    public struct ReferenceStruct: Hashable {
        /// <!-- FishyJoes.export(immutable) -->
        public private(set) var immutable = "Eternal"
        /// <!-- FishyJoes.export(mutable) -->
        public var mutable = "Fickle"

        /// <!-- FishyJoes.export(create) -->
        public init() { }

        /// <!-- FishyJoes.export(asyncGetMutable) -->
        public func asyncGetMutable() async -> String {
            await Task.yield()
            return mutable
        }
    }

    /// <!-- FishyJoes.export(Structs.MutableStruct) -->
    public struct MutableStruct: Hashable {
        public var i = 0

        /// <!-- FishyJoes.export(create) -->
        public init() {}

        public init(i: Int = 0) {
            self.i = i
        }

        /// <!-- FishyJoes.export(increment) -->
        public mutating func increment() {
            i += 1
        }

        /// <!-- FishyJoes.export(incrementAsync) -->
        public mutating func incrementAsync() async {
            i += 1
        }

        /// <!-- FishyJoes.export(asyncGetI) -->
        public func asyncGetI() async -> Int {
            await Task.yield()
            return i
        }
    }
    
    /// <!-- FishyJoes.export(Structs.TwentyItemStruct) -->
    public struct TwentyItemStruct: Hashable {
        public var a = "a"
        public var b = "b"
        public var c = "c"
        public var d = "d"
        public var e = "e"
        public var f = "f"
        public var g = "g"
        public var h = "h"
        public var i = "i"
        public var j = "j"
        public var k = "k"
        public var l = "l"
        public var m = "m"
        public var n = "n"
        public var o = "o"
        public var p = "p"
        public var q = "q"
        public var r = "r"
        public var s = "s"
        public var t = "t"
        
        public init(
            a: String = "a",
            b: String = "b",
            c: String = "c",
            d: String = "d",
            e: String = "e",
            f: String = "f",
            g: String = "g",
            h: String = "h",
            i: String = "i",
            j: String = "j",
            k: String = "k",
            l: String = "l",
            m: String = "m",
            n: String = "n",
            o: String = "o",
            p: String = "p",
            q: String = "q",
            r: String = "r",
            s: String = "s",
            t: String = "t"
        ) {
            self.a = a
            self.b = b
            self.c = c
            self.d = d
            self.e = e
            self.f = f
            self.g = g
            self.h = h
            self.i = i
            self.j = j
            self.k = k
            self.l = l
            self.m = m
            self.n = n
            self.o = o
            self.p = p
            self.q = q
            self.r = r
            self.s = s
            self.t = t
        }
    }
}

/// <!-- FishyJoes.export(EmptyStruct) -->
public struct EmptyStruct {
    // no stored properties!

    /// <!-- FishyJoes.export(create) -->
    public init() {}

    /// <!-- FishyJoes.export(tutu) -->
    public var tutu: Int {
        35671
    }

    /// <!-- FishyJoes.export(tatiana) -->
    public var tata: String {
        "Toodles! ta ta for now..."
    }

    /// <!-- FishyJoes.export(aap) -->
    public func aap() -> String {
        "The Netherlands"
    }

    /// <!-- FishyJoes.export(zxccxz) -->
    public func zxc() -> String {
        "Cambridge University (England)"
    }
}

/// <!-- FishyJoes.export(EmptyStruct2) -->
public struct EmptyStruct2 {
    // no stored properties!

    /// <!-- FishyJoes.export(create) -->
    public init() {}

    /// <!-- FishyJoes.export(tutu) -->
    public var tutu: Int {
        12897
    }

    /// <!-- FishyJoes.export(tatiana) -->
    public var tata: String {
        "Arrivederci"
    }

    /// <!-- FishyJoes.export(aap) -->
    public func aap() -> String {
        "The Netherlands2"
    }

    /// <!-- FishyJoes.export(zxccxz) -->
    public func zxc() -> String {
        "Cambridge University (England)2"
    }
}
