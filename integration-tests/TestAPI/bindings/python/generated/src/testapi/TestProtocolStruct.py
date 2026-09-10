@dataclasses.dataclass
class TestProtocolStruct(testapi.TestMethodsProtocol, testapi.TestPropertiesProtocol):
    """<!-- FishyJoes.export(TestProtocolStruct) -->"""
    corge: str

    """<!-- FishyJoes.export(frobby) -->"""
    list[int] get frobby =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<list[int]>(f__iota_get_TestAPI_TestProtocolStruct_frobby(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    def foo(
    ) -> None:
        """<!-- FishyJoes.export(foo) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolStruct_foo)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolStruct_bar)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolStruct_baz)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolStruct_garply)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolStruct_xyzzy)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolStruct_plugh)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _fredHandle.ptr,
                ),
                tuple
            )
