CC=gfortran
FLAGS=-std=f2008 -fbounds-check -lfftw3
PROG1=transform
PROG2=noise
LIB=src/fftw

all: lib
	$(CC) $(FLAGS) src/$(PROG1).f90 -o $(PROG1).out $(LIB).o
	$(CC) $(FLAGS) src/$(PROG2).f90 -o $(PROG2).out $(LIB).o
	make clean

lib:
	$(CC) -c $(LIB).f90 -o $(LIB).o 

clean:
	mv *.mod src

