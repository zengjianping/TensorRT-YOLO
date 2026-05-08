#!/bin/bash

rm -r build
mkdir build && cd build

cmake -D CMAKE_PREFIX_PATH="/data/ProjectZKZS/Projects/TensorRT-YOLO/install" ..
cmake --build . -j8


