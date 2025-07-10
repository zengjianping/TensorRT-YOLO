import re
import sys
from tensorrt_yolo.cli import trtyolo

if __name__ == '__main__':
    sys.argv[0] = re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
    sys.exit(trtyolo())

