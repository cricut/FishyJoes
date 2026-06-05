using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.EmojiFun {
    /// <summary>
    /// <para>A playground object for working with emoji.</para>
    /// <!-- FishyJoes.exportReference(EmojiExplorer) -->
    /// </summary>
    public class EmojiExplorer : SwiftReference {
        internal EmojiExplorer(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <para>Emits a hello string.</para>
        /// <para>- Returns: A string containing an emoji hello message.</para>
        /// <!-- FishyJoes.export(hello) -->
        /// </summary>
        public staticstring Hello {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_EmojiFun_EmojiExplorer_hello(Loader.env, out exn).Consume<string>()
                );
            }
        }

        [DllImport("EmojiFun-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_EmojiFun_EmojiExplorer_hello(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <para>A collection of emoji strings known to the object.</para>
        /// <para></para>
        /// <para>This value could contain millions of strings and be very large, incuring a performance cost to communicate to foreign callers, so `enumerateKnown(_:)` is also provided.</para>
        /// <!-- FishyJoes.export(known) -->
        /// </summary>
        publicSystem.Collections.Generic.ISet<string> Known {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_EmojiFun_EmojiExplorer_known(Loader.env, thisHandle.ptr, out exn).Consume<System.Collections.Generic.ISet<string>>()
                );
            }
        }

        [DllImport("EmojiFun-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_EmojiFun_EmojiExplorer_known(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <para>Creates an object that works with emoji strings.</para>
        /// <para>- Parameter count: The number of emoji strings to include in the object's known collection.</para>
        /// <!-- FishyJoes.export(create) -->
        /// </summary>
        public staticCricut.EmojiFun.EmojiExplorer Create(
            nint count
        ) {
            return Check((out CreatedRef _exn) => __iota_EmojiFun_EmojiExplorer_create(Loader.env, count, out _exn)).Consume<Cricut.EmojiFun.EmojiExplorer>();
        }

        [DllImport("EmojiFun-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_EmojiFun_EmojiExplorer_create(
            IntPtr envRef,
            nint count,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Reports a random emoji string built using the object's collection of known emoji strings.</para>
        /// <para>- Returns: A string containing one or more random emoji. In the unusual case that the object knows zero emoji strings, the `hello` string is returned.</para>
        /// <!-- FishyJoes.export(random) -->
        /// </summary>
        publicstring Random(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_EmojiFun_EmojiExplorer_random(Loader.env, _thisHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("EmojiFun-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_EmojiFun_EmojiExplorer_random(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Reports a random emoji string from the object's collection of known emoji strings, ensuring it is only reported once.</para>
        /// <para>- Returns: A random emoji string, or `nil` if all values known to the object have been reported.</para>
        /// <!-- FishyJoes.export(randomUnique) -->
        /// </summary>
        publicstring? RandomUnique(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_EmojiFun_EmojiExplorer_randomUnique(Loader.env, _thisHandle.ptr, out _exn)).Consume<string?>();
        }

        [DllImport("EmojiFun-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_EmojiFun_EmojiExplorer_randomUnique(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Enumerates the emoji strings known to the object.</para>
        /// <para>- Parameter body: A closure to call with each string. On each call to the closure, a string is provided, and the closure should return `true` to continue enumeration or `false` to halt.</para>
        /// <!-- FishyJoes.export(enumerateKnown) -->
        /// </summary>
        publicvoid EnumerateKnown(
            System.Func<string, bool> body
        ) {
            using var _thisHandle = new GCRef(this);
            using var _bodyHandle = new GCRef(body);
            Check((out CreatedRef _exn) => __iota_EmojiFun_EmojiExplorer_enumerateKnown(Loader.env, _thisHandle.ptr, _bodyHandle.ptr, out _exn));
        }

        [DllImport("EmojiFun-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_EmojiFun_EmojiExplorer_enumerateKnown(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef body,
            out CreatedRef exn
        );

        static EmojiExplorer() { _TypeSetup._ensureLoaded(); }
    }
}
