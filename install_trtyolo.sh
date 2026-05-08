#!/bin/bash

pip install --upgrade build
python -m build --wheel
pip uninstall trtyolo -y
pip install dist/trtyolo-6.4.0-py3-none-any.whl
