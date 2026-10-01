from . import _methods_implementation as _impl
from . import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class Methods(fishyjoes_runtime.SwiftReference):
    """<!-- FishyJoes.exportReference(Methods) -->"""

    @property
    def garply(self) -> int:
        """<!-- FishyJoes.export(garply) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Methods_garply(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), int)

    @property
    def instanceGet(self) -> int:
        """<!-- FishyJoes.export(instanceGet) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Methods_instanceGet(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), int)

    @property
    def instanceGetMethod(self) -> int:
        """<!-- FishyJoes.exportAsMethod(instanceGetMethod) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Methods_instanceGetMethod(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), int)

    @property
    def instanceModifiable(self) -> int:
        """<!-- FishyJoes.export(instanceModifiable) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Methods_instanceModifiable(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), int)

    @instanceModifiable.setter
    def instanceModifiable(self, new_value: int) -> None:
        with fishyjoes_runtime.local_handles(self, new_value) as (self_handle, new_value_handle,):
            _impl.iota_set_TestAPI_Methods_instanceModifiable(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, new_value_handle)

    @property
    def instanceStored(self) -> int:
        """<!-- FishyJoes.export(instanceStored) -->"""
        with fishyjoes_runtime.local_handles(self) as (self_handle,):
            return fishyjoes_runtime.consume_created_ref(_impl.iota_get_TestAPI_Methods_instanceStored(fishyjoes_runtime.Runtime.shared.env_ref, self_handle), int)

    @instanceStored.setter
    def instanceStored(self, new_value: int) -> None:
        with fishyjoes_runtime.local_handles(self, new_value) as (self_handle, new_value_handle,):
            _impl.iota_set_TestAPI_Methods_instanceStored(fishyjoes_runtime.Runtime.shared.env_ref, self_handle, new_value_handle)

    # TODO: static field staticGet
    # TODO: static field staticGetMethod
    # TODO: static field staticModifiable
    # TODO: static field staticStored
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

    def doublePlusGood(
        self,
        a: int,
        b: float,
    ) -> int:
        """<!-- FishyJoes.export(doublePlusGood) -->"""
        with fishyjoes_runtime.local_handles(self, a, b) as (_selfHandle, _aHandle, _bHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_doublePlusGood(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _aHandle,
                    _bHandle,
                ),
                int
            )

    def async42(
        self,
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(async42) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_async42(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                fishyjoes_runtime.Future
            )

    def asyncYield(
        self,
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(asyncYield) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncYield(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                fishyjoes_runtime.Future
            )

    def asyncSleep(
        self,
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(asyncSleep) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncSleep(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                fishyjoes_runtime.Future
            )

    def asyncVoid(
        self,
    ) -> fishyjoes_runtime.Future[None]:
        """<!-- FishyJoes.export(asyncVoid) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncVoid(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                fishyjoes_runtime.Future
            )

    def asyncDouble(
        self,
        d: float,
    ) -> fishyjoes_runtime.Future[float]:
        """<!-- FishyJoes.export(asyncDouble) -->"""
        with fishyjoes_runtime.local_handles(self, d) as (_selfHandle, _dHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncDouble(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _dHandle,
                ),
                fishyjoes_runtime.Future
            )

    def asyncMultipleArgs(
        self,
        i: int,
        j: typing.Callable[[], int],
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(asyncMultipleArgs) -->"""
        with fishyjoes_runtime.local_handles(self, i, j) as (_selfHandle, _iHandle, _jHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncMultipleArgs(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _iHandle,
                    _jHandle,
                ),
                fishyjoes_runtime.Future
            )

    def asyncThrowing(
        self,
    ) -> fishyjoes_runtime.Future[None]:
        """<!-- FishyJoes.export(asyncThrowing) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncThrowing(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                fishyjoes_runtime.Future
            )

    def asyncCallbackFunc0(
        self,
        callback: typing.Callable[[], int],
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(asyncCallbackFunc0) -->"""
        with fishyjoes_runtime.local_handles(self, callback) as (_selfHandle, _callbackHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_asyncCallbackFunc0(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _callbackHandle,
                ),
                fishyjoes_runtime.Future
            )

    @staticmethod
    def staticAsync42(
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(staticAsync42) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Methods_staticAsync42(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            fishyjoes_runtime.Future
        )

    @staticmethod
    def staticAsyncYield(
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(staticAsyncYield) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Methods_staticAsyncYield(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            fishyjoes_runtime.Future
        )

    @staticmethod
    def staticAsyncSleep(
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(staticAsyncSleep) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Methods_staticAsyncSleep(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            fishyjoes_runtime.Future
        )

    @staticmethod
    def staticAsyncVoid(
    ) -> fishyjoes_runtime.Future[None]:
        """<!-- FishyJoes.export(staticAsyncVoid) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Methods_staticAsyncVoid(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            fishyjoes_runtime.Future
        )

    @staticmethod
    def staticAsyncDouble(
        d: float,
    ) -> fishyjoes_runtime.Future[float]:
        """<!-- FishyJoes.export(staticAsyncDouble) -->"""
        with fishyjoes_runtime.local_handles(d) as (_dHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_staticAsyncDouble(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _dHandle,
                ),
                fishyjoes_runtime.Future
            )

    @staticmethod
    def staticAsyncMultipleArgs(
        i: int,
        j: typing.Callable[[], int],
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(staticAsyncMultipleArgs) -->"""
        with fishyjoes_runtime.local_handles(i, j) as (_iHandle, _jHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_staticAsyncMultipleArgs(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _iHandle,
                    _jHandle,
                ),
                fishyjoes_runtime.Future
            )

    @staticmethod
    def staticAsyncThrowing(
    ) -> fishyjoes_runtime.Future[None]:
        """<!-- FishyJoes.export(staticAsyncThrowing) -->"""
        return fishyjoes_runtime.consume_created_ref(
            _impl.iota_TestAPI_Methods_staticAsyncThrowing(
                fishyjoes_runtime.Runtime.shared.env_ref,
            ),
            fishyjoes_runtime.Future
        )

    @staticmethod
    def staticAsyncCallbackFunc0(
        callback: typing.Callable[[], int],
    ) -> fishyjoes_runtime.Future[int]:
        """<!-- FishyJoes.export(staticAsyncCallbackFunc0) -->"""
        with fishyjoes_runtime.local_handles(callback) as (_callbackHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_staticAsyncCallbackFunc0(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _callbackHandle,
                ),
                fishyjoes_runtime.Future
            )

    @staticmethod
    def methodWithNewlinesInTypes(
        thing: typing.Callable[[int, bytes, bool], fishyjoes_runtime.Result[int,testapi.TheMethodError]],
    ) -> None:
        """<!-- FishyJoes.export(methodWithNewlinesInTypes) -->"""
        with fishyjoes_runtime.local_handles(thing) as (_thingHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_Methods_methodWithNewlinesInTypes(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _thingHandle,
                ),
                types.NoneType
            )
