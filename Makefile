SRC=dist/sqlite3.h dist/sqlite3.c dist/sqlite3ext.h dist/shell.c dist/hello.h dist/hello.c

all: $(SRC)
	gcc \
		-DSQLITE_CORE \
		-I dist/ \
		$(SRC) \
		-lpthread -lm -ldl \
		-o ./dist/sqlite3-hello

dist: 
	bash get-sqlite3.sh
	mkdir -p dist/

dist/sqlite3.c: dist
	cp sqlite-amalgamation-3410200/sqlite3.c dist/sqlite3.c

dist/sqlite3.h: dist
	cp sqlite-amalgamation-3410200/sqlite3.h dist/sqlite3.h

dist/sqlite3ext.h: dist
	cp sqlite-amalgamation-3410200/sqlite3ext.h dist/sqlite3ext.h

dist/shell.c: dist
	cp sqlite-amalgamation-3410200/shell.c dist/shell.c
	bash update_shell.sh

dist/hello.h: src/hello.h
	cp src/hello.h dist/hello.h

dist/hello.c: src/hello.c
	cp src/hello.c dist/hello.c

clean:
	rm -rf dist
	rm -rf sqlite-*

