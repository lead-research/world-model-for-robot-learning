# DreamZero: World Action Models are Zero-shot Policies

> **arXiv'26.02** | [arXiv](https://arxiv.org/abs/2602.15922) | [Code](https://github.com/dreamzero0/dreamzero) | [Project](https://dreamzero0.github.io/)

## TL;DR
DreamZero 是一个 14B 参数的 World Action Model (WAM)，基于预训练视频扩散骨干（Wan）。通过自回归 DiT 架构联合预测未来视频帧和动作，实现了对未见任务和环境的零样本泛化，并支持跨 embodiment 迁移。通过系统优化实现 38 倍推理加速，达到 7Hz 实时闭环控制。

## Core Idea
VLA 模型擅长语义泛化但难以泛化到未见物理运动。DreamZero 的核心洞察是：**基于视频扩散的世界动作模型继承了丰富的时空物理先验，能够从异构、非重复的机器人数据中有效学习，实现零样本环境和任务泛化**。

## Architecture

```
Input: Visual context (VAE) + Language (text encoder) + Proprioception (state encoder)
       ↓
┌─────────────────────────────────────────────┐
│  14B Autoregressive DiT (Wan backbone)       │
│  • Flow matching training                    │
│  • Joint video + action denoising            │
│  • Chunk-wise generation (K latent frames)   │
│  • KV cache for efficient inference          │
└─────────────────────────────────────────────┘
       ↓
Output: Future video frames + Action chunk
```

### Key Design Choices
1. **End-to-end joint prediction**: Single model jointly denoises video and action with shared objective
2. **Autoregressive architecture**: 
   - KV caching for arbitrarily long contexts
   - Preserves native frame rate for precise video-action alignment
   - Ground-truth observations replace predicted frames in KV cache after each execution (eliminates compounding errors)
3. **Teacher-forcing chunk-wise denoising**: Model denoises noisy current chunk conditioned on clean previous chunks
4. **Shared denoising timestep**: Video and action share t_k for faster convergence

## Training Objective (Flow Matching)

```
z_{t_k}^k = t_k z_1^k + (1-t_k) z_0^k
a_{t_k}^k = t_k a_1^k + (1-t_k) a_0^k

L(θ) = E[1/K Σ w(t_k) ||u_θ([z_{t_k}^k, a_{t_k}^k]; C_k, c, q_k, t_k) - v^k||²]

where v^k = [z_1^k, a_1^k] - [z_0^k, a_0^k] (joint velocity)
```

## System Optimizations (38x Speedup)

| Optimization | Technique | Impact |
|-------------|-----------|--------|
| **DreamZero-Flash** | Decoupled video/action denoising schedules | Algorithmic |
| **CFG Parallelism** | Distribute conditional/unconditional across 2 GPUs | -47% per-step latency |
| **DiT Caching** | Reuse cached velocities when cosine similarity > threshold | 16 steps → 4 steps |
| **Torch Compile** | CUDA Graphs, operator fusion | Eliminates CPU overhead |
| **Quantization** | NVFP4 on Blackwell (QKV/Softmax kept in higher precision) | Memory/compute reduction |

**Result**: ~5.7s per chunk → ~150ms (below 200ms target for reactive control)

## Experimental Results

### Real-World Generalization
- **vs SOTA VLAs**: >2x improvement on environment and task generalization benchmarks
- **Retention after task-specific post-training**: Outperforms SOTA VLAs by 10% on average task progress

### Cross-Embodiment Transfer
1. **Video-only transfer**: 10-20 minutes of video-only demos from other robots/humans → 42%+ relative improvement on unseen tasks
2. **Few-shot adaptation**: Pretrained on AgiBot G1 → 30 minutes of play data on new robot (YAM) → retains zero-shot generalization

### Simulation (Genie Sim 3.0)
- Trained on only ~500 hours real-world data
- Non-trivial performance on 100-task simulation benchmark without explicit simulation training

## Strengths
- **Zero-shot generalization**: Unseen verbs, motions, environments
- **Heterogeneous data learning**: Effective learning from diverse, non-repetitive trajectories
- **Real-time control**: 7Hz closed-loop at 14B scale
- **Cross-embodiment**: Both video-only transfer and few-shot adaptation

## Limitations
- **7Hz may be limiting**: For some high-frequency control tasks
- **~500 hours data**: Scale not fully explored
- **Memory tasks**: Not explicitly evaluated
- **Force/tactile**: No modeling of force feedback

## Connections
- **vs VLAs (π0.5, RT-2)**: VLAs inherit semantic priors; DreamZero inherits spatiotemporal/physical priors. Complementary approaches.
- **vs VideoPolicy/Cosmos**: Both are WAMs, but DreamZero uniquely achieves real-time control at 14B scale and cross-embodiment transfer.
- **vs GigaWorld-Policy**: GigaWorld-Policy optimizes for inference speed via causal masking; DreamZero optimizes via system-level acceleration while maintaining full joint generation.

## Relevance to Long-Horizon VLA
DreamZero's autoregressive chunk-wise generation and KV cache mechanism are directly applicable:
- **Long-horizon support**: Native long-context handling via autoregressive architecture
- **Memory**: Visual history naturally accumulated in KV cache
- **Real-time deployment**: System optimizations (CFG parallelism, DiT caching, quantization) directly transferable
- **Cross-embodiment**: Our lab's multi-robot setup (Piper, Pallas) could benefit from shared video pretraining

---

*Analyzed: 2026-05-09*
