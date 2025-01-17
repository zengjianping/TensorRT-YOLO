#!/bin/bash

rm -r build
mkdir build && cd build

cmake -DTENSORRT_PATH="/home/zengjianping/Programs/TensorRT-10.7.0.23" -DDEPLOY_PATH="/data/ProjectZKZS/Projects/TensorRT-YOLO" ..
cmake --build . -j8 --config Release


