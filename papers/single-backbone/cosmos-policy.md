# Cosmos Policy: Fine-Tuning Video Models for Visuomotor Control and Planning

> **arXiv'26.01** | [arXiv](https://arxiv.org/abs/2601.16163) | [Code](https://github.com/NVlabs/cosmos-policy) | [Project](https://research.nvidia.com/labs/dir/cosmos-policy/)

## TL;DR
Cosmos Policy 提出了一种极简方法：无需任何架构修改，仅通过单阶段后训练将预训练视频模型（Cosmos-Predict2-2B）适配为机器人策略。核心创新是**Latent Frame Injection**——将动作、未来状态、价值函数等模态编码为潜在帧注入视频扩散序列，使同一模型同时充当策略、世界模型和价值函数。

## Core Idea
现有方法适配视频模型用于机器人控制时，要么需要多阶段训练和新增架构组件，要么放弃了预训练视频模型的时空先验。Cosmos Policy 的核心洞察是：**视频扩散模型的学习算法天然适合建模复杂多模态分布，包括动作分布**。通过将新模态编码为潜在帧直接注入视频模型的潜在扩散过程，可以在不修改架构的情况下利用预训练模型的全部能力。

## Architecture

```
Input: Initial image + text instruction
       ↓
┌─────────────────────────────────────────────┐
│  Cosmos-Predict2-2B (DiT backbone)          │
│  • Wan2.1 VAE tokenizer                     │
│  • Latent Frame Injection:                  │
│    - robot proprioception                   │
│    - action chunk                           │
│    - future proprioception                    │
│    - future camera images                   │
│    - future state value                     │
│  • All encoded as latent frames             │
└─────────────────────────────────────────────┘
```

### Key Design: Latent Frame Injection
- 将不同模态（proprioception、action、value）填充并复制到 H'×W'×C' 的潜在体积中
- 将新潜在帧插入现有视频潜在序列中
- 灵活适配任意机器人配置（1个摄像头 → 移除对应潜在帧即可）

## Training: Three Functions in One Model

**Batch composition:**
- 50% demonstrations → train policy: p(a, s', V(s')|s)
- 25% rollouts → train world model: p(s', V(s')|s, a)
- 25% rollouts → train value function: p(V(s')|s, a, s')

**Deployment modes:**
1. **Direct policy** (parallel decoding): Fast, only actions needed
2. **Planning policy** (autoregressive decoding): Higher quality future state/value predictions

## Planning: Best-of-N Sampling

1. Sample N action proposals from policy model
2. Planning model predicts future state & value for each
3. Ensemble predictions (world model: 3 queries/action, value: 5 queries/state)
4. "Majority mean" aggregation → select highest-value action

## Experimental Results

| Benchmark | Metric | Cosmos Policy | Baselines |
|-----------|--------|---------------|-----------|
| LIBERO | Avg Success | **98.5%** | π0.5, OpenVLA-OFT, DP-VLA |
| RoboCasa | Avg Success | **67.1%** | UVA, VideoPolicy, GR00T |
| Real-world bimanual | Avg Success | **93.6%** | π0.5, GigaBrain-0 |

- **Data efficiency**: 50 human demos matches/surpasses methods using 300-3000 demos
- **Planning boost**: +12.5% on challenging real-world tasks vs direct policy
- **Rollout learning critical**: World model trained only on demonstrations cannot plan effectively

## Strengths
- **Ultimate simplicity**: Zero architectural changes, single-stage post-training
- **Unified architecture**: Policy + world model + value function in one model
- **Flexible**: Latent injection adapts to any robot setup
- **Strong planning**: Best-of-N with learned world model and value function

## Limitations
- **Computation**: Best-of-N planning needs multiple GPUs for parallel inference
- **Rollout data cost**: Requires collecting and labeling policy rollouts (including failures)
- **Full chunk execution**: No receding-horizon control during action execution
- **Value variance**: Monte Carlo returns can be high-variance

## Connections
- **vs VideoPolicy**: Both leverage video generation as policy backbone. Cosmos Policy goes further by unifying policy, world model, and value function without architectural changes.
- **vs UVA/UWM**: These require custom joint architectures; Cosmos Policy proves pretrained video models are sufficient as-is.
- **vs DreamZero**: DreamZero focuses on real-time control and zero-shot generalization; Cosmos Policy focuses on planning and data efficiency.
- **vs GigaWorld-Policy**: GigaWorld-Policy makes video generation optional at inference for speed; Cosmos Policy always generates all modalities but uses them for planning.

## Relevance to Long-Horizon VLA
Cosmos Policy's latent frame injection is a powerful technique that could be directly applied to our long-horizon VLA research:
- Encode subgoals, intermediate rewards, or task progress as latent frames
- Unified planning: use the same model for both low-level control and high-level value estimation
- The best-of-N planning approach naturally extends to hierarchical decision making

---

*Analyzed: 2026-05-09*
