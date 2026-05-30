# World4RL: Diffusion World Models for Policy Refinement with RL

- **Venue**: arXiv'25.09
- **arXiv**: [2509.19080](https://arxiv.org/abs/2509.19080)
- **Category**: World Model for RL

## Core Problem
How to use diffusion-based world models as high-fidelity simulators for end-to-end policy optimization in imagined environments?

## Core Method
World4RL — pre-train a diffusion world model on multi-task datasets to capture diverse dynamics, then refine policies entirely within the frozen world model without online real-world interaction.

## Key Characteristics
- Diffusion backbone world model: higher visual fidelity than latent-space models (RSSM)
- End-to-end policy optimization: directly for policy training, not just planning
- Two-hot action encoding: tailored for robotic manipulation
- Frozen world model: avoids drift during policy optimization

## Key Insight
Diffusion models can serve as both policy and world model — the same architecture captures action generation and environment dynamics, simplifying system design.

## Technical Details
- **Architecture**: Diffusion world model (future frame prediction) + policy network
- **Training**: Multi-task pre-training → frozen world model → policy optimization in imagined rollouts
- **Action encoding**: Two-hot action encoding for discrete action spaces
- **Key design**: Frozen world model, policy optimized separately

## Experimental Results
- High-fidelity environment modeling in simulation and real-world
- Consistent policy refinement outperforming imitation learning baselines
- Successful sim-to-real transfer

## Limitations
- Slow diffusion inference (denoising steps)
- Frozen world model cannot adapt to policy distribution shift
- Error accumulation in long-horizon tasks
- High computational cost for diffusion training and inference

## Connection to Prior Work
- Shares framework with DiWA but different technical route (diffusion vs RSSM)
- Related to diffusion policies (Cosmos Policy, GigaWorld-Policy)
- Shares "world model as virtual environment" with World-Env

## Implications for Our Research
- **Long-horizon**: Slow diffusion inference limits long-horizon rollout efficiency. May need hierarchical world models or keyframe mechanisms.
- **Home scenes**: Multi-task pre-training valuable for home scenarios, but data collection remains bottleneck.
- **Directly testable**: Try diffusion world model with lab data — predict future frames with diffusion, then train policy on top. Watch computational cost.
