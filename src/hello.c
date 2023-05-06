#include <stdio.h>
#include "sqlite3ext.h" /* Do not use <sqlite3.h>! */
SQLITE_EXTENSION_INIT1

/* Insert your extension code here */

static void hello_world(sqlite3_context *ctx, int argc, sqlite3_value **argv) {
    sqlite3_result_text(ctx, "Hello, world!", -1, SQLITE_TRANSIENT);
}

#ifdef _WIN32
__declspec(dllexport)
#endif
/* TODO: Change the entry point name so that "extension" is replaced by
** text derived from the shared library filename as follows:  Copy every
** ASCII alphabetic character from the filename after the last "/" through
** the next following ".", converting each character to lowercase, and
** discarding the first three characters if they are "lib".
*/
int sqlite3_hello_init(
        sqlite3 *db,
        char **pzErrMsg,
        const sqlite3_api_routines *pApi
){
    int rc = SQLITE_OK;
    SQLITE_EXTENSION_INIT2(pApi);
    /* Insert here calls to
    **     sqlite3_create_function_v2(),
    **     sqlite3_create_collation_v2(),
    **     sqlite3_create_module_v2(), and/or
    **     sqlite3_vfs_register()
    ** to register the new features that your extension adds.
    */
    rc = sqlite3_create_function(db, "hello", 0, SQLITE_UTF8, NULL, hello_world, NULL, NULL);
    return rc;
}

