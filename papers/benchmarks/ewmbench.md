# EWMBench

> EWMBench: Evaluating Scene, Motion, and Semantic Quality in Embodied World Models
> Venue: BMVC'25

---

## 基本信息

- **arXiv**: https://arxiv.org/abs/2505.09694
- **Code**: https://github.com/AgibotTech/EWMBench
- **分类**: Benchmarks for Evaluation World-Model

## 核心问题

如何超越通用感知指标，从场景一致性、运动正确性和语义对齐三个关键维度系统评估具身世界模型（EWM）？

## 核心方法

提出**EWMBench**框架，包含：(1) 精心构建的多样化场景和运动模式数据集；(2) 全面的多维度评估工具包，覆盖场景、运动、语义三个维度；(3) 候选模型评估和对比机制。

## 主要特点

- 三维度评估：场景一致性（视觉外观合理）、运动正确性（物理运动合理）、语义对齐（语言指令匹配）
- 专用数据集：精心构建的多样化场景和运动模式
- 多维度工具包：全面评估工具
- 公开可用：数据集和评估工具已开源

## 技术细节

- 评估维度：Visual Scene Consistency、Motion Correctness、Semantic Alignment
- 数据集：多样化场景和运动模式，覆盖多种物理AI任务
- 工具包：多维度评估工具

## 实验结果

- 识别了现有视频生成模型在具身任务中的独特需求局限性
- 提供了指导未来进展的valuable insights
- 具体模型对比数据需阅读论文全文确认

## 局限性

- 三个维度的评估指标是否自动计算？还是依赖人工/VLM？摘要中未明确
- 运动正确性的评估（物理合理性）需要ground truth物理模拟，评估成本可能很高
- 是否覆盖交互式/闭环评估？从摘要看似乎是开环评估

## 对研究工作的启示

- **长程任务**: 运动正确性对长程任务至关重要（物理错误会累积），可作为长程任务的质量监控指标
- **泛化性/家庭场景**: 语义对齐直接对应家庭场景中的语言指令遵循能力
- **直接可试**: 开源的EWMBench工具包可直接用于评估我们的视频生成模型
