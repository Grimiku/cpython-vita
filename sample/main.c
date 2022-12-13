#include <stdlib.h>
#include <Python.h>

int _newlib_heap_size_user = 256 * 1024 * 1024;

int main(int argc, char *argv[]) {
	(void)argc;
	(void)argv;

    //Py_SetPythonHome(L"app0:"); 
    //Py_SetPath(L"app0:lib/python311.zip;app0:lib/python3.11"); 

    //Py_IsolatedFlag = 1; 
    Py_VerboseFlag = 0;
    Py_NoSiteFlag = 1; 
    //Py_UnbufferedStdioFlag = 1; 

    // PyStatus status;

    // PyConfig config; 
    // PyPreConfig preconfig; 
    // PyPreConfig_InitIsolatedConfig(&preconfig);

    // preconfig.utf8_mode = 1;

    // status = Py_PreInitialize(&preconfig);

    // if (PyStatus_Exception(status)) {
    //     Py_ExitStatusException(status);
    //     sceClibPrintf("Failed\n");
    // }

    // status = _PyRuntime_Initialize();
    // if (PyStatus_Exception(status)) {
    //     Py_ExitStatusException(status);
    // }

    // PyConfig_InitIsolatedConfig(&config);

    // config.verbose = 0;

    // PyConfig_SetString(&config, &config.run_command, L"main.py");

    // status = Py_InitializeFromConfig(&config); 
    
    // PyConfig_Clear(&config);
    // if (PyStatus_Exception(status)) {
    //     Py_ExitStatusException(status);
    // }

    Py_Initialize();
    Py_DebugFlag = 0;
	PyRun_SimpleString("import __hello__\n");
    PyRun_SimpleString("__hello__.main()\n");
    Py_Finalize();
	return 0;
}
