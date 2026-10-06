from . import _test_async_foreign_side_functions_struct_implementation as _impl
from . import _testapi_exported as testapi
import fishyjoes_runtime
import types
import typing

class TestAsyncForeignSideFunctionsStruct(testapi.TestAsyncFunctions):
    """<!-- FishyJoes.export(TestAsyncForeignSideFunctionsStruct) -->"""

    const42: typing.Final[typing.Callable[[], int]]
    iabs: typing.Final[typing.Callable[[int], int]]
    intCompose: typing.Final[typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]]]
    add3Things: typing.Final[typing.Callable[[float, float, int], float]]
    makeList: typing.Final[typing.Callable[[str, str, str, str], list[str]]]
    fifthThing: typing.Final[typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]]]
    six: typing.Final[typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int]]
    willThrow: typing.Final[typing.Callable[[], int]]
    exercise0Fun: typing.Final[typing.Callable[[typing.Callable[[], int]], str]]
    exercise1Fun: typing.Final[typing.Callable[[typing.Callable[[int], int]], str]]
    exercise2Fun: typing.Final[typing.Callable[[typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]]], str]]
    exercise3Fun: typing.Final[typing.Callable[[typing.Callable[[float, float, int], float]], str]]
    exercise4Fun: typing.Final[typing.Callable[[typing.Callable[[str, str, str, str], list[str]]], str]]
    exercise5Fun: typing.Final[typing.Callable[[typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]]], str]]
    exercise6Fun: typing.Final[typing.Callable[[typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int]], str]]
    thunkTwiceMakerFun: typing.Final[typing.Callable[[typing.Callable[[], None]], typing.Callable[[], None]]]

    def __init__(
        self,
        const42: typing.Callable[[], int],
        iabs: typing.Callable[[int], int],
        intCompose: typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]],
        add3Things: typing.Callable[[float, float, int], float],
        makeList: typing.Callable[[str, str, str, str], list[str]],
        fifthThing: typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]],
        six: typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int],
        willThrow: typing.Callable[[], int],
        exercise0Fun: typing.Callable[[typing.Callable[[], int]], str],
        exercise1Fun: typing.Callable[[typing.Callable[[int], int]], str],
        exercise2Fun: typing.Callable[[typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]]], str],
        exercise3Fun: typing.Callable[[typing.Callable[[float, float, int], float]], str],
        exercise4Fun: typing.Callable[[typing.Callable[[str, str, str, str], list[str]]], str],
        exercise5Fun: typing.Callable[[typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]]], str],
        exercise6Fun: typing.Callable[[typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int]], str],
        thunkTwiceMakerFun: typing.Callable[[typing.Callable[[], None]], typing.Callable[[], None]],
    ) -> None:
        self.const42 = const42
        self.iabs = iabs
        self.intCompose = intCompose
        self.add3Things = add3Things
        self.makeList = makeList
        self.fifthThing = fifthThing
        self.six = six
        self.willThrow = willThrow
        self.exercise0Fun = exercise0Fun
        self.exercise1Fun = exercise1Fun
        self.exercise2Fun = exercise2Fun
        self.exercise3Fun = exercise3Fun
        self.exercise4Fun = exercise4Fun
        self.exercise5Fun = exercise5Fun
        self.exercise6Fun = exercise6Fun
        self.thunkTwiceMakerFun = thunkTwiceMakerFun

    def __repr__(self) -> str:
        return f'testapi.TestAsyncForeignSideFunctionsStruct(const42={self.const42!r}, iabs={self.iabs!r}, intCompose={self.intCompose!r}, add3Things={self.add3Things!r}, makeList={self.makeList!r}, fifthThing={self.fifthThing!r}, six={self.six!r}, willThrow={self.willThrow!r}, exercise0Fun={self.exercise0Fun!r}, exercise1Fun={self.exercise1Fun!r}, exercise2Fun={self.exercise2Fun!r}, exercise3Fun={self.exercise3Fun!r}, exercise4Fun={self.exercise4Fun!r}, exercise5Fun={self.exercise5Fun!r}, exercise6Fun={self.exercise6Fun!r}, thunkTwiceMakerFun={self.thunkTwiceMakerFun!r})'

    def exercise0(
        self,
        fn: typing.Callable[[], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise0) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise1(
        self,
        fn: typing.Callable[[int], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise1) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise2(
        self,
        fn: typing.Callable[[typing.Callable[[int], int], typing.Callable[[int], int]], typing.Callable[[int], int]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise2) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise3(
        self,
        fn: typing.Callable[[float, float, int], float],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise3) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise4(
        self,
        fn: typing.Callable[[str, str, str, str], list[str]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise4) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise5(
        self,
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], int]], typing.Callable[[], int]],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise5) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def exercise6(
        self,
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(exercise6) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )

    def thunkTwiceMaker(
        self,
        thunk: typing.Callable[[], None],
    ) -> typing.Callable[[], None]:
        """<!-- FishyJoes.export(thunkTwiceMaker) -->"""
        with fishyjoes_runtime.local_handles(self, thunk) as (_selfHandle, _thunkHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _thunkHandle,
                ),
                "Callable"
            )

    def witness(
        self,
    ) -> testapi.TestAsyncFunctions:
        """<!-- FishyJoes.export(witness) -->"""
        with fishyjoes_runtime.local_handles(self) as (_selfHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                ),
                testapi.TestAsyncFunctions
            )

    def defaultExercise6(
        self,
        fn: typing.Callable[[str, int, float, str, typing.Callable[[], int], int], int],
    ) -> fishyjoes_runtime.Future[str]:
        """<!-- FishyJoes.export(defaultExercise6) -->"""
        with fishyjoes_runtime.local_handles(self, fn) as (_selfHandle, _fnHandle,):
            return fishyjoes_runtime.consume_created_ref(
                _impl.iota_TestAPI_TestAsyncForeignSideFunctionsStruct_defaultExercise6(
                    fishyjoes_runtime.Runtime.shared.env_ref,
                    _selfHandle,
                    _fnHandle,
                ),
                fishyjoes_runtime.Future
            )
