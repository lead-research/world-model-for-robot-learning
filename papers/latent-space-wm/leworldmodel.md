# LeWorldModel (LeWM): Stable End-to-End JEPA from Pixels

- **Venue**: arXiv'26.03
- **arXiv**: [2603.19312](https://arxiv.org/abs/2603.19312)
- **PDF**: [https://arxiv.org/pdf/2603.19312](https://arxiv.org/pdf/2603.19312)
- **GitHub**: [LeLidec/LeWorldModel](https://github.com/LeLidec/LeWorldModel) (3.6k+ stars)
- **Category**: Latent-space World Modeling / JEPA
- **Authors**: Lucas Maes, Quentin Le Lidec, Damien Scieur, Yann LeCun, Randall Balestriero
- **Institutions**: Mila & Université de Montréal, NYU, Samsung SAIL, Brown University

## Core Problem
Existing JEPA methods are fragile, relying on complex multi-term losses, exponential moving averages, pre-trained encoders, or auxiliary supervision to avoid representation collapse. How to design a stable, simple, end-to-end trainable JEPA world model?

## Core Method
LeWorldModel (LeWM) — the first JEPA that trains stably end-to-end from raw pixels using only two loss terms: a next-embedding prediction loss and a regularizer enforcing Gaussian-distributed latent embeddings (SIGReg).

## Key Characteristics
- **Minimal losses**: only 2 loss terms (MSE prediction + SIGReg), hyperparameters reduced from 6 to 1
- **No heuristics**: no stop-gradient, EMA, pre-trained encoders, or auxiliary supervision
- **Tiny model**: ~15M parameters, trainable on a single GPU in a few hours
- **Ultra-fast planning**: 48x faster than foundation-model-based world models
- **Physically interpretable**: latent space encodes physical structure, can probe physical quantities
- **Provable anti-collapse**: SIGReg provides theoretical anti-collapse guarantees

## Key Insight
JEPA representation collapse can be elegantly solved through "Gaussian distribution constraint" — no need for complex training tricks. Latent embeddings are projected onto random directions, normality tests applied to each 1D projection, and statistics aggregated to match isotropic Gaussian. This is SIGReg's core and the key to LeWM's minimalist stable training.

## Technical Details
- **Architecture**: Encoder (frame → low-dim latent) + Predictor (current latent + action → next latent)
- **Training objective**:
  - Prediction loss: `L_pred = MSE(z_{t+1}, Predictor(z_t, a_t))`
  - SIGReg: `L_reg = SIGReg(z)` — forces Gaussian-distributed latent embeddings
- **SIGReg mechanism**: Project latents onto random directions → normality test per 1D projection → aggregate statistics
- **End-to-end**: Encoder and Predictor jointly optimized, no stop-gradient, no EMA, no pre-training
- **Model size**: ~15M parameters, single GPU training in hours
- **Inference**: Pure latent-space planning, no pixel generation, 48x faster than pixel-based world models

## Experimental Results
- **2D/3D control**: Competitive across diverse control tasks, comparable to foundation-model methods
- **Planning speed**: 48x faster than foundation-model-based world models
- **Physical probing**: Latent space can linearly probe physical quantities (position, velocity), indicating meaningful physical structure encoding
- **Surprise detection**: Reliably detects physically implausible events (anomalous gravity, kinematic violations)
- **Ablation**: Stable training with just 1 hyperparameter, no tuning search needed

## Limitations
- Not validated on real robot manipulation — only 2D/3D game/control environments (DMC, Atari)
- Visual complexity limited — not tested on real-world visual clutter, textures, lighting
- Contact physics not validated — complex grasping/manipulation modeling untested
- No language input — pure vision-action, no vision-language interface
- Long-horizon multi-step planning not explicitly detailed

## Connection to Prior Work
- **JEPA family**: LeWM is the end-to-end implementation breakthrough of JEPA (LeCun), alongside VLA-JEPA, JEPA-VLA, DINO-WM
- **Unique in Latent-space WM**: The **only** fully end-to-end trainable JEPA among all 6+ prior papers — no pre-training or freezing required
- **RL-ready**: Pure latent-space model seamlessly usable as RL state space, 48x planning speed ideal for MPC or MBRL

## Implications for Our Research
- **Long-horizon**: Pure latent-space planning naturally fits long-horizon tasks — no pixel generation needed, 48x speed supports longer-horizon MPC. Can quickly deploy on lab Pallas/Piper for MPC control testing.
- **Home scenes**: Real-time planning for dynamic obstacle avoidance is a strength. Real-world visual complexity is the challenge — start with simple scenes.
- **Directly testable**:
  1. Train LeWM on lab Pallas/Piper camera data (~15M params, single GPU, hours) → latent-space MPC planning, compare speed with diffusion policy
  2. Use LeWM's latent space as VLA state space — connect VLA action head to LeWM's predictor for joint "latent WM + VLA action" architecture
  3. Replace EMA/stop-gradient in existing JEPA methods with SIGReg to simplify VLA-JEPA or JEPA-VLA training
- **Key advantage**: 15M params, single GPU, 1 hyperparameter — enables rapid iteration in lab without massive compute.
