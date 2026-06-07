# EVA-Bench

> EVA-Bench: An Embodied World Model for Future Video Anticipation
> Venue: ICML'25

---

## 基本信息

- **arXiv**: https://arxiv.org/abs/2410.15461
- **Code**: https://github.com/litwellchi/EmbodiedVideoAnticipator
- **Project**: https://sites.google.com/view/eva-public
- **分类**: Benchmarks for Evaluation World-Model

## 核心问题

如何评估世界模型在具身场景中的多步预测和OOD泛化能力，超越单纯的视觉质量评估？

## 核心方法

(1) 提出**RoG (Reflection of Generation)**：一套中间推理策略，利用预训练VLM和视频生成模型的互补优势，增强视频预测中的推理能力。(2) 提出**EVA-Bench**基准：涵盖in-domain和OOD场景，评估多步预测能力。(3) 提出**EVA模型**：多阶段训练范式，生成高保真视频帧，采用自回归策略实现长程自适应泛化。

## 主要特点

- 推理增强：RoG利用VLM的推理能力弥补纯视频生成模型的理解不足
- 全面评估：EVA-Bench同时评估in-domain和OOD（Out-of-Distribution）场景
- 多任务：支持视频生成、机器人操作等下游任务
- 自适应泛化：通过自回归策略实现长程序列的自适应预测

## 技术细节

- EVA模型：多阶段训练（推测包括预训练→微调→自回归生成）
- RoG：中间推理策略，VLM与视频生成模型互补
- 评估：in-domain和OOD数据集，视频质量+下游任务性能

## 实验结果

- 在多个下游任务（视频生成、机器人操作）上验证EVA有效性
- 视频demo展示了多步预测的效果（项目页面链接）

## 局限性

- 论文为ICML'25，但具体定量结果（如FVD/PSNR数值）在arXiv摘要中未披露
- EVA模型与RoG的耦合关系不明确：是否RoG仅用于推理时还是训练时？
- OOD场景的定义和构造方式未详述

## 对研究工作的启示

- **长程任务**: 多步预测+OOD评估是长程任务的关键评估维度，可纳入我们自身的评估管线
- **泛化性/家庭场景**: OOD评估直接对应家庭场景的泛化需求（新物体、新布局）
- **直接可试**: EVA-Bench作为评估基准，可用于评估我们未来开发的世界模型
