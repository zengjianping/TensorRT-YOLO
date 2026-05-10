#!/bin/bash

MODEL_DIR=datas/models
MODEL_NAME=yolo26s

echo "### Exporting ONNX format using ultralytics..."
yolo export \
    model=${MODEL_DIR}/${MODEL_NAME}.pt \
    format=onnx \
    opset=18 \
    imgsz=640 \
    dynamic=true \
    simplify=true

mv ${MODEL_DIR}/${MODEL_NAME}.onnx ${MODEL_DIR}/${MODEL_NAME}_u.onnx

echo "### Exporting ONNX format using trtyolo..."
trtyolo-export \
    -i ${MODEL_DIR}/${MODEL_NAME}_u.onnx \
    -o ${MODEL_DIR}/${MODEL_NAME}.onnx \
    --opset 18 \
    --max-dets 100 \
    --iou_thres 0.7 \
    --conf_thres 0.1 \
    --simplify

echo "### Finished!"

