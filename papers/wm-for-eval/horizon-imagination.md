# Horizon Imagination

> Horizon Imagination: Efficient On-Policy Rollout in Diffusion World Models
> Venue: ICLR'26

---

## 基本信息

- **arXiv**: https://arxiv.org/abs/2602.08032
- **Code**: https://github.com/leor-c/horizon-imagination
- **Project**: https://openreview.net/forum?id=Obefq4k8iG
- **分类**: World Model for Evaluation

## 核心问题

扩散世界模型在强化学习中面临严重的效率瓶颈：重量级模型推理成本高，或高度串行的想象过程限制了控制应用。

## 核心方法

Horizon Imagination (HI) 提出了一种高效的on-policy想象过程，用于离散随机策略：
- **并行去噪**: 同时去噪多个未来观测，而非串行逐步生成
- **稳定机制**: 引入专门的稳定机制防止并行去噪时的发散
- **采样调度创新**: 提出新的采样调度，将去噪预算与有效解耦，支持子帧预算（sub-frame budgets）
- **Pyramidal schedule改进**: 在Diffusion Forcing的Pyramidal schedule基础上改进，实现更高效的生成

## 主要特点

- **半帧预算可行**: 在半帧去噪步数（half denoising steps）下仍保持控制性能
- **灵活调度**: 支持多种采样调度，在生成质量和速度之间灵活权衡
- **离散策略专注**: 针对离散随机策略优化，与连续控制方法形成互补
- **Craftium验证**: 在Craftium环境上验证，证明实际游戏场景中的有效性

## 与现有方法对比

- **vs Diffusion Forcing**: HI改进了Pyramidal schedule，提出更高效的采样策略
- **vs 串行扩散生成**: 并行去噪显著降低时间开销，从O(T)到O(1)（每步）
- **vs 传统世界模型**: 扩散模型的生成质量更高，但HI解决了其效率问题

## 关键洞察

扩散世界模型的效率瓶颈可以通过巧妙的采样调度设计来缓解，关键是将"去噪预算"与"有效时间范围"解耦，允许在有限的计算预算下生成足够长的未来轨迹。

## 技术细节

- **模型**: 扩散世界模型（diffusion-based world model）
- **策略**: 离散随机策略
- **生成方式**: 并行去噪，支持子帧预算
- **环境**: Atari 100K, Craftium
- **训练**: 客户端-服务器架构，使用Docker部署

## 实验结果深度分析

- **Atari 100K**: 在半帧预算下保持控制性能
- **Craftium**: 在复杂游戏环境中实现 superior generation quality under varied schedules
- **效率提升**: 子帧预算（half denoising steps）下性能不衰减，显著降低推理成本
- **调度对比**: 新采样调度在多种配置下优于Pyramidal schedule

## 存在的不足/局限性

- **离散策略限制**: 目前仅针对离散随机策略优化，连续策略扩展性未知
- **环境限制**: 主要在Atari和Craftium验证，在物理机器人领域未测试
- **稳定机制开销**: 并行去噪的稳定机制可能带来额外计算开销
- **通用性**: 采样调度的最优配置可能因任务而异，需要调参

## 与已有知识的关联

- **连接到**: Diffusion Forcing（基线方法）、TD-MPC2（效率优化方向对比）
- **与RL分类关联**: World4RL等使用扩散世界模型进行策略训练，HI可为其提供效率优化
- **方法论**: 在扩散世界模型中，采样调度是一个关键但常被忽视的设计维度

## 开放问题/局限性

- 连续动作空间的扩展：并行去噪在连续控制中是否同样有效？
- 物理一致性：在机器人操作中，并行去噪是否会破坏物理约束的满足？
- 最优调度搜索：是否存在任务自适应的调度策略？

## 对研究工作的启示

- **长程任务**: 扩散世界模型的高计算成本是长程任务的主要瓶颈，HI的调度优化思路可借鉴
- **泛化性/家庭场景**: 家庭场景需要实时推理，HI的效率提升对实际部署有意义
- **直接可试**: 如果实验室使用扩散世界模型，采样调度优化应作为优先考虑的工程改进
