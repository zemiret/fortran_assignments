CC=ifort
FLAGS=-coarray
MAIN=main

all: lib
	$(CC) $(FLAGS) src/$(MAIN).f90 -o $(MAIN).out src/integrate.o src/funs.o
	make clean

lib:
	$(CC) $(FLAGS) -c src/integrate.f90 -o src/integrate.o 
	$(CC) $(FLAGS) -c src/funs.f90 -o src/funs.o 

clean:
	mv *.mod src

