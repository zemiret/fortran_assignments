CC=gfortran
FLAGS=-std=f2008 -fbounds-check -lfftw3
MAIN=main

all: lib
	$(CC) $(FLAGS) src/$(MAIN).f90 -o $(MAIN).out src/integrate.o src/funs.o
	make clean

lib:
	$(CC) -c src/integrate.f90 -o src/integrate.o 
	$(CC) -c src/funs.f90 -o src/funs.o 

clean:
	mv *.mod src

