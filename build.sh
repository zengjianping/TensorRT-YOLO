#!/bin/bash

rm -r build
mkdir build && cd build
#nvidia-smi --query-gpu=compute_cap --format=csv
cmake -DTENSORRT_PATH=/home/zengjianping/Programs/TensorRT-10.7.0.23 -DCMAKE_CUDA_ARCHITECTURES=89 ..
cmake --build . -j8 --config Release


