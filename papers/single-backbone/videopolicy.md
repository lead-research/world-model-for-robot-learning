# Video Generators are Robot Policies (VideoPolicy)

> **arXiv'25.08** | [arXiv](https://arxiv.org/abs/2508.00795) | [Code](https://github.com/cvlab-columbia/videopolicy) | [Project](https://videopolicy.cs.columbia.edu/)

## TL;DR
VideoPolicy 提出了一种将视频生成作为机器人策略学习代理的模块化框架。通过联合视频扩散模型和动作扩散头，仅需极少的人类示范数据即可学习鲁棒策略，并在未见物体、背景和任务上展现强泛化能力。

## Core Idea
当前视觉运动策略面临两大挑战：分布偏移下泛化差、人类示范数据量受限。VideoPolicy 的核心洞察是：**学习生成策略执行视频是一个比直接学习动作更通用的目标**。只要视频生成模型能准确合成机器人行为视频，一个轻量级的动作解码器仅需极少数据即可学会将视频映射为可执行动作。

## Architecture

```
Input: v_0 (初始观测), c (文本指令)
       ↓
┌─────────────────────────────────────┐
│  Video U-Net (μ_θ) - SVD-based      │
│  • CLIP text embedding φ(c)           │
│  • VAE-encoded image z_0             │
│  • Generates future frames {v̂_t}    │
└────────────┬──────────────────────────┘
             │ Intermediate features
             │ (layers 9,14,17,20,23)
             ↓
┌─────────────────────────────────────┐
│  CNN Adapter                        │
│  • Spatiotemporal → global vector h_i│
└────────────┬──────────────────────────┘
             ↓
┌─────────────────────────────────────┐
│  Action U-Net (α_θ) - 1D CNN       │
│  • Conditioned on h_i               │
│  • Generates action sequence {a_t}  │
└─────────────────────────────────────┘
```

### Key Design Choices
1. **Two-stage training**: Video model first → freeze → action head. Crucially, **stop gradients from action loss to video model**.
2. **Multi-view support**: 3 cameras (gripper + 2 side views), concatenated along temporal dimension.
3. **Modular action head**: Based on Diffusion Policy but conditioned on video internal representations rather than raw observations.

## Training Objectives

**Video Model:**
```
L_video = E[||ε - μ_θ(z_i, i, φ(c), z_{i,0})||²]
```

**Action Model:**
```
L_action = E[||ε - α_θ(a_i, i, h_i)||²]
```

Where h_i is the adapted video U-Net feature at denoising step i.

## Experimental Results

### Simulation (RoboCasa & Libero10)
| Benchmark | Method | Demos | Avg Success |
|-----------|--------|-------|-------------|
| RoboCasa | DP-ResNet | 50 | ~40% |
| RoboCasa | UVA | 50 | Fails |
| RoboCasa | GR00T | 300 | ~65% |
| RoboCasa | **VideoPolicy** | **50** | **~70%** |
| RoboCasa | VideoPolicy | 300 | ~75% |
| Libero10 | UVA | 50 | ~50% |
| Libero10 | **VideoPolicy** | **50** | **~65%** |

### Real-World (5 tasks, 200 demos each)
Strong generalization to:
- Object location variations
- Unseen objects
- Background changes

Failure modes: Tasks requiring precise force control (e.g., Stack Cups).

## Key Findings from Ablations

1. **Video prediction horizon matters**: Longer horizons → better generalization, especially on distribution-shift tasks.
2. **Action-free data is valuable**: Training action head on 12 tasks + video pretraining on all 24 tasks → generalizes to unseen 12 tasks.
3. **Two-stage > Joint**: Isolating video and action training significantly outperforms end-to-end joint training.

## Strengths
- **Data efficiency**: 50 demos match/surpass methods using 300-3000 demos
- **Strong generalization**: Unseen objects, backgrounds, tasks
- **Modular**: Can leverage large-scale unlabeled video data
- **Simple architecture**: Easy to implement and extend

## Limitations
- Video diffusion inference speed not discussed (real-time concerns)
- Long-horizon tasks not evaluated
- Force-control tasks remain challenging
- Why joint training fails not fully explained

## Connections to Related Work
- **vs UVA**: Both joint video+action, but VideoPolicy's simpler multi-view architecture succeeds where UVA's single-camera design fails
- **vs Diffusion Policy**: Action head is DP conditioned on video features instead of observations
- **vs IDM-style (UniPi)**: VideoPolicy is end-to-end joint diffusion, not decoupled predict-then-act
- **vs Latent-space WM**: Operates in pixel space (more interpretable, heavier) vs hidden space (lighter, less interpretable)

## Open Questions
1. Can the action decoder be simplified to a linear layer? What's the capacity lower bound?
2. How to scale to internet-scale video pretraining (YouTube, etc.)?
3. Video generation hallucinations → safety concerns in physical world?
4. Extension to long-horizon tasks with hierarchical planning?

## Relevance to Long-Horizon VLA
VideoPolicy's insight that **video generation is a stronger proxy objective than action generation** directly relevant to our long-horizon VLA research:
- Video prediction could serve as intermediate subgoal generation
- Action-free video data can augment limited human demonstrations
- Multi-view architecture aligns with our multi-camera robot setup

---

*Analyzed: 2026-05-09 | Next: Cosmos Policy (arXiv'26.01)*
