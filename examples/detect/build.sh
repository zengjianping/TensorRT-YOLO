#!/bin/bash

rm -r build
mkdir build && cd build

cmake -DTENSORRT_PATH="/usr/local/tensorrt" -DDEPLOY_PATH="/data/ProjectZKZS/Projects/TensorRT-YOLO" ..
cmake --build . -j8 --config Release


