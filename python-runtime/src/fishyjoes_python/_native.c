#define PY_SSIZE_T_CLEAN
#include <Python.h>

static PyObject *native_runtime_version(PyObject *self, PyObject *Py_UNUSED(args)) {
    (void)self;
    return PyUnicode_FromString("fishyjoes_python-native-0.1.0");
}

static PyMethodDef module_methods[] = {
    {"native_runtime_version", native_runtime_version, METH_NOARGS, "Return the native runtime version string."},
    {NULL, NULL, 0, NULL},
};

static struct PyModuleDef module_def = {
    PyModuleDef_HEAD_INIT,
    "_native",
    "FishyJoes native Python runtime helpers.",
    -1,
    module_methods,
};

PyMODINIT_FUNC PyInit__native(void) {
    return PyModule_Create(&module_def);
}

