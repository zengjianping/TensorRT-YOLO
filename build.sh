#!/bin/bash

pip install "pybind11[global]"
rm -r build
mkdir build && cd build
cuda_arch=$(nvidia-smi --query-gpu=compute_cap --format=csv | tail -1 | awk '{print $1}' | sed "s/\.//g")
cmake -DTENSORRT_PATH=/usr/local/tensorrt -DCMAKE_CUDA_ARCHITECTURES=$cuda_arch -DCMAKE_CUDA_FLAGS=-arch=sm_$cuda_arch ..
cmake --build . -j8 --config Release


