# UWM — Unified World Models [RSS'25]

> **arXiv**: [2504.02792](https://arxiv.org/abs/2504.02792)  
> **Code**: [GitHub](https://github.com/WEIRDLabUW/unified-world-model)  
> **Project**: [Website](https://weirdlabuw.github.io/uwm/)  
> **Authors**: Chuning Zhu, Raymond Yu, Siyuan Feng, Benjamin Burchfiel, Paarth Shah, Abhishek Gupta (UW + TRI)

---

## 核心问题

如何统一模仿学习和世界建模，让策略能从视频数据（无动作标注）中学习动力学知识？

---

## 核心方法

**耦合的视频-动作扩散模型**，通过**独立的扩散timestep**控制每个模态：

1. **联合噪声预测网络** `s_θ(o, a_{t_a}, o'_{t_o'}, t_a, t_o')` —— 同时预测动作噪声和视频噪声
2. **独立timestep控制** —— `t_a`（动作扩散步）和 `t_o'`（视频扩散步）独立采样
3. **灵活推理** —— 通过设置timestep组合实现4种模式

### 关键洞察

> **扩散timestep = 掩码程度**：t=T ≈ 完全mask（marginalize），t=0 ≈ 无mask（condition on clean data）。这让UWM可以用同一模型做policy、dynamics、inverse dynamics、video generation。

---

## 训练目标

```
L(θ) = E[ w_a ||ε_a^θ - ε_a||² + w_o' ||ε_o'^θ - ε_o'||² ]
```

其中 `ε_a^θ, ε_o'^θ = s_θ(o, a_{t_a}, o'_{t_o'}, t_a, t_o')`

---

## 四种推理模式

| 模式 | t_a | t_o' | 功能 |
|------|-----|------|------|
| **Policy** | T→1 | T (固定) | p(a\|o) — 从纯噪声o'_T marginalize |
| **Video Gen** | T (固定) | T→1 | p(o'\|o) — 从纯噪声a_T marginalize |
| **Forward Dyn** | 0 (固定) | T→1 | p(o'\|o,a) — condition on clean action |
| **Inverse Dyn** | T→1 | 0 (固定) | p(a\|o,o') — condition on clean next obs |

---

## 与UVA的对比

| 维度 | UVA | UWM |
|------|-----|-----|
| 统一方式 | 联合隐表示 + 解耦head | 耦合扩散 + 独立timestep |
| 推理机制 | 跳过视频head | 固定timestep marginalize |
| 视频数据利用 | Inverse dynamics (mask action) | Action-free视频直接训练 |
| 架构 | VAE编码 + Transformer + 轻量head | 纯Diffusion Transformer |

**关键区别**：
- UVA通过**架构解耦**实现灵活推理（训练联合，推理分离）
- UWM通过**timestep操控**实现灵活推理（扩散噪声=掩码）

---

## 实验亮点

1. **大规模多任务预训练**：在大型机器人数据集上预训练，同时优化动力学和动作预测
2. **无动作视频数据利用**：通过独立控制timestep，从action-free视频数据学习，提升finetune后策略性能
3. **OOD泛化**：比纯模仿学习更robust

---

## 局限性

1. 耦合扩散训练稳定性待验证
2. 标准扩散采样步数多，速度可能不如UVA的轻量head

---

## 对研究工作的启示

- **直接可试**: UWM的action-free视频学习模式 —— 能否用实验室收集的视频数据（无动作标签）来提升策略？
- **长程任务**: 耦合扩散天然支持forward dynamics，可直接用于MPC规划

---

*笔记整理: 2026-05-08*  
*分类: Single-backbone Policies*
