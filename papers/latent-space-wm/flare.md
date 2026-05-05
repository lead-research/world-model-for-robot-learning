# 🔬 FLARE — Robot Learning with Implicit World Modeling

**作者**: Ruijie Zheng, Jing Wang, Scott Reed 等 (NVIDIA GEAR Lab)  
**会议**: CoRL 2025  
**链接**: [arXiv](https://arxiv.org/abs/2505.15659) | [Project](https://research.nvidia.com/labs/gear/flare)

---

## 一句话总结

在标准 VLA 模型的 DiT 中添加少量 **future tokens**，训练它们对齐未来观测的隐嵌入，实现**零推理开销**的隐式世界建模。

---

## 核心问题

> 如何在 VLA 中引入世界建模能力，而不引入显式视频预测的昂贵计算开销？

---

## 核心方法

### Stage 1: Action-aware Future Embedding Model（预训练）

- **架构**: SigLIP-2 (vision + text) → 4层 SA → Q-former → **32 query tokens**
- **关键**: 端到端训练（附加 DiT 做动作预测），确保嵌入是 **action-aware**
- **数据**: ~2000h 跨 embodiment 机器人数据
- **效果**: 跨 embodiment 泛化， compact 但 task-relevant

### Stage 2: FLARE Policy Co-training（后训练）

- 在 action/state tokens 外添加 **M=32 learnable future tokens**
- 在 DiT 第6层取出 future tokens 激活，MLP投影
- 与 **未来观测的 EMA VL 嵌入** 做 **余弦相似度对齐**
- 联合损失: `L = L_fm + 0.2 * L_align`
- **推理时**: future tokens 不参与动作输出 → **零开销**

---

## 主要特点

1. **极轻架构修改**: 仅需添加 future tokens，不改 backbone
2. **零推理开销**: 仅训练时起作用，部署无额外计算
3. **Action-aware 嵌入**: 专门预训练的 VL 嵌入，非通用 vision encoder
4. **支持无动作标签数据**: 可用人类 egocentric 视频联合训练
5. **跨 embodiment 泛化**: 预训练嵌入模型可泛化到 unseen 机器人类型

---

## 与现有方法对比

| 维度 | FLARE | UWM | DINO-WM | GR00T N1 |
|------|-------|-----|-----------|----------|
| **世界建模方式** | 隐式 (隐空间对齐) | 显式 (VAE latent 预测) | 隐式 (DINO特征规划) | 无 (纯策略) |
| **推理开销** | **零** | 高 (需生成 latents) | 中等 | 低 |
| **与策略耦合** | 联合训练 | 联合训练 | 独立规划 | — |
| **是否需要动作标签** | 否 (支持视频-only) | 是 | 是 | 是 |
| **训练效率** | 80k steps | 400k steps (仍不足) | — | — |
| **RoboCasa 性能** | **70.1%** | 60.8% | — | 60.6% |

- **vs UWM**: FLARE 不重建任何像素/VAE latent，只对齐隐表征，计算量极小但效果更好
- **vs DINO-WM**: DINO-WM 专注 zero-shot 规划，FLARE 专注 policy + world model 联合训练
- **vs GR00T N1**: FLARE 在相同架构上仅添加 future alignment，即取得显著提升 (+9.5%)

---

## 实验结果深度分析

### 主要 Benchmark

| Benchmark | FLARE | Policy Only | 提升 |
|-----------|-------|-------------|------|
| RoboCasa (24任务) | **70.1%** | 61.9% | +8.2% |
| GR1 仿真 (24任务) | **55.0%** | 44.0% | +11% |
| 真实 GR1 (4任务) | **95.1%** | 81.0% | +14.1% |

### 消融实验发现

| 实验 | 成功率 | 关键发现 |
|------|--------|---------|
| 无 FLARE loss | 43.9% | baseline |
| SigLIP2 (通用 vision) | 49.6% | +5.7% — 通用 embedding 有一定帮助 |
| SigLIP2 (Average Pool) | 50.9% | +7% — pooling 略好于 raw tokens |
| **Action-aware Embedding** | **55.0%** | **+11.1%** — action-aware 是关键 |

**EMA 系数分析**:
- ρ=0.995 → **最优** (55.0%)
- ρ=1.0 (frozen) → 54.2% — 仍有效
- ρ=0.99 → 最差 — 更新太快导致不稳定

### 人类视频联合训练 (关键泛化性实验)

| 每物体机器人演示数 | 仅用机器人数据 | +人类视频 (FLARE) |
|-------------------|---------------|-------------------|
| 1 | 低 (~20%) | **37.5% → 60%** |
| 10 | ~40% | **80%** |

- 使用 150 人类 egocentric 视频/物体 (GoPro 头部拍摄)
- 人类视频**无动作标签**，仅用 future alignment loss
- **家庭场景启示**: 可低成本利用互联网/家庭视频扩展训练数据

---

## 存在的不足/局限性

1. **任务范围有限**: 仅验证 pick-and-place，更复杂灵巧操作未测
2. **未与 RL 结合**: 仅 imitation learning，未探索 RL 后训练
3. **人类视频受控环境**: GoPro 头部拍摄，未扩展到自然家庭场景
4. **单步未来对齐**: 仅预测 t+H 时刻，未涉及多步/层次化未来
5. **经验性超参**: EMA ρ=0.995 和 layer 6 选择偏经验性，理论理解有限
6. **家庭场景泛化未验证**: 跨家庭布局、不同光照条件的泛化能力未知

---

## 与已有知识的关联

- **技术谱系**: GR00T N1 (DiT+VLA) → FLARE (添加隐式世界建模)
- **REPA 迁移**: 文本到图像扩散的表征对齐技术 → 机器人策略 + 未来对齐
- **JEPA 思想**: 本质上是 JEPA 在 VLA 中的实现——隐空间预测，非像素空间

---

## 对研究工作的启示

### 长程任务
- 单步 future alignment 可直接用于长程任务中的短期预测
- 但需扩展到**多步/层次化** future alignment 才能支撑长程规划

### 泛化性/家庭场景
- ✅ **家庭视频利用**: 低成本利用家庭 egocentric 视频扩展训练数据，无需动作标签
- ✅ **跨 embodiment 预训练**: 嵌入模型跨机器人类型泛化，适合家庭机器人的多样性
- ⚠️ **未验证**: 不同家庭布局、光照、物品差异的泛化能力仍需测试
- ⚠️ **动态环境**: 未考虑家庭中人移动物品等动态干扰

### 直接可试
1. 在 Piper/Pallas 上快速验证 future tokens 架构
2. 收集少量家庭场景视频 + 少量机器人数据联合训练
3. 测试跨房间/跨家庭的 zero-shot 泛化

---

*笔记日期: 2026-05-05 | 作者: Lead*
