# 🔬 Latent-space World Modeling 综述

(将在完成该分类全部6篇论文后更新)

## 初步观察

从已读的 **FLARE** 来看，这一分类的核心范式是：

> **不在像素空间预测未来，而是在隐空间对齐未来表征**

这与 JEPA (Joint-Embedding Predictive Architecture) 的思想一脉相承：
- 避免解码器/重建的开销
- 在紧凑的表征空间做预测
- 表征需要是 **task-relevant / action-aware**

## 待比较维度

完成全部分类后，将从以下维度对比各方法：

| 维度 | 说明 |
|------|------|
| 表征空间 | 用什么 embedding？Vision-language / DINO / 自学习？ |
| 预测目标 | 单步 / 多步？固定 horizon / 自适应？ |
| 与策略的耦合度 | 独立 world model / 联合训练 / 完全统一？ |
| 可解释性 | 能否可视化预测的内容？ |
| 计算效率 | 训练开销 / 推理开销？ |
| 数据需求 | 是否需要动作标签？支持视频-only？ |

---

*预计完成日期: 2026-05-08 (按每天2篇)*
