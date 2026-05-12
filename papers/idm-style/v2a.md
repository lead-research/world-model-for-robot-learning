# V2A — Grounding Video Models to Actions through Goal Conditioned Exploration

> **会议**: ICLR 2025 (Spotlight)
> **arXiv**: [2411.07223](https://arxiv.org/abs/2411.07223)
> **项目页**: [https://video-to-action.github.io/](https://video-to-action.github.io/)
> **分类**: IDM-style Policies（探索增强型）

---

## 核心问题

视频模型提供了丰富的物理动态先验，但如何将其ground到具体机器人的连续动作，且**不需要任何动作标注**？

## 核心方法

提出**目标条件探索框架**：
1. 用预训练视频模型生成视频帧作为视觉目标
2. 通过goal-conditioned policy在环境中自探索
3. 执行后 hindsight relabeling 收集数据训练策略

**无需动作标注、无需奖励、无需分割掩码**。

## 主要特点

- **完全无监督grounding**: 不依赖任何动作标注或专家演示，纯通过环境自探索学习
- **目标条件策略**: 策略输入为（当前观测，目标图像），输出动作序列到达目标
- **Chunk-level动作预测**: 预测h步动作块而非单步动作，保证探索的时序一致性
- **周期性随机动作引导**: 初始和训练中周期性插入随机探索，防止策略陷入局部循环
- **Hindsight relabeling**: 执行轨迹中未达到的视频目标，用实际到达状态重新标记为新的训练样本

## 与现有方法对比

| 方法 | 需要动作标注 | Libero平均 | 核心机制 |
|------|------------|-----------|---------|
| BC | ✅ | 19% | 纯模仿学习 |
| DP BC | ✅ | 46% | 扩散策略 |
| SuSIE | ✅ | 30% | 视频条件 |
| AVDC | ❌ | ~0% | 光流+深度 |
| **V2A** | ❌ | **42-62%** | **视频引导探索** |

- **vs AVDC**: AVDC用光流+深度计算刚体变换，Libero上接近0%；V2A通过探索学习，远超AVDC
- **vs BC/DP BC**: BC需要动作标注，V2A不需要；性能接近或超越BC
- **vs SuSIE**: SuSIE需要动作标注，V2A完全不需要

## 关键洞察

**"视频模型可以作为无监督探索的导师"** —— 传统无监督探索在高位空间中效率极低；V2A用视频模型生成的帧作为"有意义的探索目标"，将探索范围收缩到任务相关状态空间。

**Chunk-level动作预测对无监督探索的决定性作用** —— 单步动作预测导致探索不连贯、agent容易stuck；动作块预测产生连贯轨迹。

## 技术细节

### 算法流程
```
1. 视频模型 f_θ 根据初始观测和任务描述生成视频帧序列
2. Goal-conditioned policy π(a|x_start, x_goal) 尝试到达每个生成帧
3. 执行轨迹存入replay buffer
4. Hindsight relabeling: 用实际到达状态替换未达成的目标
5. 周期性执行随机动作探索
6. 从buffer采样训练policy（MSE loss）
```

### Policy架构
CNN-based Diffusion Policy，输入当前图像+目标图像，输出h步动作块

### 探索策略
- 初始n_r条随机探索轨迹预热
- 每q_v步执行视频引导探索
- 每q_r步执行额外随机探索

## 实验结果

### Libero (8 tasks)
| 方法 | Overall |
|------|---------|
| BC | 19.4% |
| DP BC | 46.0% |
| SuSIE | 29.8% |
| AVDC | 0.0% |
| **V2A** | **42.2%** |
| V2A + SuSIE | 54.8% |

### 消融
- Chunk-level vs single action: chunk-level在所有环境上都显著优于单步
- Random bootstrapping: 去除后探索效率大幅下降
- Hindsight relabeling: 数据效率的关键

## 局限性

- 每个环境需单独训练视频模型（未使用大规模预训练模型）
- 仅在仿真环境验证，未在真实机器人上测试
- 视频模型质量依赖
- 复杂长程任务上成功率仍有限

## 对研究的启示

- **长程任务**: 视频引导的探索天然适合长程——视频帧序列天然提供子目标分解
- **家庭场景**: 中等适用性，视频引导比纯随机探索安全得多
- **直接可试**: 若已有仿真环境，可快速验证V2A框架

---

*笔记日期: 2026-05-12*
