# EnerVerse-AC

> **EnerVerse-AC: Envisioning Embodied Environments with Action Condition**  
> arXiv:2505.09723 | [Code](https://annaj2178.github.io/EnerverseAC.github.io/)

---

## 核心问题

如何构建一个真正的动作条件世界模拟器，让机器人能"在想象中测试"策略，而不需要物理机器人或复杂仿真？

## 核心方法

基于UNet的latent diffusion video generation模型：
- **多级动作条件注入**: end-effector投影动作图 + delta action注意力
- **Ray map编码**: 支持动态多视角（head camera + wrist camera）
- **失败轨迹增强**: 在AgiBot-World数据基础上增加失败轨迹

## 主要特点

- **Spatial-Aware Pose Injection**: 6D位姿投影到像素 + visual prompting（unit vectors表示方向，unit circle表示开合）→ CLIP编码 → 与RGB特征拼接
- **Delta Action Attention**: 编码连续帧间delta motion（速度、加速度），增强物理理解
- **动态多视角**: ray map编码相机运动，wrist camera的ray map隐含编码EEF运动
- **双角色**: 既是数据引擎（轨迹分段+空间增强生成新数据），又是评估器（policy视频评测）

## 关键实验发现

作为数据引擎：原始M条轨迹可增强为大量多样轨迹。作为评估器：消除物理机器人需求，降低开发和测试成本。

## 与现有方法对比

- **vs EnerVerse**: 增加Action Conditioning，从纯视频生成变为真正的世界模拟器
- **vs 物理仿真器**: 不需要3D资产，直接从数据学习视觉动力学
- **vs Interactive World Simulator**: diffusion-based vs consistency-based，各有优劣

## 局限性

- 依赖AgiBot-World等大规模机器人数据集
- 跨embodiment、跨场景的泛化需要更多验证
- 作为diffusion模型，长程时序一致性仍有挑战

## 对研究工作的启示

像素级动作条件注入和delta action attention的设计可以借鉴到VLA世界模型中。多视角+失败轨迹增强有助于提升家庭场景鲁棒性。

---

*笔记日期: 2026-06-02*
