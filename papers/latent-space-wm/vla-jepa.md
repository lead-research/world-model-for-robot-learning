# 🔬 VLA-JEPA — Enhancing Vision-Language-Action Model with Latent World Model

**作者**: Wenyao Zhang, Zekun Qi, Shaojie Ren 等 (USTC, Zhongguancun Academy, SJTU, Tsinghua, Eastern Institute of Technology, UCAS, Nankai)  
**会议**: arXiv 2026.02  
**链接**: [arXiv](https://arxiv.org/abs/2602.10098) | [GitHub](https://github.com/ginwind/VLA-JEPA/) | [Project](https://ginwind.github.io/VLA-JEPA/) | [HuggingFace](https://huggingface.co/ginwind/VLA-JEPA/)

---

## 一句话总结

用 **JEPA (Joint-Embedding Predictive Architecture)** 替代像素级重建来做 VLA 预训练：学生网络只看当前帧，预测未来帧的隐表征，由冻结的目标编码器提供监督——从根本上消除信息泄漏，学到真正与动作相关的状态转移动力学。

---

## 核心问题

> 如何从互联网规模视频中预训练 VLA，避免当前 latent-action 方法锚定像素变化而非动作相关状态转移的问题？

作者指出四大失败模式：
1. **像素级目标偏向外观**：预测未来像素或压缩帧间变化 → 监督信号被纹理/光照/背景主导
2. **真实视频中的噪声运动**：相机运动和无关背景变化比交互引起的状态变化更强
3. **信息泄漏导致 latent action 崩溃**：未来帧作为输入 → latent action 编码未来本身而非转移动力学
4. **多阶段流水线复杂脆弱**：表征预训练 → latent-action 学习 → 策略学习，阶段间不一致

---

## 核心方法

### 核心设计: Leakage-Free State Prediction

**JEPA 原则**: 预测隐表征，而非像素。

```
Student pathway: 当前观测 → VLM backbone → latent action tokens
Target encoder:  未来帧 → V-JEPA2 (冻结, stop-gradient) → target world state
Predictor:        历史 world states + latent actions → 预测未来 world states
Loss:             MSE(预测的未来状态, 目标编码器的未来状态)
```

**关键**: 未来帧 **绝不** 输入 VLM backbone，仅用于构造训练目标 → 消除信息泄漏捷径。

### 三阶段架构

**Stage 1: World State Encoder**
- V-JEPA2 作为单视角视频状态表示编码器
- 多视角通过拼接融合: `s_t = concat_v(F(I_{v,t}))`
- **冻结，stop-gradient** — 作为目标编码器

**Stage 2: Latent Action Pretraining (JEPA World Modeling)**
- VLM (Qwen3-VL-2B + SigLIP-2) 接收初始观测 + 语言指令
- 输出 learnable latent action tokens `⟨latent_i⟩`
- 自回归 Transformer World Model (12层, time-causal attention)
- 预测未来 world states，与 V-JEPA2 目标对齐
- **人类视频**: 仅用 alignment loss (L_WM)
- **机器人数据**: joint optimization (L_FM + β·L_WM)

**Stage 3: Action Prediction**
- 在 latent action tokens 后添加 embodied action tokens `⟨action⟩`
- Flow-matching action head (DiT-B, 16层) 生成连续动作轨迹
- 条件: action tokens + latent actions + 初始观测 + 语言指令

### 训练目标

```
L = L_FM + β·L_WM

L_WM = Σ_k MSE(ŝ_{t_k}, s_{t_k})  # world model prediction
L_FM = E[||v_θ(a_t, t | z_a) - (a - ε)||²]  # flow matching
```

---

## 主要特点

1. **Leakage-Free 设计**: 未来信息绝不进入学生网络，从根源消除信息泄漏
2. **隐空间预测**: 在 V-JEPA2 隐空间做预测，天然鲁棒于相机运动和背景变化
3. **统一两阶段流水线**: JEPA 预训练 → action-head fine-tuning，无需多阶段复杂流程
4. **跨域联合训练**: 人类视频 (无动作标签) + 机器人数据 (有动作标签) 统一框架
5. **Time-Causal Attention**: 时序内双向注意力，跨时序因果注意力 → 建模时序动力学
6. **Multi-view 支持**: 多视角观测编码为统一 world state 表示

---

## 与现有方法对比

| 维度 | VLA-JEPA | LAPA | UniVLA | π0.5 | FLARE |
|------|----------|------|--------|------|-------|
| **世界建模方式** | JEPA (隐空间对齐) | Latent action from frames | Latent action + codebook | Flow-matching policy | 隐空间 future alignment |
| **未来信息使用** | **仅作目标，绝不输入** | 作为输入/监督 | 作为输入 | — | 仅作目标 |
| **信息泄漏风险** | **零** | 高 | 高 | — | 低 |
| **预训练数据** | 人类视频 + 机器人数据 | 人类视频 | 人类 + 机器人 | 仅机器人 | 机器人 + 人类视频 |
| **流水线复杂度** | **两阶段** | 三阶段+ | 三阶段+ | 两阶段 | 两阶段 |
| **像素重建** | **否** | 间接 (frame diff) | 间接 | 否 | 否 |
| **LIBERO Avg** | **97.2%** | 65.7% | 95.2% | 96.9% | — |

- **vs LAPA/UniVLA**: VLA-JEPA 从根本上解决信息泄漏和像素锚定问题，性能大幅领先 (+32% vs LAPA, +2% vs UniVLA)
- **vs π0.5**: 使用更少训练数据达到相近性能，且更具鲁棒性
- **vs FLARE**: VLA-JEPA 用完整的 JEPA 架构 (target encoder + predictor)，FLARE 是更轻量的 future token alignment；VLA-JEPA 更系统，FLARE 更轻量

---

## 实验结果深度分析

### LIBERO (4个任务套件, ID场景)

| 方法 | Spatial | Object | Goal | LIBERO-10 | Avg |
|------|---------|--------|------|-----------|-----|
| LAPA | 73.8 | 74.6 | 58.8 | 55.4 | 65.7 |
| UniVLA | 96.5 | 96.8 | 95.6 | 92.0 | 95.2 |
| π0.5 | **98.8** | 98.2 | **98.0** | 92.4 | 96.9 |
| **VLA-JEPA** | 96.2 | **99.6** | 97.2 | **95.8** | **97.2** |
| w/o human videos | 94.8 | **99.6** | 95.8 | 94.0 | 96.1 |

**关键发现**:
- VLA-JEPA 在 **Object** 和 **LIBERO-10** (长程/复合任务) 上显著领先 → 隐空间动力学学习对复杂任务更有利
- 去掉人类视频后仅降 1.1% → 机器人数据本身已很有效，人类视频主要提升鲁棒性

### SimplerEnv (Real-to-Sim OOD场景)

| 方法 | Google Robot Avg | WidowX Avg |
|------|-----------------|------------|
| villa-X | 44.9 | **40.8** |
| **VLA-JEPA** | **65.2** | **57.3** |
| w/o human videos | 78.4 | 57.3 |

- VLA-JEPA 在 Google Robot 上远超 villa-X (+20.3%)，展现强大的跨域泛化
- 有趣的是：w/o human videos 在 Google Robot 上反而更高 (78.4% vs 65.2%) → 人类视频在此场景可能引入噪声

### LIBERO-Plus (7维度扰动, 鲁棒性测试)

| 扰动维度 | VLA-JEPA | π0 | OpenVLA-OFT | 优势 |
|----------|----------|-----|-------------|------|
| Camera | **63.3%** | 13.8% | 56.4% | +6.9% |
| Robot | **67.1%** | 6.0% | 31.9% | +35.2% |
| Language | **85.4%** | 58.8% | 79.5% | +5.9% |
| Light | **95.6%** | 85.0% | 88.7% | +6.9% |
| Background | **93.6%** | 81.4% | 93.3% | +0.3% |
| Noise | 66.3% | **79.0%** | 75.8% | -12.7% |
| Layout | **85.1%** | 68.9% | 74.2% | +10.9% |
| **Avg** | **79.5%** | 53.6% | 69.6% | **+9.9%** |

**关键发现**:
- 在 **6/7 扰动维度** 上最优，尤其在 **Robot/Light/Layout** 上大幅领先
- 仅在 **Noise** 上落后 π0 (-12.7%) → 可能 JEPA 对传感器噪声敏感
- 人类视频预训练显著提升 Language/Light/Background/Layout 鲁棒性 → 外观变化鲁棒性

### 消融实验

**Q1: 人类视频的影响**
- LIBERO/SimplerEnv: 去掉人类视频性能不降反升 → 高质量机器人数据更关键
- LIBERO-Plus: 人类视频显著提升鲁棒性 (+16.6% avg) → 增强技能稳定性
- 人类视频比例增加 → 鲁棒性持续提升 (Figure 5)

**Q2: 统一预训练 vs 多阶段**
- Attention 可视化: LAPA 关注密集无关视觉信息；UniVLA 过度关注语义背景；VLA-JEPA 精准关注操作相关区域 (手臂、手、目标物体)

**Q3: 未来视频 horizon T**
- T=8 (接近 action horizon=7) → **最优** (96.1%)
- T=4 → 信息不足，长程任务差 (94.8%)
- T=16 → 冗余信息，精细操作差 (95.5%)

### 真实世界实验 (Franka Robot)

- **ID 任务**: VLA-JEPA 最优
- **OOD 布局**: VLA-JEPA 最优 (对杂乱场景鲁棒)
- **OOD 任务**: π0.5 更优 (指令跟随更精准)

**定性发现**:
- VLA-JEPA 学会 **重复抓取** (失败后重新打开夹爪尝试) — 来自人类视频知识
- π0.5 指令跟随更精准但经常违反安全边界
- VLA-JEPA 执行更稳定可靠，较少触碰安全约束
- 对新任务 (如放到架子上) 虽未完成，但会尝试从后侧接近并抬升 → 展现更好的泛化推理

---

## 存在的不足/局限性

1. **噪声敏感性**: 在 LIBERO-Plus 的 Noise 扰动上显著落后 π0 (-12.7%) → JEPA 对传感器噪声/输入扰动不够鲁棒
2. **指令跟随精度**: 真实世界中 VLA-JEPA 的指令理解不如 π0.5 精准，有时会抓取错误物体
3. **精细推理局限**: 缺乏对文本指令的细粒度推理能力
4. **未涉及 RL**: 仅 imitation learning，未探索强化学习后训练
5. **家庭场景验证有限**: 真实实验仅在实验室桌面环境，未在家庭场景测试
6. **计算开销**: V-JEPA2 目标编码器 + World Model + DiT action head，架构较复杂

---

## 与已有知识的关联

- **JEPA 谱系**: LeCun 的 JEPA (I-JEPA, V-JEPA, V-JEPA2) → 首次系统应用于 VLA 预训练
- **vs FLARE**: 
  - FLARE: 轻量 future token alignment，零推理开销
  - VLA-JEPA: 完整 JEPA 架构 (target encoder + predictor + world model)
  - 两者都避免了像素重建，但 VLA-JEPA 更系统地解决信息泄漏
- **vs LAPA/UniVLA**: 从根本上重构 latent-action 的学习方式，非修补方案

---

## 对研究工作的启示

### 长程任务
- ✅ **时序动力学建模**: Time-causal attention + 自回归 world model 天然适合长程任务
- ✅ **复合任务优势**: LIBERO-10 (长程复合任务) 上 95.8% → 隐空间预测对多步规划有利
- ⚠️ **Horizon 匹配**: T=8 最优 (接近 action horizon) → 需要 careful tuning 长程 horizon

### 泛化性/家庭场景
- ✅ **外观变化鲁棒性**: LIBERO-Plus Light/Background 上 95.6%/93.6% → 对家庭不同光照/背景有强鲁棒性
- ✅ **布局变化鲁棒性**: LIBERO-Plus Layout 85.1% → 对家庭不同家具布局有潜力
- ✅ **人类视频利用**: 可从互联网家庭视频学习鲁棒技能 (无需动作标签)
- ⚠️ **未验证**: 真实家庭环境、不同家庭物品、动态人为干扰
- ⚠️ **噪声敏感**: 家庭传感器噪声可能影响性能

### 直接可试
1. **V-JEPA2 迁移**: 可直接复用预训练的 V-JEPA2 编码器作为 world state encoder
2. **Time-causal attention**: 架构模式可借鉴用于时序动作预测
3. **人类视频 + 机器人数据联合训练**: 数据策略可直接采用
4. **Multi-view 融合**: concat 多视角 world state 的方式可借鉴

---

*笔记日期: 2026-05-05 | 作者: Lead*
