# UVA — Unified Video Action Model [RSS'25]

> **arXiv**: [2503.00200](https://arxiv.org/abs/2503.00200)  
> **Code**: [GitHub](https://github.com/ShuangLI59/unified_video_action)  
> **Project**: [Website](https://unified-video-action-model.github.io/)  
> **Authors**: Shuang Li, Yihuai Gao, Dorsa Sadigh, Shuran Song (Stanford)

---

## 核心问题

如何统一视频生成与动作预测，既利用视频监督增强策略鲁棒性，又不牺牲动作推理速度？

---

## 核心方法

UVA 提出三大设计：
1. **Unified Latent Video-Action Representation** — 联合隐空间表示，同时编码视觉与动作信息
2. **Decoupled Video-Action Diffusion** — 解耦的视频/动作解码头，推理时可跳过视频生成
3. **Masked Training** — 通过掩码训练实现单模型的多功能（策略、视频生成、前向/逆向动力学）

### 架构流程

```
历史观测 → VAE编码器 (kl-f16) → N个视觉token
历史动作（高频采样）→ 重复M次匹配token数 → N个动作token
未来观测token（随机mask）+ 历史token → Transformer融合 → 联合隐表示 Z
Z → 两个轻量diffusion head分别解码视频和动作
```

### 训练目标

- `L = L_action + L_video`（每个时间步的扩散loss之和）
- `L_action`: 标准扩散噪声预测loss
- `L_video`: 逐token平均的噪声预测loss

---

## 关键创新

> **解耦diffusion head的设计哲学** —— 训练时"捆绑"（视频监督增强表示），推理时"解绑"（只取动作）。这是一种"用视频当正则化，但不付视频推理税"的聪明策略。

联合隐表示 Z 同时编码了"场景是什么样"和"如何与之交互"，这让模型在多任务场景中共享跨任务动力学知识。

---

## 实验结果

| Benchmark | UVA | 最佳Baseline | 提升 |
|-----------|-----|------------|------|
| PushT (单任务) | ~97% | DP-C ~97% | 持平 |
| **PushT-M (多任务)** | **78.2%** | DP-C 58.4% | **+20%** |
| **Libero10** | **82.9%** | π0 72.9% | **+10%** |
| ToolHang | ~持平 | DP-C | 持平 |

- UVA (0.5B参数，仅第三视角) 在Libero10上超越 π0 (3.3B) 和 π0-FAST (3.0B)
- 多任务场景是UVA的核心优势域
- 视觉扰动实验（背景变色/物体干扰）证明视频联合训练确实增强了视觉理解

---

## 与相关方法对比

| 维度 | UVA | Diffusion Policy | UniPi | π0 | OpenVLA |
|------|-----|------------------|-------|-----|---------|
| 视频生成 | 联合训练，可选推理 | 无 | 层级生成 | 无 | 无 |
| 推理速度 | 快（仅动作head） | 快 | 慢（需生成视频） | 快 | 慢 |
| 多任务 | **强** | 弱 | — | 中等 | 中等 |
| 参数量 | 0.5B | 262M | — | 3.3B | 7B |

---

## Masked Training 的5种任务模式

1. **Policy**: 历史观测+动作 → 未来动作
2. **Video Generation**: 历史观测+动作 → 未来视频
3. **Forward Dynamics**: 历史+当前动作 → 未来视频
4. **Inverse Dynamics**: 历史观测+未来视频 → 动作（可从无动作标签的视频数据学习）
5. **Policy+Planner**: 历史 → 未来动作+视频

---

## 局限性

1. 单任务不总是最优（UMI单任务输给DP-UMI）
2. Transformer Attention占50%推理时间（Flash Attention未实现）
3. 视频生成质量未系统量化评估
4. 所有任务为短程操作，长程horizon能力未知

---

## 对后续工作的启示

- **直接可试**: 在实验室Pallas/Piper上复现UVA推理流程；用inverse dynamics模式从视频数据生成伪动作标签
- **长程扩展**: UVA的masked training天然支持"规划+执行"联合模式，可尝试用于子目标分解
- **速度优化**: Flash Attention替换标准Attention可进一步提升推理速度

---

*笔记整理: 2026-05-08*  
*分类: Single-backbone Policies*
