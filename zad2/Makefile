FLAGS=-std=f2008 -fbounds-check -lfftw3
PROG1=transform
LIB=src/fftw

all: lib
	gfortran $(FLAGS) src/$(PROG1).f90 -o $(PROG1).out $(LIB).o
	make clean

lib:
	gfortran -c $(LIB).f90 -o $(LIB).o 

clean:
	mv *.mod src

