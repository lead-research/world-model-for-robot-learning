# RoboMaster

> RoboMaster: Learning Video Generation for Robotic Manipulation with Collaborative Trajectory Control
> Venue: ICLR'26

---

## 基本信息

- **arXiv**: https://arxiv.org/abs/2506.01943
- **Code**: https://github.com/KlingAIResearch/RoboMaster
- **Project**: http://fuxiao0719.github.io/projects/robomaster
- **分类**: World Models for Video Generation

## 核心问题

如何同时控制机器臂轨迹和物体运动轨迹，生成支持多样化操作技能且可泛化到域外场景的长程机器人操作视频？

## 核心方法

基于CogVideoX-Fun-V1.5-5B预训练模型，后训练引入协同轨迹控制（Collaborative Trajectory Control）：用户定义物体mask + 机器人臂与物体在分解交互阶段（交互前、交互中、交互后）的协同轨迹。通过轨迹注入器将轨迹条件化到扩散模型中。

## 主要特点

- 协同轨迹分解：将机器人与物体的运动分解为交互前、交互中、交互后三个阶段，分别控制
- 用户定义控制：支持初始帧 + 语言提示 + 物体mask + 协同轨迹（手臂轨迹+物体轨迹）
- 域外泛化：可泛化到未见过的物体和场景（in-the-wild）
- 长程自回归：支持多步长视频生成

## 技术细节

- 基础模型：CogVideoX-Fun-V1.5-5B（Inpainting版本）
- 后训练：640×480分辨率，37帧，8 GPU
- 输入：初始图像 + 文本指令 + 物体mask + 协同轨迹（手臂+物体）
- 评估：VBench、FVD、FID、TrajError（通过CoTracker3估计轨迹）

## 实验结果

- 在Bridge数据集上验证，与ground truth对比FVD/FID/TrajError
- 域外物体多样化技能生成：支持pick up, place, push等多样化技能
- 长程视频生成：通过自回归方式生成多clip长视频

## 局限性

- 依赖用户提供的轨迹，需要人工或外部模块生成轨迹，自动化程度不足
- 仅验证单臂操作，多臂协作场景未涉及
- 后训练分辨率640×480，在更精细操作中可能不够

## 对研究工作的启示

- **长程任务**: 阶段分解式控制天然契合长程任务结构（接近→操作→撤离），可直接用于规划模块
- **泛化性/家庭场景**: 域外泛化能力对家庭场景很重要，但需验证在真实 cluttered 家庭桌面上的表现
- **直接可试**: CogVideoX-Fun后训练方案可直接复现，轨迹注入器模块可迁移到我们的pipeline
