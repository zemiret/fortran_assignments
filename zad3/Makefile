CC=ifort
FLAGS=-coarray
MAIN=main

all: lib
	$(CC) $(FLAGS) src/$(MAIN).f90 -o $(MAIN).out src/integrate.o src/funs.o
	make clean

lib:
	$(CC) $(FLAGS) -c src/integrate.f90 -o src/integrate.o 
	$(CC) $(FLAGS) -c src/funs.f90 -o src/funs.o 

shared: lib
	$(CC) -coarray=shared src/$(MAIN).f90 -o $(MAIN).out src/integrate.o src/funs.o
	make clean

distributed: lib
	$(CC) -coarray=distributed src/$(MAIN).f90 -o $(MAIN).out src/integrate.o src/funs.o
	make clean

single: lib
	$(CC) -coarray=single src/$(MAIN).f90 -o $(MAIN).out src/integrate.o src/funs.o
	make clean

clean:
	mv *.mod src

