source ./build_env_setup.sh
#!/bin/bash

# Intel LLVM must cooperate with compiler and sysroot from conda
echo "--gcc-toolchain=${BUILD_PREFIX} --sysroot=${BUILD_PREFIX}/${HOST}/sysroot -target ${HOST}" > icpx_for_conda.cfg
export ICPXCFG="$(pwd)/icpx_for_conda.cfg"
export ICXCFG="$(pwd)/icpx_for_conda.cfg"

export _CD="$(pwd)/.."

cd _skbuild/linux-x86_64-3.9/cmake-build
${_CD}/_build_env/bin/icpx -D_tensor_impl_EXPORTS -I${_CD}/work/dpctl/tensor/../include -I${_CD}/work/dpctl/tensor/libtensor/include -I${_CD}/work/dpctl/tensor/libtensor/source -isystem ${_CD}/_h_env_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_pla/include/python3.9 -isystem ${_CD}/work/_skbuild/linux-x86_64-3.9/cmake-build/_deps/pybind11-src/include -fvisibility-inlines-hidden -std=c++17 -fmessage-length=0 -march=nocona -mtune=haswell -ftree-vectorize -fPIC -fstack-protector-strong -fno-plt -O2 -ffunction-sections -pipe -isystem ${_CD}/_h_env_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_pla/include -fdebug-prefix-map=${_CD}/work=/usr/local/src/conda/dpctl-0.14.3dev1 -fdebug-prefix-map=${_CD}/_h_env_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_placehold_pla=/usr/local/src/conda-prefix -fsycl  -O3 -Wall -Wextra -Winit-self -Wunused-function -Wuninitialized -Wmissing-declarations -Wstrict-prototypes -Wno-unused-parameter -fdiagnostics-color=auto -fstack-protector -fstack-protector-all -fpic -fPIC -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -fno-delete-null-pointer-checks -fwrapv -fsycl  -O3 -DNDEBUG -fPIC -fvisibility=hidden -fno-sycl-id-queries-fit-in-int -ipo -std=c++17 -fno-fast-math -fno-finite-math-only -fno-approx-func -H -MD -MT dpctl/tensor/CMakeFiles/_tensor_impl.dir/libtensor/source/elementwise_functions.cpp.o -MF dpctl/tensor/CMakeFiles/_tensor_impl.dir/libtensor/source/elementwise_functions.cpp.o.d -o dpctl/tensor/CMakeFiles/_tensor_impl.dir/libtensor/source/elementwise_functions.cpp.o -c ${_CD}/work/dpctl/tensor/libtensor/source/elementwise_functions.cpp
