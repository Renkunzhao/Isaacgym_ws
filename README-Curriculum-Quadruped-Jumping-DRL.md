```bash
cd src/Curriculum-Quadruped-Jumping-DRL/legged_gym/legged_gym/scripts
uv run python train.py -h
uv run python train.py --task="go1_upwards" --max_iterations=3000 --headless
uv run python train.py --task="go1_forward" --max_iterations=10000 --headless --resume --load_run=-1
```