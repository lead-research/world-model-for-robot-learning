# WorldSimBench

> WorldSimBench: Towards Video Generation Models as World Simulators
> Venue: ICML'25

---

## 基本信息

- **arXiv**: https://arxiv.org/abs/2410.18072
- **Project**: https://iranqin.github.io/WorldSimBench.github.io/
- **分类**: Benchmarks for Evaluation World-Model

## 核心问题

如何系统评估视频生成模型作为世界模拟器的能力，从纯视觉质量评估转向"是否真正有助于具身智能体决策"？

## 核心方法

提出**双重评估框架**：(1) **显式感知评估（Explicit Perceptual Evaluation）**：引入HF-Embodied Dataset，基于细粒度人类反馈的视频评估数据集，训练Human Preference Evaluator，显式评估世界模拟器的视觉保真度。(2) **隐式操作评估（Implicit Manipulative Evaluation）**：评估视频-动作一致性，即在动态环境中生成的情境感知视频是否能被准确翻译为正确的控制信号。

## 主要特点

- 双评估轴：视觉质量（人类感知）+ 操作一致性（动作级）
- 人类偏好数据集：HF-Embodied Dataset，细粒度人类反馈
- 三大场景：开放环境（Open-Ended）、自动驾驶、机器人操作
- 多模型评估：涵盖多个代表性视频生成模型

## 技术细节

- 显式评估：Human Preference Evaluator，基于HF-Embodied Dataset训练
- 隐式评估：视频-动作一致性评估，在动态环境中将生成视频转化为控制信号
- 场景：Open-Ended Embodied Environment、Autonomous Driving、Robot Manipulation

## 实验结果

- 综合评估揭示了视频生成模型在具身场景中的关键差距
- 提供insights驱动视频生成模型的进一步创新
- 具体定量对比数据需阅读论文全文确认

## 局限性

- 显式评估依赖人类反馈，标注成本高， scalability 有限
- 隐式评估中的"动作翻译"模块（将视频转控制信号）的具体实现未详述
- 是否覆盖长程任务评估？摘要中未明确

## 对研究工作的启示

- **长程任务**: 操作一致性评估是长程任务的关键，需要设计"将预测视频转化为策略动作并验证任务完成度"的评估管线
- **泛化性/家庭场景**: 人类偏好评估对家庭场景视频的真实性至关重要
- **直接可试**: HF-Embodied Dataset可用于训练我们自身的评估模型，或作为世界模型训练的目标函数
