#!/bin/bash

MODEL_DIR=datas/models
MODEL_NAME=yolo11n
MODEL_PATH=$MODEL_DIR/$MODEL_NAME.pt

trtyolo export -w $MODEL_PATH -v ultralytics -o $MODEL_DIR \
    --max_boxes 100 --iou_thres 1.0 --conf_thres 0.0 -b -1

