# Vidarc — Embodied Video Diffusion Model for Closed-loop Control

> **Venue**: arXiv 2025.12 | [arXiv](https://arxiv.org/abs/2512.17661) | [Code](https://github.com/thu-ml/vidar) | [Project](https://embodiedfoundation.github.io/vidar_anypos)

---

## 核心问题

视频世界模型如何实现**低延迟、高精确的闭环机器人控制**？现有方法多为开环预测或高延迟推理，难以满足实时交互需求。

---

## 核心方法

### 两模块架构
1. **自回归视频扩散模型**: 基于CausVid因果训练，逐帧预测下一观测
2. **掩码逆动力学模型 (MIDM)**: 从观测中预测动作，同时学习动作相关掩码

### 三大技术创新

1. **闭环控制 via Re-prefill**:
   - chunk-by-chunk生成：生成n_c帧→解码动作→执行→获取真实观测→用真实观测替换生成帧重新预填充KV cache→继续生成
   - 消除自回归模型的训练-推理差距（teacher forcing vs. autoregressive rollout）
   - KV cache加速 + re-prefill减少计算量

2. **Embodiment-aware Loss**:
   - 核心洞察：视频扩散模型对所有像素一视同仁，但机器人控制只关心动作相关区域
   - 用MIDM学到的mask重新加权扩散损失: \(ℒ = ‖(1+η·U(x₁)) ⊙ (v_θ - (x₀-x₁))‖²\)
   - 强制视频模型更关注机械臂区域，生成更"可执行"的视频

3. **因果训练 (CausVid)**:
   - 将预训练T2V/I2V模型转为帧到帧因果生成
   - 当前帧生成时，先前帧已去noise-free，作为完美上下文

### 训练流程
- 预训练：1M clips (Egodex 230k, Agibot 728k, RDT 6k, RoboMind 17k)
- 初始化：Vidar（Wan2.2 backbone）下游微调权重
- Vidarc微调：4k steps因果训练
- MIDM单独训练：60k steps, 92M参数

---

## 主要特点

1. **闭环 vs 开环的根本差异**: Vidar等"生成完整视频→执行"，Vidarc"生成一小段→执行→反馈→再生成"
2. **延迟大幅降低**: KV cache + chunk re-prefill，延迟从34.3s→3.03s（91%降低）
3. **embodiment-aware损失的双向作用**: 既提升视频质量，又提升动作预测精度
4. **跨体预训练+平台微调**: 1M跨体数据预训练 → 特定平台4k steps微调即达SOTA

---

## 实验结果

**RoboTwin模拟（14任务）**:

| 方法 | 平均 | Handover Mic | Open Laptop | Place Cans Plasticbox |
|------|------|-------------|-------------|----------------------|
| Pi0.5 | 52.9% | 20.0% | 30.0% | 15.0% |
| Vidar | 71.1% | 0.0% | 50.0% | 0.0% |
| **Vidarc** | **80.7%** | **65.0%** | **55.0%** | **85.0%** |

**真实世界（3场景×5任务）**:

| 场景 | Vidarc | Vidar | Pi0.5 |
|------|--------|-------|-------|
| 已知 | 72% | 72% | 48% |
| 未知 | 56% | 44% | 28% |
| 动态 | **40%** | **0%** | 48% |

**速度**:
- 延迟: Vidarc 3.03s vs Vidar 34.3s vs Pi0.5 0.482s
- 端到端: Vidarc 24.2s vs Vidar 34.3s vs Pi0.5 5.76s

**消融**:
- w/o embodiment-aware: 74.6%（↓6.1%）
- w/o closed-loop: 66.8%（↓13.9%）

---

## 与现有方法对比

- **vs Vidar**: 直接基线改进。RoboTwin 80.7% vs 71.1%，真实世界56% vs 39%，延迟降低91%
- **vs Pi0.5 (VLA)**: 模拟大幅领先（80.7% vs 52.9%），动态场景Pi0.5略优（48% vs 40%）
- **vs LVP**: LVP重零样本泛化，Vidarc重复环精度。两者互补

---

## 关键洞察

1. **训练-推理差距是视频策略的主因之一**: 训练用teacher forcing，推理用生成观测→误差累积。Re-prefill用真实观测定期"刷新"上下文，根本解决
2. **"好视频"≠"好策略"**: 视觉上完美的视频，机械臂区域可能模糊。Embodiment-aware loss让模型知道"哪些区域对控制重要"

---

## 局限性

1. **延迟仍是瓶颈**: 3s延迟对实时控制仍然太高
2. **动态场景不如VLA**: 快速变化环境中视频漂移问题暴露
3. **chunk size权衡**: 越大延迟越高但上下文更完整
4. **re-prefill同步挑战**: 执行、观测、预填充的时序问题未充分讨论

---

## 对研究工作的启示

- **长程任务**: chunk-based闭环生成天然适合长程——每个chunk是子目标，re-prefill防误差累积
- **家庭场景**: 跨体预训练+平台微调模式适合家庭场景
- **可复用技术**: re-prefill机制、embodiment-aware loss加权思想、KV cache加速策略

---

## 开放问题

1. 延迟能否降到亚秒级？
2. re-prefill与真实机器人控制的同步细节？
3. 能否结合LVP的大规模预训练 + Vidarc的闭环机制？

---

## 关联论文

- **Vidar**: 直接基础和工作基线
- **CausVid**: 因果训练方法
- **LVP**: 同月arXiv，互补方向
