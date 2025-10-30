## Getting Started

Please refer to **`docs/index.html`** for detailed usage instructions.  
This repository provides the necessary **Dockerfiles** and scripts to run **IsaacGym on RTX 50-series GPUs**.

---

## Background

The version of **PyTorch** that supports **NVIDIA RTX 50-series GPUs** requires **Python 3.10 or newer**,  
while **IsaacGym** officially supports only **Python 3.8**.

To resolve this incompatibility, [this article](https://blog.csdn.net/m0_56706433/article/details/148902144)  
demonstrates how to build **PyTorch 2.3.1** from source with Python 3.8 and CUDA 12.8.

---

## Release Builds

Two pre-built wheels are available in the **Releases** section:

| File | Python | CUDA | glibc |
|------|---------|------|-------|
| `torch-1.10.0a0+3fd9dcf-cp38-cp38-linux_x86_64.whl` | 3.8 | 12.8 | 2.31 |
| `torch-2.3.0a0+gitd72f1d2-cp38-cp38-linux_x86_64.whl` | 3.8 | 12.8 | 2.39 |

Since **glibc** is backward-compatible, it is recommended to **try the 1.10.0a0 build first**.

---

## Usage Notes

- A **Dockerfile** is provided to ensure that the pre-built PyTorch wheel runs correctly.  
- If you choose not to use Docker, you can still follow the Dockerfile to install the required libraries manually.  
  However, **using Docker is strongly recommended** for stability and reproducibility.

---

## Requirements

- **CUDA ≥ 12.8**
- **pip** or **wget** (required only if installing `uv` manually on the host)

> ⚠️ If you are running inside the provided Docker container, `uv` is already pre-installed.  
> If you are running on the host machine, you need to install it manually using either `pip` or `wget`.

```bash
# Option 1: Install via pip
pip install uv

# Option 2: Install via wget
wget -qO- https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env
```

## Installation
### Build contrainer (Optional)
```bash
cd docker
docker compose up -d --build
```

```bash
./scripts/config-uv.sh
source .venv/bin/activate

cd python/examples
uv run python joint_monkey.py

cd lib/IsaacGymEnvs/isaacgymenvs
uv run python train.py task=Cartpole

cd src/humanoid-gym/humanoid
uv run python scripts/train.py --task=humanoid_ppo --run_name v1 --headless --num_envs 4096
uv run python scripts/play.py --task=humanoid_ppo --run_name v1

# HumanoidVerse
cd src/HumanoidVerse
uv run python humanoidverse/train_agent.py \
+simulator=isaacgym \
+exp=locomotion \
+domain_rand=NO_domain_rand \
+rewards=loco/reward_h1_locomotion \
+robot=h1/h1_10dof \
+terrain=terrain_locomotion_plane \
+obs=loco/leggedloco_obs_singlestep_withlinvel \
num_envs=1 \
project_name=TESTInstallation \
experiment_name=H110dof_loco_IsaacGym \
headless=False

# SkillMimic
cd src/SkillMimic
uv run python skillmimic/run.py --test --task SkillMimicBallPlay --num_envs 16 \
--cfg_env skillmimic/data/cfg/skillmimic.yaml \
--cfg_train skillmimic/data/cfg/train/rlg/skillmimic.yaml \
--motion_file skillmimic/data/motions/BallPlay-M/layup \
--checkpoint skillmimic/data/models/mixedskills/nn/skillmimic_llc.pth \
--state_init 20 \
--episode_length 140

cd src/SkillMimic
uv run python skillmimic/run.py --task SkillMimicBallPlay \
--cfg_env skillmimic/data/cfg/skillmimic.yaml \
--cfg_train skillmimic/data/cfg/train/rlg/skillmimic.yaml \
--motion_file skillmimic/data/motions/BallPlay-M/layup --headless

# SkillMimic-V2
cd src/SkillMimic-V2
uv run --venv /root/code/isaacgym_ws/src/SkillMimic/.venv \
python skillmimic/run.py \
  --play_dataset \
  --task SkillMimic2BallPlay \
  --test \
  --num_envs 1 \
  --episode_length 1000 \
  --state_init 2 \
  --cfg_env skillmimic/data/cfg/skillmimic.yaml \
  --cfg_train skillmimic/data/cfg/train/rlg/skillmimic.yaml \
  --motion_file skillmimic/data/motions/BallPlay-Pick
```