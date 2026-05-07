# 🔬 Latent-space World Modeling 综述

> 分类: Latent-space World Modeling  
> 完成日期: 2026-05-07  
> 论文数: 6 (全部完成)  
> 状态: ✅ 已完成

---

## 一句话总结这个方向

**在表征空间（而非像素空间）预测未来状态，以极低成本赋予VLA世界建模能力。** 核心共识：不生成视频，只预测紧凑、任务相关的隐表征。

---

## 技术演化图谱

```
2023: DINO-WM (DINO特征规划，独立规划器)
   ↓
2024: GR00T N1 (纯VLA，无世界建模)
   ↓
2025.05: FLARE (CoRL) — 在VLA内部添加future tokens做隐对齐，零推理开销
   ↓
2026.02: VLA-JEPA — 完整JEPA架构预训练，leakage-free，系统级方案
   ↓
2026.02: VISTA — 将隐空间预测扩展为显式视觉子目标规划（层次化）
   ↓
2026.02: JEPA-VLA — 从表征源头注入JEPA（替换vision backbone）
   ↓
2026.02: WoG — 在"条件空间"做世界建模，自动发现对动作最有用的未来信息
   ↓
2026.03: DIAL — System-2/1结构化架构，latent intent作为可微分瓶颈
```

---

## 六篇论文完整对比

| 论文 | 核心思想 | 预测对象 | 架构改动 | 推理开销 | 数据效率 | 层次化 |
|------|---------|---------|---------|---------|---------|--------|
| **FLARE** | Future token alignment | Action-aware VL嵌入 | 小 (32 tokens) | **零** | 中 | ❌ |
| **VLA-JEPA** | 完整JEPA预训练 | V-JEPA2 world states | 大 (target+predictor) | 中 | 高 | ⚠️ |
| **VISTA** | 视觉子目标规划 | 视觉子目标图像 (goal images) | 中 | 中 (planning延迟) | **极高 (2h)** | ✅ 宏观 |
| **JEPA-VLA** | V-JEPA2替换backbone | V-JEPA2视觉表征 | **极小** | 低 | 中 | ❌ |
| **WoG** | Condition space预测 | Action conditions | 中 | 低 | 中 | ❌ |
| **DIAL** | System-2/1意图瓶颈 | VLM feature space foresight | 大 | 中 | **极高 (10x)** | ⚠️ 微观 |

---

## 方法子分类

### 按"隐空间预测的目标"

| 子类型 | 代表 | 预测什么 | 特点 |
|--------|------|---------|------|
| **Future Embedding Alignment** | FLARE | Action-aware VL嵌入 | 最轻量，零推理开销 |
| **JEPA State Prediction** | VLA-JEPA | V-JEPA2 world states | 系统级，leakage-free |
| **Visual Subgoal** | VISTA | 视觉子目标图像 | 显式层次化，可解释 |
| **Video Predictive Embedding** | JEPA-VLA | V-JEPA2视觉表征 | 即插即用，改backbone |
| **Condition Space** | WoG | Action conditions | 自发现冗余剔除 |
| **Latent Intent** | DIAL | VLM feature space foresight | 结构化认知瓶颈 |

### 按"架构侵入性"

| 侵入性 | 论文 | 改动 |
|--------|------|------|
| **极低** | JEPA-VLA | 替换vision encoder |
| **低** | FLARE | 添加32个future tokens |
| **中** | VISTA, WoG | 新增模块/两阶段训练 |
| **高** | VLA-JEPA, DIAL | 完整新架构 |

---

## 共同发现 / 领域共识

1. **像素重建是死路**：6篇全部避免逐像素预测
2. **人类视频是共享杠杆**：全部支持从人类视频学习（无需动作标签）
3. **EMA/冻结target是关键**：FLARE用EMA，VLA-JEPA用冻结V-JEPA2，WoG freeze encoder——稳定的target space是成功前提
4. **Action-aware > Generic**：专门为动作优化的表征优于通用视觉表征（FLARE消融实验证明+11.1%）
5. **两阶段训练是主流**：除JEPA-VLA外，多数采用两阶段（预训练发现 → 预测优化）

---

## 关键分歧 / 开放问题

| 分歧点 | 阵营A | 阵营B | 尚未解决 |
|--------|-------|-------|---------|
| **显式 vs 隐式** | VISTA: 显式视觉子目标（可解释，有延迟） | FLARE/JEPA-VLA: 纯隐式（高效，黑盒） | 能否兼得？ |
| **Backbone替换 vs 增强** | JEPA-VLA: 替换vision encoder | FLARE/WoG: 在现有架构上增强 | 最佳组合？ |
| **层次化 vs 端到端** | VISTA: 宏观层次化 | DIAL: 微观结构化端到端 | 长程任务最佳架构？ |
| **人类视频比例** | VLA-JEPA: 人类视频提升鲁棒性但可能引入噪声 | FLARE: 人类视频显著提升低数据场景 | 最优混合比例？ |
| **噪声鲁棒性** | π0在Noise扰动上领先JEPA类(-12.7%) | JEPA类在外观变化上大幅领先 | 如何兼得两者？ |

---

## 技术工具箱（可复用方法）

| 方法 | 来源 | 适用场景 |
|------|------|---------|
| Future Token Alignment | FLARE | 快速增强现有VLA，零推理开销 |
| EMA Target + Cosine Loss | FLARE | 稳定的隐空间对齐 |
| Leakage-Free JEPA | VLA-JEPA | 预训练世界模型，防止信息泄漏 |
| Time-Causal Attention | VLA-JEPA | 时序动力学建模 |
| Goal-Image Conditioning | VISTA | 显式层次化规划 |
| Visual Subgoal Generation | VISTA | 长程任务分解 |
| V-JEPA2 Backbone | JEPA-VLA | 即插即用提升视觉表征 |
| Q-former Condition Encoder | WoG | 自动发现action-relevant conditions |
| Two-Stage Curriculum | WoG, DIAL | 稳定训练复杂架构 |
| Latent Inverse Dynamics | DIAL | 从意图到动作的硬瓶颈映射 |
| Decoupled Warmup | DIAL | 防止多模块联合训练的梯度冲突 |

---

## 研究机会（Gaps）

1. **层次化 + 结构化的组合**：VISTA的宏观层次化 + DIAL的微观结构化 = 完整长程方案，尚无论文实现
2. **JEPA-VLA + FLARE叠加**：JEPA-VLA做backbone + FLARE做future alignment，预期协同增益
3. **家庭场景验证**：6篇全部在实验室桌面/仿真验证，真实家庭场景（clutter, 动态, 开放词汇）是空白
4. **RL后训练**：全部仅imitation learning，未探索RL在latent space中的后训练
5. **多步未来预测**：FLARE/VLA-JEPA等仅单步/短horizon，长程需要层次化多步预测

---

## 后续分类关联

### Latent-space WM → Single-backbone Policies
- Single-backbone（UVA, UWM, VideoVLA等）将视频和动作在同一个backbone中联合建模
- **关键问题**: UWM等做显式VAE latent预测，而Latent-space WM已证明隐式对齐更高效——提示Single-backbone方向可能需要"隐式化"

### Latent-space WM → World Model for RL
- WM for RL（DayDreamer, UniSim, DiWA等）用世界模型做想象rollout
- **关键问题**: Latent-space的隐表征能否直接作为RL的state space？VLA-JEPA的world states可能是理想候选

### Latent-space WM → Unified VLA
- Unified VLA（GR-2, DreamVLA, UniVLA等）将世界建模作为多模态backbone训练目标
- **关键问题**: Latent-space WM的技术（JEPA, condition space, intent bottleneck）能否直接融入Unified VLA的预训练目标？

---

*综述日期: 2026-05-07 | 作者: Lead*
