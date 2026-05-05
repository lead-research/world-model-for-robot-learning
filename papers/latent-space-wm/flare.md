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

## 方法

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

## 关键洞察

| 洞察 | 说明 |
|------|------|
| 隐式 > 显式 | UWM(预测VAE latents) 400k steps ≈ 60.8%; FLARE 80k steps = 70.1% |
| Action-aware 是关键 | Generic SigLIP2 仅+7%; action-aware embedding +12% |
| 支持无动作标签 | 人类 egocentric 视频(无动作) + 1机器人演示 = 60% |
| 架构兼容 | 仅需加 tokens，不改 backbone |

---

## 实验结果

**RoboCasa (24任务)**:
- FLARE: **70.1%** vs Policy Only: 61.9% vs UWM: 60.8%

**GR1 人形仿真 (24任务)**:
- FLARE: **55.0%** vs Policy Only: 44.0%

**真实 GR1 (4任务)**:
- FLARE: **95.1%** (100轨迹/任务)
- 学会绕开障碍物而非撞倒

---

## 技术细节

| 组件 | 配置 |
|------|------|
| Backbone | DiT (8层), flow-matching |
| Denoising K | 4 |
| Future tokens | 32 |
| Alignment layer | 第6层 |
| λ (align weight) | 0.2 |
| EMA ρ | 0.995 |
| 预训练 | 256 H100, batch 8192, 150k steps |
| 后训练 | 32 H100, batch 1024, 80k steps |

---

## 与相关工作的关系

- **GR00T N1**: 基础 DiT+VLA 架构
- **UWM/UVA**: 显式预测VAE → FLARE 更轻更好
- **DINO-WM**: zero-shot planning vs FLARE 联合训练
- **REPA**: 文本到图像的对齐技术 → 迁移到机器人+未来对齐
- **JEPA**: 思想一致——隐空间预测，非像素

---

## 局限

1. 仅验证 pick-and-place，更复杂灵巧操作未测
2. 未与 RL 结合
3. 人类视频仍是受控 GoPro 环境
4. EMA 和 alignment layer 选择偏经验性

---

## 对 dli 工作的启示

✅ **直接可试**: 架构极轻，可快速在 Piper/Pallas 验证  
✅ **数据友好**: 100轨迹/任务达95% → 适合实验室  
✅ **可扩展**: 单步future → 多步/层次化 → 对接长程VLA  
⚠️ **疑问**: Pallas + 灵巧手的复杂动力学，action-aware embedding 是否足够？

---

*笔记日期: 2026-05-05 | 作者: Lead*
