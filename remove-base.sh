#!/bin/sh
#remove addition of base to addresses used in LOAD and STORE (on little endian)
sed -i 's/&mem->data\[addr\]/addr/' $1
