@dataclasses.dataclass
class AProtocolImplementation(testapi.AProtocol):
    """<!-- FishyJoes.export(AProtocolImplementation) -->"""
    foo: str
    baz: bool

    def bar(
        x: int,
        y: int,
    ) -> testapi.AProtocol:
        """<!-- FishyJoes.export(bar) -->"""
        with fishyjoes_runtime.local_handles(self, x, y) as (_selfHandle, _xHandle, _yHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_AProtocolImplementation_bar)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _xHandle.ptr,
                    _yHandle.ptr,
                ),
                testapi.AProtocol
            )

    def hasADefaultImplementation(
        x: int,
        y: float,
    ) -> str:
        """<!-- FishyJoes.export(hasADefaultImplementation) -->"""
        with fishyjoes_runtime.local_handles(self, x, y) as (_selfHandle, _xHandle, _yHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_AProtocolImplementation_hasADefaultImplementation)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _xHandle.ptr,
                    _yHandle.ptr,
                ),
                str
            )

    def hasADefaultImplementation2(
        a: str,
        b: bool,
        c: str,
    ) -> str:
        """<!-- FishyJoes.export(hasADefaultImplementation2) -->"""
        with fishyjoes_runtime.local_handles(self, a, b, c) as (_selfHandle, _aHandle, _bHandle, _cHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_AProtocolImplementation_hasADefaultImplementation2)(
                    Loader.shared.env,
                    _selfHandle.ptr,
                    _aHandle.ptr,
                    _bHandle.ptr,
                    _cHandle.ptr,
                ),
                str
            )
