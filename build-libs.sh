rm -rf ./build
mkdir -p build
cd build
cmake -DBUILD_DUMMY=ON ..
cmake --build . -j 100
cd ..
