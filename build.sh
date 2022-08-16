export CC=${CC:="zig cc"}

rm -f src/wasi-app.*

wasm2c "$1" -o wasi-app.c

if [ -n "${NOBOUND}" ]; then
       ./remove-base.sh wasi-app.c
       ./remove-base.sh wasi-app.h
fi

mv wasi-app.* ./src

OPT_FLAGS="-O3 -flto -fomit-frame-pointer -fno-stack-protector"
SRCS="src/wasi-app.c src/uvwasi-rt.c src/main-unsandboxed.c src/wasm-rt-impl.c"
DEPS="-Ibuild/_deps/uvwasi-src/include -Lbuild/_deps/libuv-build -Lbuild/_deps/uvwasi-build -luvwasi_a -luv_a -lpthread -ldl -lm"


fn_out=$(basename -- "$1")
fn_out="${fn_out%%.*}.elf"

rm -f ./${fn_out}
$CC $OPT_FLAGS $SRCS $DEPS -o ./${fn_out}
