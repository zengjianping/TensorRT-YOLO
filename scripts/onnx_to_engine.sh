#!/bin/bash

MODEL_DIR=datas/models
MODEL_NAME=yolo11n
MODEL_SIZE=640x640
MODEL_BATCH=8
USE_FP16="--fp16" # FP16模型推理更快，可能模型效果会有一点点降低，如果不使用FP16模型则用#注释掉此行

trtexec --onnx=$MODEL_DIR/$MODEL_NAME.onnx --saveEngine=$MODEL_DIR/$MODEL_NAME.engine $USE_FP16 \
    --minShapes=images:1x3x${MODEL_SIZE} --optShapes=images:${MODEL_BATCH}x3x${MODEL_SIZE} \
    --maxShapes=images:${MODEL_BATCH}x3x${MODEL_SIZE}

