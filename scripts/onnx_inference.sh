#!/bin/bash

INPUT=datas/images/image00/team.jpg

python tools/onnx_inference.py \
    --onnx datas/models/yolo11s.onnx \
    --input $INPUT

