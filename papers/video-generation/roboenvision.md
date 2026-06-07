# RoboEnvision

> RoboEnvision: A Long-Horizon Video Generation Model for Multi-Task Robot Manipulation
> Venue: IROS'25

---

## 基本信息

- **arXiv**: https://arxiv.org/abs/2506.22007
- **分类**: World Models for Video Generation

## 核心问题

现有视频扩散模型通过自回归生成长程视频导致误差累积，如何绕过自回归实现长程多任务机器人操作视频生成？

## 核心方法

提出**非自回归两阶段分层架构**：
1. **VLM任务分解** — 将高层指令（如"clean the table"）分解为原子任务
2. **Keyframe Diffusion** — 生成与每个原子指令对齐的关键帧，通过Keyframe-Instruction Cross-Attention显式对齐
3. **Filling Diffusion** — 在相邻关键帧之间插值生成中间帧
4. **Semantics Preserving Attention** — 将首帧VAE特征注入Keyframe Diffusion，保持物体一致性
5. **轻量级Policy Model** — 从生成视频回归机器人关节角度和夹爪状态

## 主要特点

- 完全绕过自回归：通过关键帧+插值实现长程生成，避免误差累积
- VLM驱动的任务分解：高层指令自动分解为可执行的原子任务序列
- 语义保持注意力：注入首帧VAE特征，解决大间隔关键帧间的物体消失/变形问题
- 轻量级策略模型：从生成视频直接回归动作，无需复杂的逆动力学模型
- 多任务长程：支持跨场景、跨任务的长程视频

## 技术细节

- 架构：两阶段扩散模型（Keyframe + Filling）+ VLM + Policy Model
- Keyframe Diffusion: 生成K个关键帧，每个对应一个原子任务
- Semantics Preserving Attention: 首帧VAE latent注入保持物体一致性
- Filling Diffusion: 关键帧间插值
- Policy Model: 轻量Transformer，输入视频帧，输出关节角度+夹爪状态
- 训练数据：基于MuJoCo的模拟环境

## 实验结果

- 视频质量：在两个benchmark上达到SOTA视频质量和一致性
- 长程任务成功率：在MuJoCo构建的长程任务数据集上优于先前方法
- 物体一致性：Semantics Preserving Attention显著减少物体消失和变形

## 局限性

- 无公开代码或项目页面，复现难度大
- 关键帧间隔需要手工设计，不同任务最优间隔可能不同
- 仅基于MuJoCo模拟环境验证，真实世界泛化未验证
- VLM任务分解错误会级联传播到视频生成
- Policy Model依赖生成视频质量

## 对研究工作的启示

- **长程任务**: 非自回归关键帧+插值是长程任务的有力替代方案，可避免自回归累积误差
- **泛化性/家庭场景**: VLM任务分解对家庭场景非常自然，但任务边界更模糊需更鲁棒分解
- **直接可试**: Semantics Preserving Attention可直接加到现有扩散模型；两阶段pipeline可用于数据增强
