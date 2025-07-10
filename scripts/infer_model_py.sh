#!/bin/bash

MODEL_DIR=datas/models
MODEL_NAME=deim_dfine_hgnetv2_l_coco_50e
IMAGE_DIR=datas/images/image00
RESULT_DIR=${IMAGE_DIR}/results/${MODEL_NAME}
LABEL_FILE=datas/labels/coco.txt

export PYTHONPATH=python:$PYTHONPATH

python examples/detect/detect.py \
    -e $MODEL_DIR/$MODEL_NAME.engine \
    -l $LABEL_FILE \
    -i $IMAGE_DIR \
    -o $RESULT_DIR

