#include <stdlib.h>
#include <Python.h>

int _newlib_heap_size_user = 100 * 1024 * 1024;

int main(int argc, char *argv[]) {
	(void)argc;
	(void)argv;

    sceAppMgrUmount("app0:");

    // Deprecated
    Py_SetPythonHome(L"ux0:app/PYTH00003");

    Py_NoSiteFlag = 1;
    Py_OptimizeFlag = 2;

    Py_Initialize();
	PyRun_SimpleString("import sys\n");
	PyRun_SimpleString("import os\n");
	PyRun_SimpleString("print(os.name)\n");
	PyRun_SimpleString("print(sys.platform)\n");
	PyRun_SimpleString("print(sys.path)\n");
	PyRun_SimpleString("print(sys.builtin_module_names)\n");
	FILE *fp;
    fp = fopen("ux0:app/PYTH00003/main.py", "r");
    PyRun_SimpleFile(fp, "main.py");
    Py_Finalize();
	return 0;
}
