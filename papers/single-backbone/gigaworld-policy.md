# GigaWorld-Policy: An Efficient Action-Centered World–Action Model

> **arXiv'26.03** | [arXiv](https://arxiv.org/abs/2603.17240) | [Project](https://gigaai-research.github.io/GigaWorld-Policy/)

## TL;DR
GigaWorld-Policy 提出了一种以动作为中心的 WAM，通过因果注意力设计实现推理时可选的视频生成。在训练时利用未来视频作为辅助监督，但推理时可跳过视频生成直接解码动作，实现 9 倍于 Motus 的推理加速，同时提升 7% 任务成功率。

## Core Idea
现有 WAM 方法在推理时必须生成未来视频，导致高延迟且视频误差会传播到动作。GigaWorld-Policy 的核心洞察是：**通过因果注意力阻止未来视频 token 影响动作 token，可以保持视频作为训练监督的价值，同时实现推理时的动作-only 快速解码**。

## Architecture

```
Input: Multi-view RGB + Language instruction + Proprioception
       ↓
┌─────────────────────────────────────────────┐
│  Wan 2.2 5B Diffusion Transformer           │
│  • Multi-view: Compose(left, front, right)  │
│  • Shared transformer blocks (QKV shared)   │
│  • Causal attention mask                     │
│    - Action tokens attend to {state, obs}   │
│    - Future video attends to {state, obs,   │
│      action}                                 │
│  • Language via cross-attention              │
└─────────────────────────────────────────────┘
       ↓
Output: Action chunk (+ optional future video)
```

### Causal Attention Mask

```
Token sequence: [T_o | T_s | T_a | T_f]

T_o (obs):     attends to T_o, T_s
T_s (state):   attends to T_o, T_s
T_a (action):  attends to T_o, T_s, T_a
T_f (future):  attends to T_o, T_s, T_a, T_f
```

This ensures:
- **No information leakage** from predicted future frames into action generation
- **Feedforward dynamics**: Future video conditioned on predicted actions
- **Inference flexibility**: Can generate only action tokens (fast) or joint action+video

## Training: Three-Stage Curriculum

### Stage 1: General Video Pretraining
- Initialize from Wan (trained on diverse web videos)

### Stage 2: Embodied Pretraining (~10,000 hours)
- **Robot videos**: Agibot (2,500h), DROID (350h), RDT (25h), RoboMind (300h), ATARA (10h)
- **Egocentric human videos**: Ego4D (3,500h), EgoDex (800h), Something-Something V2 (200h)
- **Objective**: Only video flow matching (learn visual-action dynamics)

### Stage 3: Target Robot Post-training
- Task trajectory data: images + language + actions
- **Objective**: λ_action=5, λ_video=1 (emphasize action, retain video regularization)

## Training Objectives

**Video flow matching:**
```
L_video = E[||g_Θ(z_f^(s), s | T_s, T_o, T_a, T_l) - ż_f^(s)||²]
```

**Action flow matching:**
```
L_action = E[||g_Θ(a^(s), s | T_s, T_o, T_l) - ȧ^(s)||²]
```

**Combined:**
```
L_all = λ_video L_video + λ_action L_action
```

## Inference: Action-Only Mode

1. Form context: w_t = (T_l, T_s, T_o)
2. Sample action tokens: a^(0) ~ N(0, I)
3. Integrate velocity field: da^(s)/ds = g_Θ(a^(s), s | w_t)
4. Decode to action chunk: â_{t:t+p-1}
5. Execute → observe → repeat

**Optional**: Reuse KV cache from action denoising to conditionally generate future video if needed.

## Experimental Results

| Setting | Method | Success Rate | Inference Time |
|---------|--------|-------------|----------------|
| Real-world | Motus | baseline | several seconds |
| Real-world | **GigaWorld-Policy** | **+7%** | **0.36s (9x faster)** |
| RoboTwin 2.0 | π0.5 | baseline | - |
| RoboTwin 2.0 | **GigaWorld-Policy** | **+95%** | comparable |

- **Speed-performance Pareto**: Dominates prior WAMs in both speed and accuracy (Figure 1)
- **Multi-view reasoning**: Composite image preserves cross-view consistency without architectural changes

## Strengths
- **Efficient**: 9x faster than leading WAM baseline
- **Action-centered**: Robust to video prediction errors at inference
- **Strong pretraining**: 10,000 hours diverse data for embodiment-agnostic priors
- **Flexible inference**: Optional video generation when needed

## Limitations
- **No test-time video validation**: Skipping video generation at inference removes a sanity-check mechanism
- **Composite image resolution**: Multi-view concatenation may limit per-view resolution
- **Sparse future prediction**: Δ=12 step stride may miss intermediate dynamics
- **Pretraining scale**: 10,000 hours requires significant compute resources

## Connections
- **vs Motus**: Both are WAMs with 5B DiT backbones. GigaWorld-Policy uses causal masking for speed; Motus uses MoT architecture.
- **vs Cosmos Policy**: Cosmos Policy always generates all modalities for planning; GigaWorld-Policy makes video optional for speed.
- **vs DreamZero**: DreamZero maintains full joint generation with system optimization; GigaWorld-Policy uses causal design to fundamentally reduce inference cost.
- **vs π0.5**: GigaWorld-Policy matches π0.5's inference speed while leveraging video pretraining for 95% performance improvement.

## Relevance to Long-Horizon VLA
GigaWorld-Policy's causal design provides a blueprint for efficient long-horizon control:
- **Action-only inference** enables reactive low-level control
- **Optional video generation** can be activated for planning subgoals in long-horizon tasks
- **Three-stage training** (general → embodied → target) directly applicable to our multi-robot lab setup
- The λ_action=5, λ_video=1 weighting suggests action prediction should dominate, with video as regularizer

---

*Analyzed: 2026-05-09*
