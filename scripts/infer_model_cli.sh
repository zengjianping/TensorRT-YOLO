#!/bin/bash

MODEL_DIR=datas/models
MODEL_NAME=yolo11n
IMAGE_DIR=datas/images
RESULT_DIR=datas/results

trtyolo infer -m 0 \
    -e $MODEL_DIR/$MODEL_NAME.engine \
    -l examples/detect/labels.txt \
    -i $IMAGE_DIR -o $RESULT_DIR
