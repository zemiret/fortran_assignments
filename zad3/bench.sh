#!/bin/bash

echo "Shared: "
make shared > /dev/null
time ./main.out > /dev/null
echo ""

echo "Distributed: "
make distributed > /dev/null
time ./main.out > /dev/null
echo ""

echo "Single: "
make distributed > /dev/null
time ./main.out > /dev/null

