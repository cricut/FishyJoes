from __future__ import annotations

import types

import fishyjoes_runtime
from . import _foundation_attributes_implementation as _impl


class FoundationAttributes(fishyjoes_runtime.SwiftReference):
    """ Attributes defined by the Swift Foundation library in ``AttributeScopes``, packaged as a static type.

    This type (and the ones like it defined in other libraries) allow features similar to those
    offered by Swift dynamic member lookup in ``AttributeScope`` to be exported to other languages.

    An attribute container can be asked to fill in the fields defined by this structure using `AttributeContainerFoundationAttributes(AttributeContainer)`.
    This type can be asked to fill in an attribute container using `AttributeContainer(FoundationAttributes)`.

    Combining these calls with `AttributedString.setAttributes(_:)` and `AttributedString.mergeAttributes(_:)` allows expansion
    of attributed strings with new attributes in other languages analogously to how it is done in ``AttributeScopes`` using Swift dynamic member lookup.

    <!-- FishyJoes.exportReference(AttributeContainer.FoundationAttributes) -->
    """

    @property
    def language_identifier(self) -> str | None:
        """ A language identifier attribute.
        <!-- FishyJoes.export(languageIdentifier) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str, types.NoneType)

    @language_identifier.setter
    def language_identifier(self, new_value: str | None) -> None:
        with fishyjoes_runtime.local_handles(self, new_value) as (self_handle, new_value_handle,):
            _impl.iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, new_value_handle)

    @property
    def link(self) -> str | None:
        """ A link attribute.
        <!-- FishyJoes.export(link) -->
        """
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), str, types.NoneType)

    @link.setter
    def link(self, new_value: str | None) -> None:
        with fishyjoes_runtime.local_handles(self, new_value) as (self_handle, new_value_handle,):
            _impl.iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, new_value_handle)

    @staticmethod
    def create_empty(
    ) -> fishyjoes_runtime.attribute_container.FoundationAttributes:
        """ Creates a Foundation attribute container having no attribute values.
        <!-- FishyJoes.export(createEmpty) -->
        """
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createEmpty(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            fishyjoes_runtime.attribute_container.FoundationAttributes
        )

    @staticmethod
    def create_from_container(
        container: fishyjoes_runtime.AttributeContainer,
    ) -> fishyjoes_runtime.attribute_container.FoundationAttributes:
        """ Extracts the Foundation attributes from an attribute container and makes them available as statically typed properties.
        <!-- FishyJoes.export(createFromContainer) -->
        """
        with fishyjoes_runtime.local_handles(container) as (_containerHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _containerHandle,
                ),
                fishyjoes_runtime.attribute_container.FoundationAttributes
            )

    def __eq__(
        self,
        other: object,
    ) -> bool:
        if self is other: return True
        if not isinstance(other, fishyjoes_runtime.attribute_container.FoundationAttributes): return False
        with fishyjoes_runtime.local_handles(self, other) as (self_handle, other_handle):
            return _impl.iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals(
                fishyjoes_runtime.Runtime.shared.env_ref, self_handle, other_handle
            )

    @staticmethod
    def _equals(
        lhs: fishyjoes_runtime.attribute_container.FoundationAttributes,
        rhs: fishyjoes_runtime.attribute_container.FoundationAttributes | None,
    ) -> bool:
        with fishyjoes_runtime.local_handles(lhs, rhs) as (_lhsHandle, _rhsHandle,):
            return _impl.iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _lhsHandle,
                _rhsHandle,
            )

    def __hash__(
        self,
    ) -> int:
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
            )
