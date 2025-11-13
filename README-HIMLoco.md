```bash
cd src/HIMLoco/legged_gym/legged_gym/scripts
uv run python train.py -h
uv run python train.py --task go1 --headless --num_envs 4096 --seed 1
uv run python play.py --task go1 --num_envs 32
```