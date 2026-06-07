# IRASim

> IRASim: A Fine-Grained World Model for Robot Manipulation
> Venue: ICCV'25

---

## 基本信息

- **Project**: https://gen-irasim.github.io/
- **Code**: https://github.com/bytedance/IRASim
- **分类**: World Models for Video Generation

## 核心问题

如何构建一个能捕捉精细机器人-物体交互的高保真世界模型，支持短程和长程轨迹预测？

## 核心方法

基于Diffusion Transformer，在每一transformer block中引入新颖的frame-level action-conditioning模块，显式建模并强化每个动作与对应帧的对齐。支持自回归方式展开长程视频。

## 主要特点

- 帧级动作条件：在transformer block内显式对齐动作与帧，而非仅在全局层面条件化
- 高保真交互模拟：可精确模拟机器人-物体接触、抓取、滑动等精细物理交互
- 自回归长程生成：短轨迹（16帧@4fps）和长轨迹（平均47帧RT-1/36帧Bridge/25帧Language-Table）均可保持时序一致性
- 灵活动作可控性：支持键盘、VR控制器等异构输入源收集的动作轨迹，模型能泛化到分布外的输入

## 技术细节

- 架构：Diffusion Transformer + 每block内frame-level action conditioning
- 训练数据：RT-1、Bridge、Language-Table标准数据集
- 推理：自回归rollout，支持多步长预测
- 评估指标：视觉质量（FVD/FID）、轨迹一致性、策略评估（Push-T上改进vanilla policy）

## 实验结果

- 短轨迹预测：16帧@4fps，与ground truth高度一致
- 长程预测：100个未挑选episode，RT-1平均47帧，仍保持视觉真实感和准确交互
- 策略评估：在Push-T上使用简单排序算法（K轨迹采样→IRASim模拟→reward模型选最优），提升vanilla diffusion policy性能；真实世界实验中可成功/失败模拟（如碗从夹爪滑落）

## 局限性

- 未公开arXiv全文，无法确认模型规模、训练细节、消融实验深度
- 仅验证单臂桌面操作，未涉及多臂、移动操作等复杂场景
- 动作空间局限于已有数据集，新机器人本体泛化未验证

## 对研究工作的启示

- **长程任务**: 自回归长程生成是验证长程规划可行性的基础设施，但当前平均47帧仍较短
- **泛化性/家庭场景**: 支持VR控制器等异构输入是家庭场景的关键，但 Household 场景未验证
- **直接可试**: frame-level action conditioning 思想可直接借鉴到现有 diffusion transformer 架构中
