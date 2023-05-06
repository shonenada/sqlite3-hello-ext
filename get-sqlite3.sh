#!/bin/bash

if ! [ -f "sqlite-amalgamation-3410200.zip" ]; then 
    wget 'https://www.sqlite.org/2023/sqlite-amalgamation-3410200.zip'
fi

if ! [ -d "sqlite-amalgamation-3410200" ]; then
    unzip 'sqlite-amalgamation-3410200.zip'
fi
