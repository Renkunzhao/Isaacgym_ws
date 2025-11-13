# View
```bash
cd src/MimicKit
uv run python mimickit/run.py --arg_file args/view_motion_g1_args.txt --visualize true

uv run python mimickit/run.py --arg_file args/view_motion_go2_args.txt --visualize true

uv run python mimickit/run.py --arg_file args/view_motion_humanoid_args.txt --visualize true

uv run python mimickit/run.py --arg_file args/view_motion_humanoid_sword_shield_args.txt --visualize true

uv run python mimickit/run.py --arg_file args/view_motion_smpl_args.txt --visualize true

```

# Train
```bash
cd src/MimicKit

uv run python mimickit/run.py --arg_file args/deepmimic_humanoid_ppo_args.txt --visualize true

uv run python mimickit/run.py --arg_file args/amp_g1_args.txt --visualize true --max_samples 700000000

uv run python mimickit/run.py --arg_file args/deepmimic_g1_ppo_args.txt --visualize true --out_model_file data/models/deepmimic_g1_cartwheel_model.pt

uv run python mimickit/run.py --arg_file args/deepmimic_go2_ppo_args.txt --visualize true --log_file output/deepmimic-go2-trot/log.txt --out_model_file output/deepmimic-go2-trot/deepmimic_go2_trot_model.pt --max_samples 1000000000

uv run python mimickit/run.py --arg_file args/deepmimic_go2_ppo_args.txt --visualize true --log_file output/deepmimic-go2-walk0/log.txt --out_model_file output/deepmimic-go2-walk0/deepmimic_go2_walk0_model.pt --max_samples 1000000000

```

# Play
```bash
uv run python mimickit/run.py --arg_file args/deepmimic_humanoid_ppo_args.txt --num_envs 4 --visualize true --mode test --model_file data/models/deepmimic_humanoid_spinkick_model.pt

uv run python mimickit/run.py --arg_file args/amp_g1_args.txt --num_envs 4 --visualize true --mode test --model_file data/models/amp_g1_walk_model.pt

uv run python mimickit/run.py --arg_file args/deepmimic_g1_ppo_args.txt --num_envs 4 --visualize true --mode test --model_file data/models/deepmimic_g1_walk_model.pt

uv run python mimickit/run.py --arg_file args/deepmimic_g1_ppo_args.txt --num_envs 4 --visualize true --mode test --model_file data/models/deepmimic_g1_spinkick_model.pt

uv run python mimickit/run.py --arg_file args/deepmimic_g1_ppo_args.txt --num_envs 4 --visualize true --mode test --model_file data/models/deepmimic_g1_cartwheel_model.pt

```

# Mujoco Deploy
```bash

```