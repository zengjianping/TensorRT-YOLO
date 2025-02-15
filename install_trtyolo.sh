#!/bin/bash

pip install --upgrade build
python -m build --wheel
pip uninstall tensorrt_yolo -y
pip install dist/tensorrt_yolo-5.1.1-py3-none-any.whl[export]

