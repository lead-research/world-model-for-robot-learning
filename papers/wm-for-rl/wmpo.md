# WMPO: World Model-based Policy Optimization for Vision-Language-Action Models

- **Venue**: ICLR'26
- **arXiv**: [2511.09515](https://arxiv.org/abs/2511.09515)
- **Code**: [GitHub](https://github.com/WM-PO/WMPO)
- **Project**: [https://wm-po.github.io/](https://wm-po.github.io/)
- **Category**: World Model for RL

## Core Problem
How to achieve on-policy RL for VLA without real-world interaction? How to use pixel-level world models instead of latent-space models?

## Core Method
WMPO — pixel-level prediction world model (instead of latent space) aligns "imagined" trajectories with VLA's web-scale pretrained visual features; uses on-policy GRPO for RL optimization.

## Key Characteristics
- Pixel-level world model: aligns with VLA's web-scale image pretraining, rather than learning new latent space
- On-policy GRPO: stronger performance than off-policy methods
- Self-correction behavior: emergent self-correction after training
- Robust generalization and lifelong learning: validated in simulation and real robots

## Key Insight
Latent-space world models (e.g., RSSM) learn representations incompatible with VLA visual backbones, while pixel-level world models generate images directly inputable to VLA's web-scale pretrained visual encoders — this is WMPO's core advantage over latent-space methods.

## Technical Details
- **Architecture**: Pixel-level world model (video generation) + VLA policy + on-policy GRPO
- **World model**: Predicts pixel-level future frames, aligned with VLA visual features
- **RL**: On-policy GRPO, generates rollouts in world model, optimizes policy with actual outcomes
- **Key design**: Pixel-level output ensures compatibility with VLA visual backbone
- **Training**: World model pre-training → VLA on-policy GRPO optimization in world model

## Experimental Results
- Sample efficiency: significant improvement
- Overall performance: surpasses supervised baselines
- Self-correction: emergent self-correction behavior after training
- Generalization and lifelong learning: validated in simulation and real robots

## Limitations
- Pixel-level world model generation cost much higher than latent-space models
- On-policy GRPO requires many rollouts, world model generation speed is key bottleneck
- Pixel-level prediction long-horizon consistency inferior to latent-space models
- World model errors directly affect VLA input quality

## Connection to Prior Work
- Descendant of GRPO (DeepSeek) applied to VLA
- Related to pixel-level video generation models (Cosmos Predict, GigaWorld)
- Contrast with DayDreamer: paradigm shift from latent-space to pixel-level

## Implications for Our Research
- **Long-horizon**: Pixel-level world model generation overhead is high for long-horizon tasks. May need hierarchical generation (keyframes + interpolation) or hybrid latent-pixel architecture.
- **Home scenes**: Pixel-level world model aligned with VLA visual pretraining helps home scene visual understanding. But generation quality must be high enough to not mislead VLA.
- **Directly testable**: If we have VLA model (e.g., GR-2 or OpenVLA), can try pixel-level world model (e.g., fine-tuned video diffusion model) with on-policy GRPO. Watch computational cost.
