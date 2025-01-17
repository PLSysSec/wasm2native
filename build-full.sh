export CC

rm -rf ./build
rm -f ./src/wasi-app.*

wasm2c "$1" -o wasi-app.c
mv wasi-app.* ./src

mkdir -p build
cd build
cmake ..
cmake --build . -j 12
cd ..

fn_out=$(basename -- "$1")
fn_out="${fn_out%%.*}.elf"

rm -f ./${fn_out}
cp ./build/app.out ./${fn_out}
