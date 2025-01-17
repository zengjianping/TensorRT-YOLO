#!/bin/bash

IMAGE_DIR=datas/images
MODEL_DIR=datas/models
MODEL_NAME=yolo11n
IMAGE_DIR=datas/images
RESULT_DIR=datas/results

python examples/detect/detect.py \
    -e $MODEL_DIR/$MODEL_NAME.engine \
    -l examples/detect/labels.txt \
    -i $IMAGE_DIR -o $RESULT_DIR

