# Vid2World

> Vid2World: Crafting Video Diffusion Models to Interactive World Models
> Venue: ICLR'26

---

## 基本信息

- **arXiv**: https://arxiv.org/abs/2505.14357
- **Code**: https://github.com/thuml/Vid2World
- **Project**: https://knightnemo.github.io/vid2world/
- **分类**: World Models for Video Generation

## 核心问题

如何将预训练的全序列（非因果）视频扩散模型转换为自回归、交互式、动作条件的因果世界模型，从而利用互联网规模的预训练视频知识？

## 核心方法

两个核心转换：(1) **Video Diffusion Causalization** — 重新架构扩散backbone，在temporal attention层应用causal mask，并探索temporal convolution层的权重迁移机制（extrapolative/shift/masked三种）；在训练层面采用Diffusion Forcing策略，每帧独立采样噪声级别。(2) **Causal Action Guidance** — 将classifier-free guidance扩展到序列设置，每个动作用轻量MLP编码并在对应帧注入，训练时以固定概率独立drop动作，测试时通过guidance scale λ线性组合条件/无条件分数。

## 主要特点

- 从VDM到IWM的范式转换：利用互联网规模无动作视频预训练知识，仅需少量动作标注数据即可微调
- 三种权重迁移：Extrapolative（外推）、Shift（移位）、Masked（掩码）用于处理temporal convolution的因果化
- 无限长程因果展开：自回归生成不受原始训练序列长度限制
- 多域验证：机器人操作（RT-1）、3D游戏（CS:GO）、开放世界导航（RECON）

## 技术细节

- 基础模型：DynamiCrafter 512×320
- 训练数据：RT-1（操作）、CS:GO游戏数据集、RECON导航数据集
- 训练步数：RT-1 100k步，CS:GO/RECON 100k步；NAG（无动作引导）基线30k步
- 部署：多节点分布式训练（4 GPU/节点）
- 三种权重迁移变体：Extrapolative（推荐）、Shift、Masked

## 实验结果

- 机器人操作：RT-1数据集上生成视频与ground truth高度一致，支持Real2Sim策略评估（close_drawer任务），能区分不同训练阶段RT-1 checkpoint的成功/失败行为
- 游戏模拟：CS:GO上相比DIAMOND，显著减少error accumulation，并准确反映动作（如aim-down-sights）
- 反事实生成：同一初始状态+不同动作序列→完全不同结果，验证动作响应性
- 消融：Action Guidance（有/无）对比显著，NAG基线无法准确反映动作；不同权重迁移方法（Extrapolative最优）

## 局限性

- 分辨率512×320，在精细操作场景（如夹爪开合）中可能不够
- 游戏环境（CS:GO）的随机性导致部分失败，环境噪声非模型可控
- 动作编码为轻量MLP，复杂多模态动作（力/触觉）未涉及

## 对研究工作的启示

- **长程任务**: 自因果化+自回归展开是长程任务的核心基础设施，Extrapolative权重迁移值得直接尝试
- **泛化性/家庭场景**: 利用互联网视频预训练知识对泛化至关重要，家庭场景的复杂动态可受益于大规模预训练
- **直接可试**: 基于DynamiCrafter的Vid2World代码已开源，可直接在RT-1/Bridge上复现并适配到Piper/Pallas
