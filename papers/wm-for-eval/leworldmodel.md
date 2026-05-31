# LeWorldModel

> Stable End-to-End Joint-Embedding Predictive Architecture from Pixels
> Venue: arXiv'26.03

---

## 基本信息

- **arXiv**: https://arxiv.org/abs/2603.19312
- **Code**: —
- **Project**: —
- **分类**: World Model for Evaluation / Latent-space WM

## 状态

⚠️ **已在 Latent-space WM 分类中完成分析** → [notes/2026-05-30-lewm.md](https://github.com/dli/world-model-research/blob/main/papers/latent-space-wm/leworldmodel.md)

## 简要概述

LeWorldModel是JEPA系列的端到端实现，从像素直接学习稳定联合嵌入预测架构。在Latent-space WM分类中已有完整分析。在Evaluation分类中，LeWorldModel主要作为稳定的视觉表示提供者，支持下游评估任务。

## 核心要点（复习）

- **端到端JEPA**: 从像素到隐空间表示到预测，完全端到端训练
- **稳定性**: 解决JEPA训练中的崩溃和不稳定问题
- **预测能力**: 在隐空间中进行未来预测，支持评估和规划
- **机器人应用**: 直接提升机器人控制任务的表示质量

## 在 Evaluation 分类中的定位

LeWorldModel在Evaluation分类中强调其作为评估基础设施的价值：
- 提供稳定的视觉表示用于策略评估
- 支持基于表示的策略比较和排名
- 为视频世界模型提供可靠的特征 backbone

---

> 详细笔记见 `papers/latent-space-wm/leworldmodel.md`
