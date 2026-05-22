# TriVLA: A Triple-System-Based Unified Vision-Language-Action Model with Episodic World Modeling for General Robot Control

> arXiv 2507.01424 | Fudan University, Shanghai Innovation Institute | 2025
> 分类: **Unified VLA**
> 核心问题: 现有VLA依赖静态表征和有限时序上下文，如何引入类人类情景记忆（episodic memory）的机制，让机器人积累、回忆和预测序列经验，实现长程动态环境中的鲁棒泛化？

## 核心方法

TriVLA 提出一个受**认知神经科学情景记忆理论**启发的**情景世界模型（Episodic World Model）**，通过**三系统架构**实现：

### 三系统架构

1. **System 1 — Policy Learning（策略学习）**:
   - 负责最终动作生成
   - 使用 **flow matching** + **cross-modal attention** 整合 System 2 和 3 的输出
   - 采用 embodiment-specific encoder/decoder 处理不同机器人的状态/动作维度
   - **Action chunking**: 预测一段动作序列而非单步动作
   - 隐含地诱导了 **inverse-dynamics prior**：通过持续监测运动序列，让策略从世界模型中继承泛化能力

2. **System 2 — Episodic Multimodal Perception（情景多模态感知）**:
   - 基于**预训练VLM**，处理图像和语言指令
   - 负责多模态 grounding：理解任务目标、场景上下文、物体关系
   - 提供高层语义推理和指令对齐

3. **System 3 — Episodic Dynamics Perception（情景动力学感知）**:
   - 基于**视频扩散模型（Video Diffusion Model, VDM）**，在大规模人类+机器人操作数据上微调
   - 编码过去状态序列，**预测未来场景轨迹**
   - 实现情景上下文的积累和时序动态建模
   - Systems 2+3 联合构成**情景世界模型**

### 关键训练与推理流程

- **训练时**: System 1 通过 cross-attention 融合 System 2 的语义 token 和 System 3 的动态 token
- **推理时**: 三系统协同——VLM 理解当前场景和指令，VDM 预测未来演化，Policy 结合两者生成动作 chunk
- 控制频率：**36 Hz** — 在 VDM 参与的情况下仍保持实时性，这是工程上的重要成就

## 与现有方法对比

| 维度 | TriVLA | 传统 Dual-System VLA (GR00T, Hi Robot) | 纯VLM VLA (OpenVLA, RT-2) |
|------|--------|--------------------------------------|---------------------------|
| 时序建模 | ✅ 视频扩散模型编码完整序列动态 | ⚠️ 单帧或短序列 | ❌ 单帧/短上下文 |
| 语义理解 | ✅ 预训练VLM强语义 | ✅ 有 | ✅ 有 |
| 未来预测 | ✅ 显式多帧未来预测 | ❌ 无显式预测 | ❌ 无 |
| 长程任务 | ✅ 情景记忆支持长程规划 | ⚠️ 有限 | ❌ 反应式 |
| 推理速度 | ✅ 36 Hz（含VDM） | ✅ 较快 | ✅ 快 |
| 认知灵感 | ✅ 情景记忆（Tulving理论） | ⚠️ Kahneman双系统 | ❌ 无 |

- **vs π0/π0.5**: π0 系列用 flow matching 做连续动作，π0.5 增加了高层子任务预测；TriVLA 的 VDM 提供了比子任务更丰富的动态信息——像素级别的未来预测 vs 符号级别的子任务分解
- **vs VPP/Genie Envisioner**: 这些纯视频预测方法缺乏语义 grounding；TriVLA 的 System 2 VLM 提供了语义锚点
- **vs GR-1/GR-2**: GR 系列用未来图像预测做辅助任务；TriVLA 将 VDM 作为一等公民参与 cross-attention 融合，而非仅作辅助损失
- **vs RynnVLA-002**: RynnVLA-002 用统一自回归模型同时处理动作和图像生成；TriVLA 用三系统分离架构，保持各系统的自然工作流（VDM 扩散 vs VLM 自回归 vs Policy flow matching）

## 关键洞察

**认知科学到机器人学的有效迁移**：Tulving 的情景记忆理论（"mental time travel"——回溯过去、模拟未来）被形式化为机器人的 episodic world model。这不是隐喻式类比，而是提供了具体架构设计原则——分离的多模态感知（System 2）+ 时序动态感知（System 3）+ 策略整合（System 1）。

## 技术细节

- **System 2 VLM**: 未明确指定具体模型，推测为类似 LLaVA/InternVL 的多模态大模型
- **System 3 VDM**: 在大规模人类和机器人操作视频上微调的视频扩散模型（参考 SVD/CogVideo 等架构）
- **System 1 Policy**: Flow matching + cross-modal attention + embodiment-specific 编解码器
- **数据**: Open X-Embodiment 风格的大规模异构机器人数据 + 人类操作视频
- **动作表示**: 连续动作（flow matching），chunk-level 预测

## 实验结果深度分析

### 模拟 Benchmark
| Benchmark | TriVLA 提升 | 说明 |
|-----------|------------|------|
| **Calvin ABC→D** | +0.21 vs SOTA | 长程任务，从A→B→C→D连续完成4个子任务 |
| **LIBERO** | +0.11 vs SOTA | 标准 VLA 模拟基准 |
| **MetaWorld** | +0.13 vs SOTA | 多任务操纵基准 |

- Calvin ABC→D 的 +0.21 特别值得关注——这是最考验长程规划和错误恢复能力的基准之一
- LIBERO 和 MetaWorld 的提升幅度相对温和，但在已有强基线上进一步提升具有统计意义

### 真实世界实验
- **灵巧手操作**：在 dexterous hand manipulation 的长程场景中表现突出
- 项目页和视频中展示了复杂的长程操作

### 消融与特性
- 未给出详细消融表（内容受限），但 36 Hz 的控制频率说明 VDM 推理经过了工程优化（可能用蒸馏、步骤缩减或 latent 空间预测）
- 支持训练组合之外的新技能组合（novel skill compositions）——这是情景记忆泛化能力的重要证据

## 存在的不足/局限性

1. **System 3 的视频扩散计算开销**：虽然报告了 36 Hz，但 VDM 每步去噪仍需要多步迭代。如何保持实时性？可能采用了 few-step diffusion 或模型蒸馏，但论文未详细说明优化手段
2. **三系统之间的信息融合深度有限**：cross-attention 融合可能不如统一架构（如 RynnVLA-002）的深度融合；System 2 和 3 的输出可能被视为"条件"而非真正联合推理
3. **视频扩散模型的预测质量未量化**：未来帧预测的视觉质量（FID/PSNR）与下游任务成功率的相关性未分析；如果 VDM 预测错误，Policy 能否鲁棒处理？
4. **数据依赖**：VDM 需要大规模人类+机器人视频微调，数据获取门槛高

## 与已有知识的关联

- **情景记忆理论（Tulving, 1972; 2002）**：直接引用并形式化为 episodic world model，这在机器人学中是新颖的理论连接
- **Kahneman 双系统理论**：明确将 TriVLA 的 System 1/2 类比为快思考/慢思考，但创新性地增加了 System 3（时序动态）
- **视频扩散模型（VDM）**：继承自 SVD、CogVideoX、Wan 等视频生成进展，首次系统性地用于机器人三系统架构
- **Flow Matching in Robotics**：与 π0、π0.5 等同期方法共享流匹配动作生成范式
- **与 HALO/InternVLA-A1 的对比**：TriVLA 用三系统分离，HALO/InternVLA-A1 用 Mixture-of-Transformers 统一参数；两种路线代表了"分离以保持专业性" vs "统一以实现深度交互"的权衡

## 开放问题

1. **情景记忆的"遗忘"机制**：人类情景记忆有选择性遗忘以对抗干扰；TriVLA 是否需要类似机制？随着交互历史增长，cross-attention 的计算复杂度如何控制？
2. **VDM 预测错误的鲁棒性**：当视频扩散模型预测的未来与真实演化偏离（如物体滑动、碰撞未预期），System 1 的策略是否会"盲目跟随"错误预测？是否需要预测不确定性建模？
3. **跨 embodiment 迁移**：三系统架构中 System 1 有 embodiment-specific 组件，但 System 2+3 是通用的。这种设计是否支持快速适配新机器人形态？
4. **开放世界泛化**：在完全未见的家庭场景（新房间、新家具布局）中，预训练 VLM 和 VDM 的分布外泛化能力如何？

## 对研究工作的启示

### 长程任务
- **情景世界模型是长程任务的天然架构**：System 3 预测未来场景的能力等同于提供中间子目标，System 1 据此规划多步动作。ABC→D 的强结果表明这一设计在长程任务上具有显著优势
- **建议直接尝试**：在我们的实验室中，可将 TriVLA 架构适配到 Piper/Pallas 的长程任务（如"整理桌面"→"抓取杯子→放置到托盘→移动到目标位置"）
- 36 Hz 实时性证明 VDM 参与控制是可行的，不必担心计算瓶颈

### 泛化性/家庭场景
- **情景记忆的"积累-回忆-预测"循环非常契合家庭场景**：家庭环境变化缓慢但非结构化，机器人需要记住物体位置变化、人类活动模式等时序信息
- **System 2 的 VLM grounding 能力**可用于理解开放式指令（"把这里收拾一下"），而 System 3 的 VDM 预测可帮助处理动态环境（如有人走过时暂停操作）
- **局限**：当前视频扩散模型对未见物体的生成质量有限；家庭场景中的长尾物体可能是瓶颈

### 直接可试
- **Flow Matching + Action Chunking** 是π0系列验证过的有效方案，可直接用于我们当前的动作生成模块
- **Cross-modal Attention 融合** 策略：将视觉特征（VLM输出）和动态特征（视频预测embedding）通过 cross-attention 注入 policy，可作为我们现有框架的升级
- **三系统分离设计**的工程意义：各系统可独立迭代升级（如换更强的VLM、更轻量的VDM），降低整体维护成本

---
*分析日期: 2026-05-22 | 内容来源: arXiv HTML (15000 chars), 实验细节和消融数据部分受限*
