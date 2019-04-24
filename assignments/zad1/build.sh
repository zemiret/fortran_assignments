#!/bin/bash

mkdir -p res
mkdir -p res/plotdata

cd out && cmake ../ && make all && cd .. && ./out/mull

gnuplot -c plot4.cfg 
gnuplot -c plot8.cfg 
gnuplot -c plot16.cfg 

