# Get the project directory
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/../
mkdir -p $PROJECT_DIR/src

# Curriculum-Quadruped-Jumping-DRL
cd $PROJECT_DIR/src
git clone https://github.com/vassil-atn/Curriculum-Quadruped-Jumping-DRL.git
cd Curriculum-Quadruped-Jumping-DRL

# uv
uv venv --python 3.8 --clear
source .venv/bin/activate

# IsaacGym
cd $PROJECT_DIR/python
uv pip install -e .

cd $PROJECT_DIR/src/Curriculum-Quadruped-Jumping-DRL
cd rsl_rl && uv pip install -e .
cd ../legged_gym && uv pip install -e .
cd .. && uv pip install -r requirements.txt

# Install self-built PyTorch
cd $PROJECT_DIR/lib
wget -nc https://github.com/Renkunzhao/Isaacgym/releases/download/torch2.3.1/torch-1.10.0a0+3fd9dcf-cp38-cp38-linux_x86_64.whl
uv pip install torch-1.10.0a0+3fd9dcf-cp38-cp38-linux_x86_64.whl
