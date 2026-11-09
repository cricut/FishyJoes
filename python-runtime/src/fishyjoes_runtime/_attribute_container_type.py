from __future__ import annotations

import fishyjoes_runtime
from . import _attribute_container_implementation as _impl


class AttributeContainer(fishyjoes_runtime.SwiftReference):
    """ A type that provides a way to store attributes and their values outside of an attributed string.

    Use this type to initialize an instance of AttributedString with preset attributes,
    and to set, merge, or replace attributes in existing attributed strings.

    Libraries that depend on `AttributeContainer` are free to define their own attributes to be associated with attributed strings.
    As a result of this flexibility, the actual values of attributes can only be obtained using types defined in those libraries.

    The runtime itself defines one such type, `AttributeContainer.FoundationAttributes`.
    To obtain the values of attributes from that type, such as the `link` attribute or `languageIdentifier` attribute,
    one must construct an instance passing the container:

    `link = AttributeContainer.FoundationAttributes(someContainer).link`

    <!-- FishyJoes.exportReference(AttributeContainer) -->
    """

    def merge(
        self,
        other: fishyjoes_runtime.AttributeContainer,
        *,
        keep_current: bool = False,
    ) -> None:
        """ Merges the attributes of another attribute container with those of this container.

        - Parameter other The other attribute container whose attributes should be merged into this container.
        - Parameter keepCurrent For attributes in `other` that already have a value in this container,
            passing `true` retains the current value of the attribute,
            passing `false` replaces the value of the attribute with the one in `other`.

        <!-- FishyJoes.export(merge) -->
        """
        with fishyjoes_runtime.local_handles(self, other) as (_selfHandle, _otherHandle,):
            return _impl.iota_FishyJoesCommonRuntime_AttributeContainer_merge(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                _otherHandle,
                keep_current,
            )

    @staticmethod
    def create_empty(
    ) -> fishyjoes_runtime.AttributeContainer:
        """ Creates an attribute container having no attribute values.
        <!-- FishyJoes.export(createEmpty) -->
        """
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            fishyjoes_runtime.AttributeContainer
        )

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        if not isinstance(other, fishyjoes_runtime.AttributeContainer): return False
        with fishyjoes_runtime.local_handles(self, other) as (self_handle, other_handle):
            return _impl.iota_FishyJoesCommonRuntime_AttributeContainer_equals(
                fishyjoes_runtime.Runtime.shared.env_ref, self_handle, other_handle
            )

    @staticmethod
    def _equals(
        lhs: fishyjoes_runtime.AttributeContainer,
        rhs: fishyjoes_runtime.AttributeContainer | None,
    ) -> bool:
        with fishyjoes_runtime.local_handles(lhs, rhs) as (_lhsHandle, _rhsHandle,):
            return _impl.iota_FishyJoesCommonRuntime_AttributeContainer_equals(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _lhsHandle,
                _rhsHandle,
            )

    def __hash__(
        self,
    ) -> int:
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_get_FishyJoesCommonRuntime_AttributeContainer_hash(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
            )
