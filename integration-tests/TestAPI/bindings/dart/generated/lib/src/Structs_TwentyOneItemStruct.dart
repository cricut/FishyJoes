import './_exports.dart' as TestAPI;
import 'dart:ffi' as ffi;
import 'dart:typed_data' as typed_data;
import 'package:collection/collection.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;
import 'package:fishyjoes_dart/runtime.dart';
import 'package:fishyjoes_dart/utilities.dart' as utils;
import 'package:tuple/tuple.dart' as tuple;

// ignore_for_file: unused_import
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: no_leading_underscores_for_local_identifiers
// ignore_for_file: library_prefixes
// ignore_for_file: file_names
// ignore_for_file: annotate_overrides

/// <!-- FishyJoes.export(Structs.TwentyOneItemStruct) -->
class Structs_TwentyOneItemStruct {
    String a;
    String b;
    String c;
    String d;
    String e;
    String f;
    String g;
    String h;
    String i;
    String j;
    String k;
    String l;
    String m;
    String n;
    String o;
    String p;
    String q;
    String r;
    String s;
    String t;
    String u;

    Structs_TwentyOneItemStruct({
        required String a,
        required String b,
        required String c,
        required String d,
        required String e,
        required String f,
        required String g,
        required String h,
        required String i,
        required String j,
        required String k,
        required String l,
        required String m,
        required String n,
        required String o,
        required String p,
        required String q,
        required String r,
        required String s,
        required String t,
        required String u
    }):
        this.a = a,
        this.b = b,
        this.c = c,
        this.d = d,
        this.e = e,
        this.f = f,
        this.g = g,
        this.h = h,
        this.i = i,
        this.j = j,
        this.k = k,
        this.l = l,
        this.m = m,
        this.n = n,
        this.o = o,
        this.p = p,
        this.q = q,
        this.r = r,
        this.s = s,
        this.t = t,
        this.u = u;

    static CreatedRef ffi_constructor(
        ConsumedRef a,
        ConsumedRef b,
        ConsumedRef c,
        ConsumedRef d,
        ConsumedRef e,
        ConsumedRef f,
        ConsumedRef g,
        ConsumedRef h,
        ConsumedRef i,
        ConsumedRef j,
        ConsumedRef k,
        ConsumedRef l,
        ConsumedRef m,
        ConsumedRef n,
        ConsumedRef o,
        ConsumedRef p,
        ConsumedRef q,
        ConsumedRef r,
        ConsumedRef s,
        ConsumedRef t,
        ConsumedRef u,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(Structs_TwentyOneItemStruct(
            a: consumeRef(a),
            b: consumeRef(b),
            c: consumeRef(c),
            d: consumeRef(d),
            e: consumeRef(e),
            f: consumeRef(f),
            g: consumeRef(g),
            h: consumeRef(h),
            i: consumeRef(i),
            j: consumeRef(j),
            k: consumeRef(k),
            l: consumeRef(l),
            m: consumeRef(m),
            n: consumeRef(n),
            o: consumeRef(o),
            p: consumeRef(p),
            q: consumeRef(q),
            r: consumeRef(r),
            s: consumeRef(s),
            t: consumeRef(t),
            u: consumeRef(u),
        ))
    );
    @override
    String toString() => 'TestAPI.Structs_TwentyOneItemStruct(a: $a, b: $b, c: $c, d: $d, e: $e, f: $f, g: $g, h: $h, i: $i, j: $j, k: $k, l: $l, m: $m, n: $n, o: $o, p: $p, q: $q, r: $r, s: $s, t: $t, u: $u)';

    static CreatedRef ffi_get_a(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).a
        )
    );
    static void ffi_set_a(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).a = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_b(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).b
        )
    );
    static void ffi_set_b(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).b = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_c(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).c
        )
    );
    static void ffi_set_c(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).c = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_d(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).d
        )
    );
    static void ffi_set_d(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).d = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_e(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).e
        )
    );
    static void ffi_set_e(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).e = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_f(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).f
        )
    );
    static void ffi_set_f(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).f = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_g(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).g
        )
    );
    static void ffi_set_g(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).g = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_h(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).h
        )
    );
    static void ffi_set_h(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).h = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_i(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).i
        )
    );
    static void ffi_set_i(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).i = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_j(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).j
        )
    );
    static void ffi_set_j(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).j = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_k(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).k
        )
    );
    static void ffi_set_k(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).k = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_l(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).l
        )
    );
    static void ffi_set_l(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).l = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_m(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).m
        )
    );
    static void ffi_set_m(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).m = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_n(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).n
        )
    );
    static void ffi_set_n(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).n = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_o(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).o
        )
    );
    static void ffi_set_o(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).o = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_p(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).p
        )
    );
    static void ffi_set_p(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).p = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_q(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).q
        )
    );
    static void ffi_set_q(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).q = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_r(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).r
        )
    );
    static void ffi_set_r(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).r = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_s(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).s
        )
    );
    static void ffi_set_s(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).s = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_t(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).t
        )
    );
    static void ffi_set_t(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).t = consumeRef<String>(newValue);
    });

    static CreatedRef ffi_get_u(
        UnownedRef obj,
        OutCreatedRef exn
    ) => catchingRef(exn, () =>
        createRef(
            peekRef<Structs_TwentyOneItemStruct>(obj).u
        )
    );
    static void ffi_set_u(
        UnownedRef obj,
        ConsumedRef newValue,
        OutCreatedRef exn
    ) => catching(exn, () {
        peekRef<Structs_TwentyOneItemStruct>(obj).u = consumeRef<String>(newValue);
    });

    @override
    bool operator ==(Object other) {
        return identical(other, this) ||
        (
            other.runtimeType == runtimeType &&
            other is Structs_TwentyOneItemStruct &&
            (
                const DeepCollectionEquality().equals(other.a, a) &&
                const DeepCollectionEquality().equals(other.b, b) &&
                const DeepCollectionEquality().equals(other.c, c) &&
                const DeepCollectionEquality().equals(other.d, d) &&
                const DeepCollectionEquality().equals(other.e, e) &&
                const DeepCollectionEquality().equals(other.f, f) &&
                const DeepCollectionEquality().equals(other.g, g) &&
                const DeepCollectionEquality().equals(other.h, h) &&
                const DeepCollectionEquality().equals(other.i, i) &&
                const DeepCollectionEquality().equals(other.j, j) &&
                const DeepCollectionEquality().equals(other.k, k) &&
                const DeepCollectionEquality().equals(other.l, l) &&
                const DeepCollectionEquality().equals(other.m, m) &&
                const DeepCollectionEquality().equals(other.n, n) &&
                const DeepCollectionEquality().equals(other.o, o) &&
                const DeepCollectionEquality().equals(other.p, p) &&
                const DeepCollectionEquality().equals(other.q, q) &&
                const DeepCollectionEquality().equals(other.r, r) &&
                const DeepCollectionEquality().equals(other.s, s) &&
                const DeepCollectionEquality().equals(other.t, t) &&
                const DeepCollectionEquality().equals(other.u, u)
            )
        );
    }

    @override
    int get hashCode => Object.hash(
        runtimeType,
        Object.hash(
            const DeepCollectionEquality().hash(a),
            const DeepCollectionEquality().hash(b),
            const DeepCollectionEquality().hash(c),
            const DeepCollectionEquality().hash(d),
            const DeepCollectionEquality().hash(e),
            const DeepCollectionEquality().hash(f),
            const DeepCollectionEquality().hash(g),
            const DeepCollectionEquality().hash(h),
            const DeepCollectionEquality().hash(i),
            const DeepCollectionEquality().hash(j),
            const DeepCollectionEquality().hash(k),
            const DeepCollectionEquality().hash(l),
            const DeepCollectionEquality().hash(m),
            const DeepCollectionEquality().hash(n),
            const DeepCollectionEquality().hash(o),
            const DeepCollectionEquality().hash(p),
            const DeepCollectionEquality().hash(q),
            const DeepCollectionEquality().hash(r),
            const DeepCollectionEquality().hash(s),
            const DeepCollectionEquality().hash(t)
        ),
        const DeepCollectionEquality().hash(u)
    );

    Structs_TwentyOneItemStruct copyWith({
        String? a,
        String? b,
        String? c,
        String? d,
        String? e,
        String? f,
        String? g,
        String? h,
        String? i,
        String? j,
        String? k,
        String? l,
        String? m,
        String? n,
        String? o,
        String? p,
        String? q,
        String? r,
        String? s,
        String? t,
        String? u
    }) => Structs_TwentyOneItemStruct(
        a: a ?? this.a,
        b: b ?? this.b,
        c: c ?? this.c,
        d: d ?? this.d,
        e: e ?? this.e,
        f: f ?? this.f,
        g: g ?? this.g,
        h: h ?? this.h,
        i: i ?? this.i,
        j: j ?? this.j,
        k: k ?? this.k,
        l: l ?? this.l,
        m: m ?? this.m,
        n: n ?? this.n,
        o: o ?? this.o,
        p: p ?? this.p,
        q: q ?? this.q,
        r: r ?? this.r,
        s: s ?? this.s,
        t: t ?? this.t,
        u: u ?? this.u
    );
}
