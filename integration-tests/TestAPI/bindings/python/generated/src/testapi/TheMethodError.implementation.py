# MARK: C APIs

# MARK: C callback implementations

static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
    createRef(TheMethodError(ref))
);

# MARK: setup
