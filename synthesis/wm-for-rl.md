# Latent-space World Modeling 分类综述

> 分类: 🔬 Latent-space World Modeling
> 完成日期: 2026-05-07
> 论文数: 6
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

## 方法分类

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

## 共同发现 / 共识

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
| **层次化 vs 端到端** | VISTA: 宏观层次化 | DIAL: 微观结构化端到端 | 长程任务的最佳架构？ |
| **人类视频比例** | VLA-JEPA: 人类视频提升鲁棒性但可能引入噪声 | FLARE: 人类视频显著提升低数据场景 | 最优混合比例？ |
| **噪声鲁棒性** | π0在Noise扰动上领先JEPA类(-12.7%) | JEPA类在外观变化上大幅领先 | 如何兼得两者？ |

---

## 对后续分类的启示

### Latent-space WM → Single-backbone Policies
- Single-backbone（UVA, UWM, VideoVLA等）将视频和动作在同一个backbone中联合建模
- **关键问题**: UWM等做显式VAE latent预测，而Latent-space WM已证明隐式对齐更高效——这提示Single-backbone方向可能需要"隐式化"

### Latent-space WM → World Model for RL
- WM for RL（DayDreamer, UniSim, DiWA等）用世界模型做想象rollout
- **关键问题**: Latent-space的隐表征能否直接作为RL的state space？VLA-JEPA的world states可能是理想候选

### Latent-space WM → Unified VLA
- Unified VLA（GR-2, DreamVLA, UniVLA等）将世界建模作为多模态backbone训练目标
- **关键问题**: Latent-space WM的技术（JEPA, condition space, intent bottleneck）能否直接融入Unified VLA的预训练目标？

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

## 研究机会（ gaps ）

1. **层次化 + 结构化的组合**：VISTA的宏观层次化 + DIAL的微观结构化 = 完整长程方案，尚无论文实现
2. **JEPA-VLA + FLARE叠加**：JEPA-VLA做backbone + FLARE做future alignment，预期协同增益
3. **家庭场景验证**：6篇全部在实验室桌面/仿真验证，真实家庭场景（clutter, 动态, 开放词汇）是空白
4. **RL后训练**：全部仅imitation learning，未探索RL在latent space中的后训练
5. **多步未来预测**：FLARE/VLA-JEPA等仅单步/短horizon，长程需要层次化多步预测

---


---

# World Model for RL 分类综述

> 分类: 🎮 World Model for RL
> 完成日期: 2026-05-30
> 论文数: 16
> 状态: ✅ 已完成

---

## 一句话总结这个方向

**用数据驱动的world model替代真实环境/软件仿真器，在"想象"中进行RL策略优化。** 核心共识：world model + RL 是突破模仿学习数据瓶颈的终极路径，2025-2026年围绕VLA的爆发式涌现。

---

## 技术演化全景

```
2023: DayDreamer — 在线RSSM学习，真实机器人1小时学会行走（可行性验证）
   ↓
2024: UniSim — 多数据集编排，通用交互模拟器（大规模预训练）
   ↓
2025上: DiWA — 离线world model + RL微调diffusion policy（离线优化）
   ↓
2025下-2026上: VLA后训练爆发 — World-Env/VLA-RFT/WMPO/ProphRL/WoVR/World-Gymnast（VLA+RL）
   ↓
2026: 共进化与自主数据 — VLAW/World-VLA-Loop/WoVR/PlayWorld（动态改进+数据革命）
```

---

## 方法分类

### 按"World Model类型"

| 子类型 | 代表 | 预测什么 | 特点 |
|--------|------|---------|------|
| **隐空间 (RSSM)** | DayDreamer | Latent states | 高效，与VLA视觉不兼容 |
| **像素级 (Video)** | WMPO, World-Gymnast | Future RGB frames | 与VLA视觉预训练对齐，开销大 |
| **扩散模型** | World4RL | 扩散去噪视频 | 高保真，推理慢 |
| **组合式** | RISE | 动力学+值模型分离 | 各组件最优，系统复杂 |
| **动作→视频** | Prophet (ProphRL) | 动作条件视频 | 可复用，少样本适应 |
| **状态感知** | World-VLA-Loop | 帧+奖励联合预测 | 奖励耦合到生成器 |

### 按"RL算法"

| 算法 | 代表 | 特点 |
|------|------|------|
| **Actor-Critic** | DayDreamer | 标准RL，在线学习 |
| **Policy Gradient** | World4RL | 端到端策略优化 |
| **GRPO** | WMPO | On-policy，强性能 |
| **Flow-GRPO** | ProphRL | 适配flow-based VLA |
| **轨迹级奖励** | VLA-RFT | 验证奖励，高效 |
| **VLM奖励** | World-Env, World-Gymnast | 语义级，无需手工设计 |
| **共进化** | WoVR, World-VLA-Loop | 动态对齐，误差控制 |

---

## 共同发现 / 共识

1. **World Model RL > SFT**：World-Gymnast的18x提升、WoVR的+30点提升是强证据
2. **VLM奖励是2025-2026标配**：World-Env、World-Gymnast等用VLM提供奖励，避免手工工程
3. **共进化是刚需**：静态world model不足以支持RL，需要与policy交替改进（WoVR、World-VLA-Loop）
4. **数据瓶颈的突破**：PlayWorld证明自主play数据比演示数据更好；少量演示+world model RL超越大量SFT
5. **软件仿真器被超越**：World-Gymnast outperform Mujoco 2x，数据驱动world model取代人工建模仿真器

---

## 关键分歧 / 开放问题

| 分歧点 | 阵营A | 阵营B | 尚未解决 |
|--------|-------|-------|---------|
| **隐空间 vs 像素级** | DayDreamer/RSSM: 高效，不兼容VLA | WMPO/World-Gymnast: 与VLA对齐，开销大 | 混合架构？ |
| **冻结 vs 共进化** | World4RL: 冻结world model，简单 | WoVR/World-VLA-Loop: 共进化，复杂但更强 | 最佳更新频率？ |
| **VLM奖励 vs 内置奖励** | World-Env: VLM外置奖励 | World-VLA-Loop: world model内嵌奖励 | 可靠性vs速度？ |
| **on-policy vs off-policy** | WMPO: on-policy GRPO | VLA-RFT: 轨迹级（类off-policy） | VLA的最佳RL算法？ |
| **演示数据 vs 自主play** | 传统：人类演示 | PlayWorld: 自主play | 数据效率vs覆盖度？ |

---

## 对后续分类的启示

### World Model for RL → World Model for Evaluation
- 既然world model可以做RL训练环境，自然也可以做策略评估环境
- **关键问题**：WorldGym、WorldEval等评估工作如何与RL工作协同？

### World Model for RL → Video Generation
- 视频生成模型（Cosmos Predict等）本身就是world model的backbone
- **关键问题**：视频生成方向的25篇论文中，哪些是"被动生成"，哪些是"交互式world model"？

---

## 技术工具箱（可复用方法）

| 方法 | 来源 | 适用场景 |
|------|------|---------|
| RSSM在线学习 | DayDreamer | 快速验证world model可行性 |
| 多数据集编排 | UniSim | 构建通用模拟器 |
| 冻结World Model RL | World4RL | 简化系统，避免联合训练不稳定性 |
| VLM Reflector | World-Env | 自动生成奖励和终止信号 |
| 轨迹级验证奖励 | VLA-RFT | 高效、稳定的RL信号 |
| On-policy GRPO | WMPO | 强性能，与VLA对齐 |
| Flow-GRPO + FlowScale | ProphRL | Flow-based VLA的RL适配 |
| 可控Video World Model | WoVR | 减少幻觉，提高rollout稳定性 |
| Keyframe-Initialized Rollouts | WoVR | 长程误差控制 |
| 共进化机制 | WoVR/World-VLA-Loop | World model-policy动态对齐 |
| 状态感知World Model | World-VLA-Loop | 帧+奖励联合预测 |
| SANS数据集 | World-VLA-Loop | 利用近成功轨迹改善对齐 |
| 自主Play数据收集 | PlayWorld | 覆盖长尾失败案例 |
| 组合式World Model | RISE | 动力学+值分离，各组件最优 |

---

## 研究机会（gaps）

1. **层次化World Model**：长程任务（>20步）需要层级world model（高层关键帧+低层插值），尚无明确方案
2. **World Model的理论保证**：误差累积、收敛性、策略优化保证等缺乏理论分析
3. **实时推理**：扩散world model的推理速度是实时RL瓶颈，需要加速（如 consistency model、蒸馏）
4. **跨机器人迁移**：Prophet的少样本适应仅在有限平台验证，通用跨机器人world model是开放问题
5. **家庭场景闭环**：PlayWorld的自主play在真实家庭中的安全性和覆盖度需要验证

---

*综述日期: 2026-05-30 | 作者: Lead*
