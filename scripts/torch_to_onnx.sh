#!/bin/bash

VERSION=ultralytics
MODEL_NAME=yolo11s
MODEL_DIR=datas/models
MODEL_PATH=$MODEL_DIR/$MODEL_NAME.pt
CLASS_NAMES="person,car,airplane"

USE_WHEEL=1
if [ $USE_WHEEL == 1 ]; then
    CMD_EXPORT="trtyolo export"
else
    export PYTHONPATH=python:$PYTHONPATH
    CMD_EXPORT="python tools/trtyolo.py export"
fi

$CMD_EXPORT \
    --version $VERSION \
    --weights $MODEL_PATH \
    --output $MODEL_DIR \
    --names "$CLASS_NAMES" \
    --opset 18 \
    --imgsz 640 \
    --max_boxes 100 \
    --iou_thres 0.7 \
    --conf_thres 0.1 \
    --batch -1 -s

