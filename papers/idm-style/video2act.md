# Video2Act — A Dual-System Video Diffusion Policy with Robotic Spatio-Motional Modeling

> **arXiv**: [2512.03044](https://arxiv.org/abs/2512.03044)
> **代码**: [GitHub](https://github.com/jiayueru/Video2Act)
> **项目页**: [https://video2act.github.io/](https://video2act.github.io/)
> **分类**: IDM-style Policies / Unified VLA 边界

---

## 核心问题

如何充分利用视频扩散模型（VDM）中固有的时空一致运动表征增强机器人策略，同时解决VDM推理高延迟导致的实时控制瓶颈？

## 核心方法

1. 通过反演从VDM提取clean latent features
2. 显式分解为**空间表征**（Sobel算子提取前景边界）和**运动表征**（FFT频域滤波提取时序动态）
3. 设计**异步双系统架构**: VDM作为低频System 2提供时空条件，DiT action head作为高频System 1实时生成动作

## 主要特点

- **首次显式利用VDM latent中的空间+运动信息**: Sobel+FFT非可学习滤波，轻量且有效
- **异步双系统**: System 2低频运行（1:8 ratio），System 1高频实时控制（~380Hz effective）
- **双分支输入**: 高分辨率短窗口（512×768, Ts=2）用于空间，低分辨率长窗口（256×256, Tl=16）用于运动
- **Q-Former压缩**: VDM tokens压缩为256个条件token

## 与现有方法对比

| 方法 | RoboTwin 1.0 | RoboTwin 2.0 | 真实世界 | 关键差异 |
|------|-------------|-------------|---------|---------|
| π0.5 | 48.1% | 42.8% | ~60% | 静态VLM |
| RDT-1B | 44.9% | 46.0% | 51.6% | 静态编码器 |
| VPP | 46.3% | 44.7% | ~65% | Raw VDM features |
| **Video2Act** | **54.6%** | **54.1%** | **73.3%** | **Spatio-motional分解** |

- **vs VPP**: VPP直接将raw VDM features注入policy；Video2Act显式提炼+异步架构，提升8-15%
- **vs π0/π0.5**: π0依赖静态图像编码器，无时序动态；Video2Act动态场景前景聚焦更稳定
- **vs RDT-1B**: RDT无视频级时序感知；Video2Act真实世界超过RDT 21.7%

## 关键洞察

**VDM latent features并非"越raw越好"** —— raw features被背景噪声淹没，Sobel+FFT显式分解后性能提升8.3%。

**表征的时间持久性** —— spatio-motional features可在多个控制步复用，使System 2低频运行仍保持稳定性。

## 技术细节

### System 2 (VDM)
- Hunyuan Video Diffusion, FP16, 21GB GPU, 144W
- 空间滤波: 3×3 Sobel核在32×48×3072 latent space
- 运动滤波: DFT+高通频域掩码

### System 1 (DiT Action Head)
- 1B参数，条件扩散目标，action chunk H=64
- 输入: SigLIP图像tokens + 文本指令 + F_VDM

### 消融结果
| 配置 | 成功率 | 相对提升 |
|------|--------|---------|
| w/o VDM feature | 46.3% | baseline |
| raw VDM feature | ~48% | +1.7% |
| +Sobel only | 50.3% | +4.0% |
| +FFT only | 51.3% | +5.0% |
| **+Sobel+FFT** | **54.6%** | **+8.3%** |

### 频率比消融
| Ratio | 成功率 | 说明 |
|-------|--------|------|
| 1:1 | ~54% | VDM每步更新，太慢 |
| **1:8** | **~54.6%** | **最优平衡点** |
| 1:16 | ~52% | 过度降低频率 |

## 局限性

- VDM推理瓶颈（21GB显存，冷启动587.9ms）
- 仅在桌面操作验证
- FFT/Sobel超参数固定
- 双系统增加工程复杂度

## 对研究的启示

- **长程任务**: 异步双系统适合长程——System 2低频全局感知，System 1高频局部执行
- **家庭场景**: 中等偏上，空间滤波对背景变化鲁棒
- **直接可试**: Sobel+FFT latent filtering最易快速验证（<2ms）

---

*笔记日期: 2026-05-12*
