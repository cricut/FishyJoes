class TestProtocolClass(SwiftReference, testapi.TestMethodsProtocol, testapi.TestOptionalsProtocol, testapi.TestPropertiesProtocol):
    """<!-- FishyJoes.exportReference(TestProtocolClass) -->"""

    """<!-- FishyJoes.export(corge) -->"""
    str get corge =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str>(f__iota_get_TestAPI_TestProtocolClass_corge(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    void set corge(str value) {
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(value, (_valueHandle) =>
                check((exn) =>
                    f__iota_set_TestAPI_TestProtocolClass_corge(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
                )
            )
        )
    }
    """<!-- FishyJoes.export(flarp) -->"""
    str | None get flarp =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<str | None>(f__iota_get_TestAPI_TestProtocolClass_flarp(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    void set flarp(str | None value) {
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(value, (_valueHandle) =>
                check((exn) =>
                    f__iota_set_TestAPI_TestProtocolClass_flarp(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
                )
            )
        )
    }
    """<!-- FishyJoes.export(frobby) -->"""
    list[int] get frobby =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<list[int]>(f__iota_get_TestAPI_TestProtocolClass_frobby(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_TestAPI_TestProtocolClass_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )

    def foo(
    ) -> None:
        """<!-- FishyJoes.export(foo) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolClass_foo)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                types.NoneType
            )

    def bar(
    ) -> bool:
        """<!-- FishyJoes.export(bar) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolClass_bar)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                ),
                bool
            )

    def baz(
        qux: bool,
    ) -> None:
        """<!-- FishyJoes.export(baz) -->"""
        with fishyjoes_runtime.local_handles(self, qux) as (_selfHandle, _quxHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolClass_baz)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _quxHandle.ptr,
                ),
                types.NoneType
            )

    def garply(
        str: str,
    ) -> str:
        """<!-- FishyJoes.export(garply) -->"""
        with fishyjoes_runtime.local_handles(self, str) as (_selfHandle, _strHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolClass_garply)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _strHandle.ptr,
                ),
                str
            )

    def xyzzy(
        thud: int,
        grault: list[float],
    ) -> str:
        """<!-- FishyJoes.export(xyzzy) -->"""
        with fishyjoes_runtime.local_handles(self, thud, grault) as (_selfHandle, _thudHandle, _graultHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolClass_xyzzy)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _thudHandle.ptr,
                    _graultHandle.ptr,
                ),
                str
            )

    def plugh(
        fred: tuple[bool,float,list[str]],
    ) -> tuple[bool,int,str]:
        """<!-- FishyJoes.export(plugh) -->"""
        with fishyjoes_runtime.local_handles(self, fred) as (_selfHandle, _fredHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolClass_plugh)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _fredHandle.ptr,
                ),
                tuple
            )

    @staticmethod
    def init(
        corge: str,
        {
            flarp: str | None = null,
        }
    ) -> testapi.TestProtocolClass:
        """<!-- FishyJoes.export(init) -->"""
        with fishyjoes_runtime.local_handles(corge, flarp) as (_corgeHandle, _flarpHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolClass_init)(
                    Loader.shared.env,
                    _corgeHandle.ptr,
                    _flarpHandle.ptr,
                ),
                testapi.TestProtocolClass
            )

    def wombat(
        zxc: int | None,
    ) -> float | None:
        """<!-- FishyJoes.export(wombat) -->"""
        with fishyjoes_runtime.local_handles(self, zxc) as (_selfHandle, _zxcHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolClass_wombat)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _zxcHandle.ptr,
                ),
                float, types.NoneType
            )

    def spqr(
        pippo: testapi.AssociatedDataEnum,
    ) -> int:
        """<!-- FishyJoes.export(spqr) -->"""
        with fishyjoes_runtime.local_handles(self, pippo) as (_selfHandle, _pippoHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolClass_spqr)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _pippoHandle.ptr,
                ),
                int
            )

    def operator ==(
        other: object,
    ) -> bool:
        identical(other, this) ||
        (other is testapi.TestProtocolClass &&
            GCRef.using(this, (thisHandle) =>
                GCRef.using(other, (otherHandle) =>
                    check((exn) => f__iota_TestAPI_TestProtocolClass_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn)))))
