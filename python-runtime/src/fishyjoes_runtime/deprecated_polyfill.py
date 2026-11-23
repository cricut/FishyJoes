import sys
import typing
import warnings

# warnings.deprecated was added in Python 3.13. Add a compatible version for earlier pythons
if sys.version_info >= (3, 13):
    from warnings import deprecated
else:
    class deprecated:
        message: typing.LiteralString
        category: type[Warning] | None
        stacklevel: int

        def __init__(
            self,
            message: typing.LiteralString, /, *,
            category: type[Warning] | None = DeprecationWarning,
            stacklevel: int = 1,
        ) -> None:
            self.message = message
            self.category = category
            self.stacklevel = stacklevel

        def __call__[T: typing.Callable[..., typing.Any]](self, wrapped: T, /) -> T:
            def deprecated_wrapper(*args, **kwargs):  # type: ignore[no-untyped-def]
                warnings.warn(self.message, self.category, self.stacklevel)
                return wrapped(*args, **kwargs)

            return typing.cast(T, deprecated_wrapper)
