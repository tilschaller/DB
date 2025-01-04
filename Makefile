test:
	gcc lib_src/test.c lib_src/database.c -o build/test.exe -static -ggdb3
	./build/test.exe

database:
	gcc -c  lib_src/database.c -o build/database.o -static
	ar cr database/database.a build/database.o
