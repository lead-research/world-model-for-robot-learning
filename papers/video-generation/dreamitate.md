# Dreamitate

> Dreamitate: Real-World Visuomotor Policy Learning via Video Generation
> Venue: CoRL'24

---

## 基本信息

- **arXiv**: https://arxiv.org/abs/2406.16862
- **Project**: https://dreamitate.cs.columbia.edu
- **分类**: World Models for Video Generation

## 核心问题

如何利用互联网规模预训练视频生成模型学习可泛化的视觉运动策略，同时解决人-机器人 embodiment gap？

## 核心方法

关键洞察：末端执行器是操作中最关键的embodiment部分，其余可通过逆运动学解决。策略生成人类使用工具的轨迹视频（而非机器人视频），通过3D跟踪工具轨迹转换为机器人动作。

流程：(1) 在人类演示视频上微调Stable Video Diffusion；(2) 在新场景生成人类使用工具的操作视频（双视角立体视频）；(3) 使用Megapose对已知CAD模型的工具进行6D姿态跟踪；(4) 将工具轨迹转化为机器人末端执行器SE(3)动作执行。

## 主要特点

- 绕过embodiment gap：生成人类使用工具的视频，通过工具桥接人-机器人差异
- 互联网规模先验：利用Stable Video Diffusion的大规模预训练
- 可扩展数据收集：无需遥操作，只需录制人类演示视频
- 可解释性：生成视频作为中间表示，优于黑箱端到端策略
- 双视角立体生成：双目视频用于3D一致性工具跟踪
- 任务无关性：工具-跟踪-执行pipeline是agent-independent的

## 技术细节

- 基础模型：Stable Video Diffusion (SVD)，仅微调spatial/temporal attention层
- 输入：双视角初始图像（45度夹角立体相机）
- 输出：双视角立体视频
- 训练数据：每个任务单独训练（Rotation: 371 demos/31 objects; Scooping: 368 demos; Sweeping: 356 demos; Push-Shape: 727 demos）
- 工具跟踪：Megapose在768×448分辨率上，基于已知CAD模型进行6D姿态估计
- 动作表示：工具相对相机的6D姿态（SE(3)）

## 实验结果

- Rotation：成功率92.5% vs Diffusion Policy 55%
- Scooping：成功率85% vs DP 55%
- Sweeping：成功率92.5% vs DP 12.5%
- Push-Shape：mIoU 0.731 vs DP 0.550，旋转误差8.0° vs DP 48.2°
- 数据缩放：减少训练数据，Dreamitate保持稳定的泛化性能，DP迅速下降

## 局限性

- 每个任务需要单独训练一个视频模型
- 依赖定制工具（3D打印+已知CAD模型）
- 仅验证开环执行，无在线反馈
- 需要精确相机标定和背景减除预处理
- 未报告推理速度/延迟

## 对研究工作的启示

- **长程任务**: 工具跟踪可扩展到长程任务——每个子任务使用不同工具，通过工具切换实现规划
- **泛化性/家庭场景**: 工具桥接策略对家庭场景实用——家庭工具天然可跟踪，人类视频先验丰富
- **直接可试**: Dreamitate的pipeline（SVD微调→双视角生成→Megapose跟踪→执行）可直接复现，适用于Piper/Pallas
