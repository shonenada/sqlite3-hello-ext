#!/bin/bash

INCLUDE_LNO=$(grep '#include' -n ./dist/shell.c | tail -1 | awk -F ':' '{print $1}')

INIT_LNO=$(grep 'sqlite3_series_init' -n ./dist/shell.c | tail -1 | awk -F ':' '{print $1}')

sed -e ${INCLUDE_LNO}'a#include "hello.h"' -i ./dist/shell.c

sed -e ${INIT_LNO}'a    sqlite3_hello_init(p->db, 0, 0);' -i ./dist/shell.c
