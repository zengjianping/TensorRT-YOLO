#!/bin/bash

MODEL_DIR=datas/models
MODEL_NAME=yolo11n
MODEL_PATH=$MODEL_DIR/$MODEL_NAME.pt

trtyolo export -w $MODEL_PATH -v ultralytics -o $MODEL_DIR \
    --max_boxes 300 --iou_thres 0.7 --conf_thres 0.1 -b -1

