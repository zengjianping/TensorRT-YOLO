#!/bin/bash

MODEL_DIR=datas/models
MODEL_NAME=yolo11n
MODEL_PATH=$MODEL_DIR/$MODEL_NAME.pt

trtyolo export -w $MODEL_PATH -v ultralytics -o $MODEL_DIR \
    --max_boxes 100 --iou_thres 0.45 --conf_thres 0.25 -b -1

trtexec --onnx=$MODEL_DIR/$MODEL_NAME.onnx --saveEngine=$MODEL_DIR/$MODEL_NAME.engine --fp16 \
    --minShapes=images:1x3x640x640 --optShapes=images:4x3x640x640 --maxShapes=images:8x3x640x640

