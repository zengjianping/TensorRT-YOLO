#!/bin/bash

root_dir=$(dirname "$(realpath "$0")")
echo "Root directory: $root_dir"

pip install "pybind11[global]"
rm -r build
mkdir build && cd build

#cuda_arch=$(nvidia-smi --query-gpu=compute_cap --format=csv | tail -1 | awk '{print $1}' | sed "s/\.//g")
#cmake -DTRT_PATH=/usr/local/tensorrt -DCMAKE_CUDA_ARCHITECTURES=$cuda_arch -DCMAKE_CUDA_FLAGS=-arch=sm_$cuda_arch ..
#cmake -DTRT_PATH=/usr/local/tensorrt -DCMAKE_CUDA_FLAGS="--generate-code=arch=compute_86,code=[compute_86,sm_86] --generate-code=arch=compute_89,code=[compute_89,sm_89]" ..

#code_flags=""
#for arch in 89 86 75 61
#do
#  code_flags+="--generate-code=arch=compute_$arch,code=[compute_$arch,sm_$arch] "
#done
#echo "FLAGS: $code_flags"
# -D CMAKE_CUDA_FLAGS="$code_flags"

cmake -D TRT_PATH=/usr/local/tensorrt -D CMAKE_INSTALL_PREFIX=${root_dir}/install ..

cmake --build . -j$(nproc) --config Release --target install

