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
