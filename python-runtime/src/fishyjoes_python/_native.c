/*
 * _native.c — FishyJoes CPython-level helpers.
 *
 * These operations touch CPython internals (refcounts, id-as-pointer) or
 * require a real libc malloc so that the Swift side can call free() on the
 * returned pointer.  Doing them in pure Python via ctypes.pythonapi is
 * fragile; doing them here is safe and explicit.
 *
 * All entry points are exposed as a Python C extension module so that the
 * rest of the runtime can import them as ordinary Python callables.
 */

#define PY_SSIZE_T_CLEAN
#include <Python.h>
#include <stdlib.h>
#include <string.h>


/* -------------------------------------------------------------------------
 * malloc_copy_bytes(data: bytes) -> int
 *
 * Allocates a null-terminated C string on the libc heap (via malloc) and
 * copies *data* into it.  Returns the allocation address as a Python int.
 *
 * Swift's Env.describe() calls free() on the pointer returned by the Python
 * _describe callback, so that pointer MUST come from libc malloc — not from
 * a cffi-managed or Python-managed buffer.
 * ------------------------------------------------------------------------- */
static PyObject *
native_malloc_copy_bytes(PyObject *self, PyObject *arg)
{
    (void)self;

    if (!PyBytes_Check(arg)) {
        PyErr_SetString(PyExc_TypeError, "malloc_copy_bytes requires a bytes object");
        return NULL;
    }

    Py_ssize_t size = PyBytes_Size(arg);
    const char *src = PyBytes_AsString(arg);

    /* +1 for null terminator */
    char *buf = (char *)malloc((size_t)(size + 1));
    if (!buf) {
        PyErr_NoMemory();
        return NULL;
    }
    memcpy(buf, src, (size_t)size);
    buf[size] = '\0';

    return PyLong_FromVoidPtr(buf);
}


/* -------------------------------------------------------------------------
 * retain(obj: object) -> int
 *
 * Increments the reference count of *obj* and returns its id (PyObject*
 * address) as a Python int.  CPython never moves objects (no compacting GC),
 * so the address is stable for the lifetime of the extra reference.
 *
 * The caller is responsible for pairing every retain() with a release().
 * ------------------------------------------------------------------------- */
static PyObject *
native_retain(PyObject *self, PyObject *obj)
{
    (void)self;
    Py_INCREF(obj);
    return PyLong_FromVoidPtr((void *)obj);
}


/* -------------------------------------------------------------------------
 * release(handle: int) -> None
 *
 * Decrements the reference count of the object identified by *handle*
 * (an address previously returned by retain()).  After this call the handle
 * is invalid; the caller must not use it again.
 * ------------------------------------------------------------------------- */
static PyObject *
native_release(PyObject *self, PyObject *arg)
{
    (void)self;

    void *ptr = PyLong_AsVoidPtr(arg);
    if (!ptr && PyErr_Occurred())
        return NULL;

    if (ptr) {
        Py_DECREF((PyObject *)ptr);
    }
    Py_RETURN_NONE;
}


/* -------------------------------------------------------------------------
 * borrow(handle: int) -> object
 *
 * Returns the Python object identified by *handle* without changing its
 * reference count.  The returned object is only valid as long as the caller
 * holds a retain on the handle.
 * ------------------------------------------------------------------------- */
static PyObject *
native_borrow(PyObject *self, PyObject *arg)
{
    (void)self;

    void *ptr = PyLong_AsVoidPtr(arg);
    if (!ptr && PyErr_Occurred())
        return NULL;

    if (!ptr) {
        Py_RETURN_NONE;
    }

    PyObject *obj = (PyObject *)ptr;
    Py_INCREF(obj);  /* caller gets a new reference */
    return obj;
}


/* -------------------------------------------------------------------------
 * native_runtime_version() -> str
 * ------------------------------------------------------------------------- */
static PyObject *
native_runtime_version(PyObject *self, PyObject *Py_UNUSED(args))
{
    (void)self;
    return PyUnicode_FromString("fishyjoes_python-native-0.2.0");
}


/* -------------------------------------------------------------------------
 * Module definition
 * ------------------------------------------------------------------------- */
static PyMethodDef module_methods[] = {
    {
        "malloc_copy_bytes",
        native_malloc_copy_bytes,
        METH_O,
        "malloc_copy_bytes(data: bytes) -> int\n\n"
        "Allocate a null-terminated C string on the libc heap and copy *data* "
        "into it.  Returns the address as an int.  The caller (Swift) is "
        "responsible for calling free() on the returned pointer.",
    },
    {
        "retain",
        native_retain,
        METH_O,
        "retain(obj: object) -> int\n\n"
        "Increment the reference count of *obj* and return its CPython address "
        "as an int.  Every retain() must be paired with a release().",
    },
    {
        "release",
        native_release,
        METH_O,
        "release(handle: int) -> None\n\n"
        "Decrement the reference count of the object at *handle*.  The handle "
        "must not be used after this call.",
    },
    {
        "borrow",
        native_borrow,
        METH_O,
        "borrow(handle: int) -> object\n\n"
        "Return the object at *handle* without changing its reference count.  "
        "Only valid while a retain is held on the handle.",
    },
    {
        "native_runtime_version",
        native_runtime_version,
        METH_NOARGS,
        "Return the native runtime version string.",
    },
    {NULL, NULL, 0, NULL},
};

static struct PyModuleDef module_def = {
    PyModuleDef_HEAD_INIT,
    "_native",
    "FishyJoes native Python runtime helpers.",
    -1,
    module_methods,
};

PyMODINIT_FUNC
PyInit__native(void)
{
    return PyModule_Create(&module_def);
}
