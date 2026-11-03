from __future__ import annotations
from . import _methods_implementation as _impl
from . import _testapi_exported as testapi
from warnings import deprecated
import fishyjoes_runtime
import types
import typing

class Methods(fishyjoes_runtime.SwiftReference):
    """<!-- FishyJoes.exportReference(Methods) -->"""

    @property
    def garply(self) -> int:
        """<!-- FishyJoes.export(garply) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return _impl.iota_get_TestAPI_Methods_garply(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)

    @property
    def instance_get(self) -> int:
        """<!-- FishyJoes.export(instanceGet) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return _impl.iota_get_TestAPI_Methods_instanceGet(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)

    def get_instance_get_method(self) -> int:
        """<!-- FishyJoes.exportAsMethod(instanceGetMethod) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return _impl.iota_get_TestAPI_Methods_instanceGetMethod(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)

    @property
    def instance_modifiable(self) -> int:
        """<!-- FishyJoes.export(instanceModifiable) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return _impl.iota_get_TestAPI_Methods_instanceModifiable(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)

    @instance_modifiable.setter
    def instance_modifiable(self, new_value: int) -> None:
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            _impl.iota_set_TestAPI_Methods_instanceModifiable(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, new_value)

    @property
    def instance_stored(self) -> int:
        """<!-- FishyJoes.export(instanceStored) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return _impl.iota_get_TestAPI_Methods_instanceStored(fishyjoes_runtime.Runtime.shared.env_ref, self_handle)

    @instance_stored.setter
    def instance_stored(self, new_value: int) -> None:
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            _impl.iota_set_TestAPI_Methods_instanceStored(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, new_value)

    @staticmethod
    def get_static_get() -> int:
        """<!-- FishyJoes.export(staticGet) -->"""
        return _impl.iota_get_TestAPI_Methods_staticGet(fishyjoes_runtime.Runtime.shared.env_ref)

    @staticmethod
    def get_static_get_method() -> int:
        """<!-- FishyJoes.exportAsMethod(staticGetMethod) -->"""
        return _impl.iota_get_TestAPI_Methods_staticGetMethod(fishyjoes_runtime.Runtime.shared.env_ref)

    @staticmethod
    def get_static_modifiable() -> int:
        """<!-- FishyJoes.export(staticModifiable) -->"""
        return _impl.iota_get_TestAPI_Methods_staticModifiable(fishyjoes_runtime.Runtime.shared.env_ref)

    @staticmethod
    def set_static_modifiable(new_value: int) -> None:
        _impl.iota_set_TestAPI_Methods_staticModifiable(fishyjoes_runtime.Runtime.shared.env_ref, new_value)

    @staticmethod
    def get_static_stored() -> int:
        """<!-- FishyJoes.export(staticStored) -->"""
        return _impl.iota_get_TestAPI_Methods_staticStored(fishyjoes_runtime.Runtime.shared.env_ref)

    @staticmethod
    def set_static_stored(new_value: int) -> None:
        _impl.iota_set_TestAPI_Methods_staticStored(fishyjoes_runtime.Runtime.shared.env_ref, new_value)

    @staticmethod
    def create(
    ) -> testapi.Methods:
        """<!-- FishyJoes.export(create) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Methods_create(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            testapi.Methods
        )

    def double_plus_good(
        self,
        a: int,
        b: float,
    ) -> int:
        """<!-- FishyJoes.export(doublePlusGood) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return _impl.iota_TestAPI_Methods_doublePlusGood(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _selfHandle,
                a,
                b,
            )

    def async42(
        self,
    ) -> typing.Awaitable[int]:
        """<!-- FishyJoes.export(async42) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_async42(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                "Awaitable"
            )

    def async_yield(
        self,
    ) -> typing.Awaitable[int]:
        """<!-- FishyJoes.export(asyncYield) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncYield(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                "Awaitable"
            )

    def async_sleep(
        self,
    ) -> typing.Awaitable[int]:
        """<!-- FishyJoes.export(asyncSleep) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncSleep(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                "Awaitable"
            )

    def async_void(
        self,
    ) -> typing.Awaitable[None]:
        """<!-- FishyJoes.export(asyncVoid) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncVoid(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                "Awaitable"
            )

    def async_double(
        self,
        d: float,
    ) -> typing.Awaitable[float]:
        """<!-- FishyJoes.export(asyncDouble) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncDouble(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    d,
                ),
                "Awaitable"
            )

    def async_multiple_args(
        self,
        i: int,
        j: typing.Callable[[], typing.Awaitable[int]],
    ) -> typing.Awaitable[int]:
        """<!-- FishyJoes.export(asyncMultipleArgs) -->"""
        with fishyjoes_runtime.local_handles(self, j) as (_selfHandle, _jHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncMultipleArgs(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    i,
                    _jHandle,
                ),
                "Awaitable"
            )

    def async_throwing(
        self,
    ) -> typing.Awaitable[None]:
        """<!-- FishyJoes.export(asyncThrowing) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncThrowing(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                "Awaitable"
            )

    def async_callback_func0(
        self,
        callback: typing.Callable[[], typing.Awaitable[int]],
    ) -> typing.Awaitable[int]:
        """<!-- FishyJoes.export(asyncCallbackFunc0) -->"""
        with fishyjoes_runtime.local_handles(self, callback) as (_selfHandle, _callbackHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncCallbackFunc0(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _callbackHandle,
                ),
                "Awaitable"
            )

    @staticmethod
    def static_async42(
    ) -> typing.Awaitable[int]:
        """<!-- FishyJoes.export(staticAsync42) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Methods_staticAsync42(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            "Awaitable"
        )

    @staticmethod
    def static_async_yield(
    ) -> typing.Awaitable[int]:
        """<!-- FishyJoes.export(staticAsyncYield) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Methods_staticAsyncYield(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            "Awaitable"
        )

    @staticmethod
    def static_async_sleep(
    ) -> typing.Awaitable[int]:
        """<!-- FishyJoes.export(staticAsyncSleep) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Methods_staticAsyncSleep(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            "Awaitable"
        )

    @staticmethod
    def static_async_void(
    ) -> typing.Awaitable[None]:
        """<!-- FishyJoes.export(staticAsyncVoid) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Methods_staticAsyncVoid(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            "Awaitable"
        )

    @staticmethod
    def static_async_double(
        d: float,
    ) -> typing.Awaitable[float]:
        """<!-- FishyJoes.export(staticAsyncDouble) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Methods_staticAsyncDouble(
                fishyjoes_runtime.Runtime.shared.env_ref,
                d,
            ),
            "Awaitable"
        )

    @staticmethod
    def static_async_multiple_args(
        i: int,
        j: typing.Callable[[], typing.Awaitable[int]],
    ) -> typing.Awaitable[int]:
        """<!-- FishyJoes.export(staticAsyncMultipleArgs) -->"""
        with fishyjoes_runtime.local_handles(j) as (_jHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_staticAsyncMultipleArgs(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    i,
                    _jHandle,
                ),
                "Awaitable"
            )

    @staticmethod
    def static_async_throwing(
    ) -> typing.Awaitable[None]:
        """<!-- FishyJoes.export(staticAsyncThrowing) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Methods_staticAsyncThrowing(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            "Awaitable"
        )

    @staticmethod
    def static_async_callback_func0(
        callback: typing.Callable[[], typing.Awaitable[int]],
    ) -> typing.Awaitable[int]:
        """<!-- FishyJoes.export(staticAsyncCallbackFunc0) -->"""
        with fishyjoes_runtime.local_handles(callback) as (_callbackHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_staticAsyncCallbackFunc0(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _callbackHandle,
                ),
                "Awaitable"
            )

    @staticmethod
    def method_with_newlines_in_types(
        thing: typing.Callable[[int, bytes, bool], typing.Awaitable[fishyjoes_runtime.Result[int,testapi.TheMethodError]]],
    ) -> None:
        """<!-- FishyJoes.export(methodWithNewlinesInTypes) -->"""
        with fishyjoes_runtime.local_handles(thing) as (_thingHandle,):
            return _impl.iota_TestAPI_Methods_methodWithNewlinesInTypes(
                fishyjoes_runtime.Runtime.shared.env_ref,
                _thingHandle,
            )
