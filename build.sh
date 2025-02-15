#!/bin/bash

pip install "pybind11[global]"
rm -r build
mkdir build && cd build

#cuda_arch=$(nvidia-smi --query-gpu=compute_cap --format=csv | tail -1 | awk '{print $1}' | sed "s/\.//g")
#cmake -DTENSORRT_PATH=/usr/local/tensorrt -DCMAKE_CUDA_ARCHITECTURES=$cuda_arch -DCMAKE_CUDA_FLAGS=-arch=sm_$cuda_arch ..
#cmake -DTENSORRT_PATH=/usr/local/tensorrt -DCMAKE_CUDA_FLAGS="--generate-code=arch=compute_86,code=[compute_86,sm_86] --generate-code=arch=compute_89,code=[compute_89,sm_89]" ..

code_flags=""
for arch in 89 86 61
do
  code_flags+="--generate-code=arch=compute_$arch,code=[compute_$arch,sm_$arch] "
done
echo "FLAGS: $code_flags"
cmake -DTENSORRT_PATH=/usr/local/tensorrt -DCMAKE_CUDA_FLAGS="$code_flags" ..

cmake --build . -j8 --config Release

