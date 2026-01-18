# Get the project directory
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/../
mkdir -p $PROJECT_DIR/src

# HIMLoco
cd $PROJECT_DIR/src
git clone https://github.com/yusongmin1/My_unitree_go2_gym.git
cd My_unitree_go2_gym

# uv
uv venv --python 3.8 --clear
source .venv/bin/activate

# IsaacGym
cd $PROJECT_DIR/python
uv pip install -e .

cd $PROJECT_DIR/src/My_unitree_go2_gym
cd rsl_rl && uv pip install -e .
cd .. && uv pip install -e .
uv pip install numpy==1.21.0 
# setuptools tensorboard==2.12.3

# Install self-built PyTorch
cd $PROJECT_DIR/lib
wget -nc https://github.com/Renkunzhao/Isaacgym/releases/download/torch2.3.1/torch-1.10.0a0+3fd9dcf-cp38-cp38-linux_x86_64.whl
uv pip install torch-1.10.0a0+3fd9dcf-cp38-cp38-linux_x86_64.whl
