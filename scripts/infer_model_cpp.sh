#!/bin/bash

MODEL_DIR=datas/models
MODEL_NAME=yolo11s
IMAGE_DIR=datas/images/image00
RESULT_DIR=${IMAGE_DIR}/results/${MODEL_NAME}
LABEL_FILE=datas/labels/coco.txt

examples/detect/bin/detect \
    -e $MODEL_DIR/$MODEL_NAME.engine \
    -l $LABEL_FILE \
    -i $IMAGE_DIR \
    -o $RESULT_DIR

