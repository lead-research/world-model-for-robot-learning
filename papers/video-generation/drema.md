# DreMa

> **Dream to Manipulate: Compositional World Models Empowering Robot Imitation Learning with Imagination**  
> ICLR'25 | arXiv:2412.14957 | [Project](https://dreamtomanipulate.github.io/)

---

## 核心问题

如何让世界模型真正模拟机器人面前的物理环境，而非产生幻觉和不可行行为？

## 核心方法

将世界模型重新定义为**可学习的数字孪生**——结合Gaussian Splatting（高保真渲染）和物理仿真器（PyBullet），支持组合性操作和想象。

## 主要特点

- **组合性**: 世界模型是组合式的，可以重新排列物体生成新的有效场景配置
- **物体中心**: 基于foundation model（SAM/CLIP）自动提取物体中心表示
- **物理一致性**: 嵌入物理仿真器，而非纯统计学习，确保动力学真实
- **单样本学习**: 支持one-shot policy learning，单个演示即可学习新任务变体
- **等变数据增强**: 通过旋转/平移变换生成新的训练数据

## 关键实验发现

- **关键亮点**: 真实Franka Panda机器人，仅用一个演示即可学习新物理任务变体
- **数据效率**: 显著减少所需演示数量，提升泛化性
- **组合性验证**: 能想象并预测新物体配置下的任务结果

## 局限性

- PyBullet对复杂接触和可变形物体的模拟有限
- Gaussian Splatting重建质量依赖输入图像质量
- Foundation model提取精度直接影响物体中心表示质量
- 等变假设在某些任务中不成立

## 对研究工作的启示

可学习数字孪生概念值得深入探索。组合性+单样本学习是家庭场景的关键需求。但Gaussian Splatting+PyBullet的pipeline较复杂，需要评估实际可行性。

---

*笔记日期: 2026-06-02*
