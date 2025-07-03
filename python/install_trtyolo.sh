#!/bin/bash

pip install --upgrade build
python -m build --wheel
pip uninstall tensorrt_yolo -y
pip install dist/tensorrt_yolo-6.2.0-py3-none-any.whl[export]

