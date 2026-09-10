@final
class _BaseTestProtocolEnum(testapi.TestMethodsProtocol):
    """<!-- FishyJoes.export(TestProtocolEnum) -->"""

    def foo(
    ) -> None:
        """<!-- FishyJoes.export(foo) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolEnum_foo)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolEnum_bar)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolEnum_baz)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolEnum_garply)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolEnum_xyzzy)(
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
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_TestProtocolEnum_plugh)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _fredHandle.ptr,
                ),
                tuple
            )

const factory TestProtocolEnum.qux(
) = TestProtocolEnum_Qux
