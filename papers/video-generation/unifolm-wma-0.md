# UnifoLM-WMA-0

> UnifoLM-WMA-0: A World-Model-Action (WMA) Framework under UnifoLM Family
> Venue: Tech Release'25.09

---

## 基本信息

- **Code**: https://github.com/unitreerobotics/unifolm-world-model-action
- **Project**: https://unigen-x.github.io/unifolm-world-model-action.github.io/
- **HuggingFace**: https://huggingface.co/collections/unitreerobotics/unifolm-wma-0-68ca23027310c0ca0f34959c
- **分类**: World Models for Video Generation

## 核心问题

如何构建一个跨多类机器人本体（单臂、双臂、人形）的统一世界模型-动作（WMA）框架，同时支持仿真数据生成和策略决策增强？

## 核心方法

提出World-Model-embedded Policy架构，世界模型支持两种模式：(1) **决策模式**：预测未来物理交互信息，辅助策略生成动作；(2) **仿真模式**：基于机器人动作生成高保真环境反馈。基于视频生成模型微调，后训练分两步：先在Open-X数据集上微调视频生成模型，再在下游任务数据集上后训练。

## 主要特点

- 双模式运行：决策模式（Policy Enhancement）+ 仿真模式（Simulation Engine），一套架构两用
- 跨本体：支持Unitree Z1（单臂/双臂）、Unitree G1（人形带灵巧手）
- 开源完整：训练代码、推理代码、部署代码、模型权重、5个数据集全部开源
- 真实部署：已在Z1和G1真机上部署验证

## 技术细节

- 基础模型：DynamiCrafter（从代码依赖推断）
- 训练流程：Step 1: Open-X微调 → Step 2: 下游任务决策模式后训练 → Step 3: 下游任务仿真模式后训练（可跳过不需要的模式）
- 最大支持DoF：16
- 数据格式：HuggingFace LeRobot V2.1格式
- 5个开源数据集：Z1_StackBox、Z1_DualArm_StackBox、Z1_DualArm_Cleanup_Pencils、G1_Pack_Camera、G1_Dex1_DiverseManip（256×256和128×128）
- 部署：服务器-客户端架构，机器人客户端采集观测并发送到服务器查询动作

## 实验结果

- 微调Open-X后：可生成与文本指令对应的未来操作视频
- 动作可控生成：基于当前图像+未来机器人动作，实现交互可控生成
- 长程交互生成：支持长程任务的持续交互生成
- 真实部署：Z1和G1真机上完成stack box、cleanup pencils、pack camera等任务

## 局限性

- 分辨率较低（128×256），精细操作可能受限
- 无公开论文/技术报告，缺乏严格的消融实验和定量对比
- 仅基于Unitree自有机器人数据，泛化到非Unitree本体（如Franka、UR5）未验证
- 服务器-客户端架构的延迟和实时性未讨论

## 对研究工作的启示

- **长程任务**: 双模式架构（决策+仿真）是长程任务的自然选择——仿真模式可生成数据用于训练，决策模式可在线增强策略
- **泛化性/家庭场景**: 跨本体（Z1到G1）的设计对家庭场景多机器人协作有参考价值
- **直接可试**: 完整的开源训练-部署链（含DynamiCrafter基础+Unitree数据集）可直接复现，尤其适合实验室已有Unitree机器人的场景
