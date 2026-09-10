@final
class _BaseReferenceCaseEnum:
    """An inhabited enum that the product annotated `exportReference` rather than"""
    """`export`. An enum's cases are its only construction surface, so the generator"""
    """must still surface the cases (mirroring the `export` enum path) instead of"""
    """emitting an unconstructable, members-less opaque reference shell. Mirrors the"""
    """real CriRaster `Image.Kind` / `Image.Color.Channel` shape."""
    """<!-- FishyJoes.exportReference(ReferenceCaseEnum) -->"""

    """Mirrors `Image.kind`: a value-returning accessor whose result must be"""
    """comparable to a known case from Python."""
    """<!-- FishyJoes.export(defaultDirection) -->"""
    static testapi.ReferenceCaseEnum get defaultDirection =>
        check((exn) =>
            consumeCreatedRef<testapi.ReferenceCaseEnum>(f__iota_get_TestAPI_ReferenceCaseEnum_defaultDirection(Loader.shared.env, exn))
        )

    """<!-- FishyJoes.export(opposite) -->"""
    testapi.ReferenceCaseEnum get opposite =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<testapi.ReferenceCaseEnum>(f__iota_get_TestAPI_ReferenceCaseEnum_opposite(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )

    @staticmethod
    def rotate180(
        direction: testapi.ReferenceCaseEnum,
    ) -> testapi.ReferenceCaseEnum:
        """A method that both consumes (parameter) and produces (return) the"""
        """reference-annotated enum — only callable from Python if the cases bridge."""
        """<!-- FishyJoes.export(rotate180) -->"""
        with fishyjoes_runtime.local_handles(direction) as (_directionHandle):
            return consume_created_ref(
                fishyjoes_runtime.raise_by_out_ref(f__iota_TestAPI_ReferenceCaseEnum_rotate180)(
                    Loader.shared.env,
                    _directionHandle.ptr,
                ),
                testapi.enumName.north, testapi.enumName.south, testapi.enumName.east, testapi.enumName.west
            )

const factory ReferenceCaseEnum.north(
) = ReferenceCaseEnum_North

const factory ReferenceCaseEnum.south(
) = ReferenceCaseEnum_South

const factory ReferenceCaseEnum.east(
) = ReferenceCaseEnum_East

const factory ReferenceCaseEnum.west(
) = ReferenceCaseEnum_West
