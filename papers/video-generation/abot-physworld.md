# ABot-PhysWorld

> **ABot-PhysWorld: Interactive World Foundation Model for Robotic Manipulation with Physics Alignment**  
> arXiv:2603.23376 | [Code](https://github.com/amap-cvlab/ABot-PhysWorld.git)

---

## 核心问题

视频世界模型常产生物理不可行的预测（物体穿透、反重力运动），如何让生成的视频既视觉真实又物理合理？

## 核心方法

14B Diffusion Transformer模型：
- **数据**: 300万 manipulation clips 的物理感知标注数据集
- **训练**: DPO后训练框架 + 解耦判别器，抑制非物理行为同时保持视觉质量
- **控制**: 并行上下文块实现精确空间动作注入，支持跨embodiment控制

## 主要特点

- **物理对齐训练**: 首个专门用DPO+解耦判别器进行物理后训练的视频世界模型
- **解耦评估**: EZSbench——首个训练无关的embodied zero-shot benchmark，解耦评估物理真实性和动作对齐度
- **SOTA性能**: 在PBench和EZSbench上超越Veo 3.1和Sora v2 Pro

## 关键实验发现

在物理合理性上超越Veo 3.1和Sora v2 Pro。解耦评估协议分别评估物理真实性和动作对齐度，避免单一指标掩盖问题。

## 与现有方法对比

- **vs Veo/Sora**: 通用视频模型在物理一致性上表现差，ABot-PhysWorld专门优化
- **vs EnerVerse/EVAC**: 都关注动作条件生成，但更强调物理合理性而非速度
- **vs Interactive World Simulator**: 一个追求速度+一致性，一个追求物理准确性+规模

## 局限性

- 300万带物理标注的clips需要大量标注工作
- 14B模型需要显著计算资源
- DPO训练增加系统复杂度

## 对研究工作的启示

DPO+解耦判别器的物理后训练框架可以借鉴。物理合理性的提升直接改善家庭场景中的迁移能力。但14B规模对实验室资源挑战较大。

---

*笔记日期: 2026-06-02*
