test:
	gcc lib_src/test.c lib_src/database.c -o build/test.exe -static -g
	./build/test.exe

database:
	gcc -c  lib_src/database.c -o build/database.o -static
	ar cr lib/database.a build/database.o
