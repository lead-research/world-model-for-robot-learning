# ManipDreamer

> ManipDreamer: Boosting Robotic Manipulation World Model with Action Tree and Visual Guidance
> Venue: arXiv'25.04

---

## 基本信息

- **Project**: https://myendless1.github.io/ManipDreamer/
- **分类**: World Models for Video Generation

## 核心问题

如何在机器人操作视频生成中同时解决指令遵循（instruction-following）和视觉质量（高保真、时空一致）两个挑战？

## 核心方法

(1) **Action Tree** — 将语言指令编码为动词-介词（verb-preposition）层次化动作树，捕获组合式任务结构，每个树节点赋予embedding，指令通过导航动作树获得完整embedding。(2) **Multi-modal Control Adapter** — 在UNet decoder中每3层通过交叉注意力注入深度图和语义图的分层视觉引导特征，增强时空一致性。

## 主要特点

- 动作树表示：将语言指令从RoboDreamer的独立原始分解提升为层次化树结构，捕获原始间的组合关系
- 多模态视觉引导：Depth + Semantic两种视觉引导通过分层适配器注入，兼容现有世界模型
- 显著提升：在unseen tasks上PSNR 19.55→21.05，SSIM 0.7474→0.7982，Flow Error 3.506→3.201
- 下游任务增益：RLbench 6任务平均成功率提升2.5%

## 技术细节

- 基础模型：基于RoboDreamer的UNet架构（推测）
- 动作树：动词-介词层次结构，每个节点学embedding，指令通过树导航聚合embedding
- 视觉适配器：分层控制适配器，每3层UNet decoder交叉注意力注入depth+semantic特征
- 训练数据：RT-1、Bridge（推测）

## 实验结果

- 视频质量：unseen tasks上PSNR↑7.7%，SSIM↑6.8%，Flow Error↓8.7%（对比RoboDreamer）
- 缺陷缓解：显著减少指令不对齐、幻觉、空间错误、重复物体、时序不连续、执行失败
- 下游操作：RLbench 6任务平均成功率提升2.5%

## 局限性

- 未公开arXiv全文，模型细节、训练配置、消融实验深度有限
- 仅对比RoboDreamer，未与更近期方法（Vid2World、Ctrl-World等）对比
- 视觉引导需要额外的depth/semantic预测模型，增加推理复杂度

## 对研究工作的启示

- **长程任务**: 动作树的层次结构天然适合长程任务分解（如"先打开抽屉再取出物品"），可作为规划模块的接口
- **泛化性/家庭场景**: 视觉引导（尤其depth）对3D空间推理至关重要，家庭场景中的深度估计可借助现有单目深度模型
- **直接可试**: 视觉引导适配器（分层交叉注意力注入）可直接加到现有扩散模型中，depth+semantic特征可通过DPT/SAM等现成模型获取
