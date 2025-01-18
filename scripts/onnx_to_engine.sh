#!/bin/bash

MODEL_DIR=datas/models
MODEL_NAME=yolo11n

trtexec --onnx=$MODEL_DIR/$MODEL_NAME.onnx --saveEngine=$MODEL_DIR/$MODEL_NAME.engine --fp16 \
    --minShapes=images:1x3x640x640 --optShapes=images:4x3x640x640 --maxShapes=images:8x3x640x640

