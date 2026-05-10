# 🤖 World Model Research Notes

> 系统学习 [Awesome World Models for Robotics Policy](https://github.com/NTUMARS/Awesome-World-Model-for-Robotics-Policy) 论文列表（**114篇**），建立世界模型 + 具身智能深度知识库。
>
> 维护者: Lead (AI Research Assistant) for dli
> 
> 🌐 **在线阅读**: https://github.com/lead-research/world-model-for-robot-learning

---

## 📊 学习进度

| 分类 | 进度 | 状态 |
|------|------|------|
| 🔬 Latent-space World Modeling | **6 / 6** | ✅ **已完成** |
| 🏗️ Single-backbone Policies | **8 / 8** | ✅ **已完成** |
| 🎯 IDM-style Policies | **0 / 12** | 🔄 **当前进行** |
| 🧩 MoE/MoT-style | 0 / 9 | ⚪ 待启动 |
| 🔗 Unified VLA | 0 / 12 | ⚪ 待启动 |
| 🎮 World Model for RL | 0 / 16 | ⚪ 待启动 |
| 📏 World Model for Evaluation | 0 / 10 | ⚪ 待启动 |
| 🎬 Video Generation | 0 / 25 | ⚪ 待启动 |
| 📋 Benchmarks | 0 / 8 | ⚪ 待启动 |
| 🗂️ Datasets | 0 / 8 | ⚪ 待启动 |

**总体: 14 / 114 完成 (12.3%)**

---

## 🗓️ 学习路线图

```
Phase 1: Latent-space WM (6篇)     ──────── ✅ 已完成 (2026-05-05 ~ 2026-05-07)
Phase 2: Single-backbone (8篇)     ──────── ✅ 已完成 (8/8, 2026-05-09)
Phase 3: IDM-style (12篇)          ──────── ⚪ 待启动 (~3天)
Phase 4: MoE/MoT-style (9篇)       ──────── ⚪ 待启动 (~3天)
Phase 5: Unified VLA (12篇)        ──────── ⚪ 待启动 (~3天)
Phase 6: WM for RL (16篇)          ──────── ⚪ 待启动 (~4天)
Phase 7: WM for Evaluation (10篇)  ──────── ⚪ 待启动 (~3天)
Phase 8: Video Generation (25篇)   ──────── ⚪ 待启动 (~7天)
Phase 9: Benchmarks (8篇)           ──────── ⚪ 待启动 (~2天)
Phase 10: Datasets (8篇)            ──────── ⚪ 待启动 (~2天)

预计总时长: ~33天 (约5周, 每日4篇)
```

---

## 📚 最新笔记

| 日期 | 论文 | 分类 | 链接 |
|------|------|------|------|
| 2026-05-10 | **VPP** — Video Prediction Policy (ICML'25 Spotlight) | IDM-style | [笔记](papers/idm-style/vpp.md) |
| 2026-05-10 | **VidMan** — Exploiting Implicit Dynamics from Video Diffusion (NeurIPS'24) | IDM-style | [笔记](papers/idm-style/vidman.md) |
| 2026-05-10 | **GR-1** — Large-Scale Video Generative Pre-training (ICLR'24) | IDM-style | [笔记](papers/idm-style/gr-1.md) |
| 2026-05-10 | **UniPi** — Learning Universal Policies via Text-Guided Video Generation (NeurIPS'23) | IDM-style | [笔记](papers/idm-style/unipi.md) |
| 2026-05-09 | **GigaWorld-Policy** — Efficient Action-Centered WAM (arXiv'26.03) | Single-backbone | [笔记](papers/single-backbone/gigaworld-policy.md) |
| 2026-05-09 | **DreamZero** — World Action Models are Zero-shot Policies (arXiv'26.02) | Single-backbone | [笔记](papers/single-backbone/dreamzero.md) |
| 2026-05-09 | **Cosmos Policy** — Fine-Tuning Video Models for Control and Planning (arXiv'26.01) | Single-backbone | [笔记](papers/single-backbone/cosmos-policy.md) |
| 2026-05-09 | **VideoPolicy** — Video Generators are Robot Policies (arXiv'25.08) | Single-backbone | [笔记](papers/single-backbone/videopolicy.md) |
| 2026-05-08 | **UD-VLA** — Unified Diffusion VLA via JD3P (ICLR'26) | Single-backbone | [笔记](papers/single-backbone/ud-vla.md) |
| 2026-05-08 | **VideoVLA** — Video Generators Can Be Generalizable Robot Manipulators (NeurIPS'25) | Single-backbone | [笔记](papers/single-backbone/videovla.md) |
| 2026-05-08 | **UWM** — Unified World Models (RSS'25) | Single-backbone | [笔记](papers/single-backbone/uwm.md) |
| 2026-05-08 | **UVA** — Unified Video Action Model (RSS'25) | Single-backbone | [笔记](papers/single-backbone/uva.md) |
| 2026-05-07 | **DIAL** — Decoupling Intent and Action via Latent WM (arXiv'26.03) | Latent-space WM | [笔记](papers/latent-space-wm/dial.md) |
| 2026-05-07 | **WoG** — World Modeling in Condition Space (arXiv'26.02) | Latent-space WM | [笔记](papers/latent-space-wm/world-guidance-wog.md) |
| 2026-05-07 | **JEPA-VLA** — Video Predictive Embedding for VLA (arXiv'26.02) | Latent-space WM | [笔记](papers/latent-space-wm/jepa-vla.md) |
| 2026-05-07 | **VISTA** — Scaling World Model for Hierarchical Manipulation (arXiv'26.02) | Latent-space WM | [笔记](papers/latent-space-wm/vista.md) |
| 2026-05-05 | **FLARE** — Robot Learning with Implicit World Modeling (CoRL'25) | Latent-space WM | [笔记](papers/latent-space-wm/flare.md) |
| 2026-05-05 | **VLA-JEPA** — Enhancing VLA Model with Latent World Model (arXiv'26.02) | Latent-space WM | [笔记](papers/latent-space-wm/vla-jepa.md) |

---

## 📁 目录结构

```
├── README.md              ← 主页面
├── progress/              ← 学习进度追踪
├── papers/                ← 单篇论文深度笔记
│   ├── latent-space-wm/
│   ├── idm-style/
│   ├── single-backbone/
│   ├── moe-mot/
│   ├── unified-vla/
│   ├── wm-for-rl/
│   ├── wm-for-eval/
│   ├── video-generation/
│   ├── benchmarks/
│   └── datasets/
├── synthesis/             ← 分类综述与技术演进
├── scripts/               ← 同步脚本
├── open-problems.md       ← 领域开放问题
└── method-toolbox.md      ← 可复用方法/技巧
```

---

## 🔍 研究聚焦

- **当前方向**: VLA (Vision-Language-Action) 长程操作
- **核心问题**: 世界模型如何赋能长程机器人任务？
- **特别关注**: 模型泛化性，尤其是面向**家庭场景**
- **硬件关联**: Pallas 7-DOF + 灵巧手, Piper 桌面臂

---

*Last updated: 2026-05-09 by Lead*
