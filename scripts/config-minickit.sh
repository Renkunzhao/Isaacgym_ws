# Get the project directory
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/../
mkdir -p $PROJECT_DIR/src

# Mimickit
cd $PROJECT_DIR/src
git clone https://github.com/xbpeng/MimicKit.git
cd MimicKit

# uv
uv venv --python 3.8 --clear
source .venv/bin/activate

# IsaacGym
cd $PROJECT_DIR/python
uv pip install -e .

cd $PROJECT_DIR/src/MimicKit
uv pip install -r requirements.txt
uv pip install setuptools
wget -nc https://github.com/Renkunzhao/MimicKit/releases/download/Data/MimicKit_Data.zip
unzip -o MimicKit_Data.zip 'MimicKit_Data/*' -d data
rsync -a data/MimicKit_Data/* data/
rm -rf data/MimicKit_Data

# Install self-built PyTorch
cd $PROJECT_DIR/lib
wget -nc https://github.com/Renkunzhao/Isaacgym/releases/download/torch2.3.1/torch-1.10.0a0+3fd9dcf-cp38-cp38-linux_x86_64.whl
uv pip install torch-1.10.0a0+3fd9dcf-cp38-cp38-linux_x86_64.whl