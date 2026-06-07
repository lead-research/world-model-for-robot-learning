# DreamGen Bench

> DreamGen Bench: Unlocking Generalization in Robot Learning through Video World Models
> Venue: CoRL'25

---

## 基本信息

- **arXiv**: https://arxiv.org/abs/2505.12705（DreamGen论文）
- **Code**: https://github.com/NVIDIA/GR00T-Dreams
- **Project**: https://research.nvidia.com/labs/gear/dreamgen
- **分类**: Benchmarks for Evaluation World-Model

## 核心问题

如何量化视频生成模型适应特定机器人本体（embodiment）的能力，并建立基准分数与下游任务性能的关联？

## 核心方法

在DreamGen工作中提出专用评估基准，测量两个关键指标：(1) **指令遵循（Instruction Following）**：生成视频是否严格遵循给定指令；(2) **物理遵循（Physics Following）**：生成视频的物理合理性。评估4个视频世界模型（Cosmos、WAN 2.1、Hunyuan、CogVideoX）在4种设置（Robocasa、GR1 Object、GR1 Behavior、GR1 Environment）上的表现。

## 主要特点

- 本体适应性评估：不是通用视频质量，而是"模型能否适应特定机器人本体"
- 双指标：指令遵循 + 物理遵循
- 多模型对比：4个主流视频世界模型
- 多设置：4种机器人场景（模拟+真实）
- 与下游性能关联：观察到DreamGen Bench分数与下游任务分数的正相关

## 技术细节

- 评估模型：Cosmos、WAN 2.1、Hunyuan、CogVideoX
- 评估设置：Robocasa（模拟）、GR1 Object/Behavior/Environment（真实人形机器人）
- 评估方式：Zero-Shot和SFT（微调后）对比
- 下游验证：神经轨迹（50条/任务）训练策略，在真实机器人上执行

## 实验结果

- 4个模型Zero-Shot vs SFT对比：SFT显著提升指令遵循和物理遵循
- Cosmos SFT在部分设置上表现最佳，但各模型各有所长
- 正相关：Bench分数高的模型，下游策略成功率也高

## 局限性

- 评估基于视觉/VLM判断，可能引入VLM自身偏见
- 仅4个模型，未覆盖更近期的模型（如Cosmos Predict 2.5、GigaWorld-0）
- 评估指标相对主观（指令遵循），需要更客观的自动化指标

## 对研究工作的启示

- **长程任务**: 本体适应性评估是长程任务的基础——如果模型不理解机器人本体，长程展开会产生 physically impossible 的行为
- **泛化性/家庭场景**: 不同家庭机器人（清洁机器人、机械臂）需要各自的本体适应评估
- **直接可试**: DreamGen Bench的评估框架（Zero-Shot vs SFT，指令+物理双指标）可直接用于评估我们的Piper/Pallas世界模型
