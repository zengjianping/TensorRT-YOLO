#!/bin/bash

MODEL_DIR=datas/models
MODEL_NAME=yolo11n
MODEL_SIZE=640x640
MODEL_BATCH=8

trtexec --onnx=$MODEL_DIR/$MODEL_NAME.onnx --saveEngine=$MODEL_DIR/$MODEL_NAME.engine --fp16 \
    --minShapes=images:1x3x${MODEL_SIZE} --optShapes=images:${MODEL_BATCH}x3x${MODEL_SIZE} \
    --maxShapes=images:${MODEL_BATCH}x3x${MODEL_SIZE}

