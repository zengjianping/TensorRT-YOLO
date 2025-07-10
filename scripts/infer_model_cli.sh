#!/bin/bash

MODEL_DIR=datas/models
MODEL_NAME=rtdetr-l
IMAGE_DIR=datas/images/image01
RESULT_DIR=${IMAGE_DIR}/results/${MODEL_NAME}
LABEL_FILE=datas/labels/coco.txt

trtyolo infer -m 1 \
    -e $MODEL_DIR/$MODEL_NAME.engine \
    -l $LABEL_FILE \
    -i $IMAGE_DIR \
    -o $RESULT_DIR

