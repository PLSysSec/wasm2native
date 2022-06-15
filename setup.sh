#!/bin/sh
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "Building uvwasi and libuv...."
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
mkdir -p build
cd build
cmake ..
cmake --build .
echo "Done!"

