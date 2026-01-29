# Get the project directory
PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"/../
mkdir -p $PROJECT_DIR/src

# Stage-Wise-CMORL
cd $PROJECT_DIR/src
git clone https://github.com/rllab-snu/Stage-Wise-CMORL.git
cd Stage-Wise-CMORL

# uv
uv venv --python 3.8 --clear
source .venv/bin/activate

# IsaacGym
cd $PROJECT_DIR/python
uv pip install -e .

# IsaacGymEnvs
cd $PROJECT_DIR/lib
git clone https://github.com/isaac-sim/IsaacGymEnvs.git
cd IsaacGymEnvs
uv pip install -e .

# Stage-Wise-CMORL
cd $PROJECT_DIR/src/Stage-Wise-CMORL
uv pip install -r requirements.txt
uv pip install setuptools wandb==0.24.0 scipy pandas requests numpy==1.20 ruamel.yaml

# Install self-built PyTorch
cd $PROJECT_DIR/lib
wget -nc https://github.com/Renkunzhao/Isaacgym/releases/download/torch2.3.1/torch-1.10.0a0+3fd9dcf-cp38-cp38-linux_x86_64.whl
uv pip install torch-1.10.0a0+3fd9dcf-cp38-cp38-linux_x86_64.whl
