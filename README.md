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
| 🔬 Latent-space World Modeling | 1 / 6 | 🟡 进行中 |
| 🎯 IDM-style Policies | 0 / 12 | ⚪ 待启动 |
| 🏗️ Single-backbone | 0 / 8 | ⚪ 待启动 |
| 🧩 MoE/MoT-style | 0 / 9 | ⚪ 待启动 |
| 🔗 Unified VLA | 0 / 12 | ⚪ 待启动 |
| 🎮 World Model for RL | 0 / 16 | ⚪ 待启动 |
| 📏 World Model for Evaluation | 0 / 10 | ⚪ 待启动 |
| 🎬 Video Generation | 0 / 25 | ⚪ 待启动 |
| 📋 Benchmarks | 0 / 8 | ⚪ 待启动 |
| 🗂️ Datasets | 0 / 8 | ⚪ 待启动 |

**总体: 1 / 114 完成**

---

## 🗓️ 学习路线图

```
Phase 1: Latent-space WM (6篇)     ──────── 🟡 进行中 (~3天)
Phase 2: IDM-style (12篇)          ──────── ⚪ 待启动 (~6天)
Phase 3: Single-backbone (8篇)     ──────── ⚪ 待启动 (~4天)
Phase 4: MoE/MoT-style (9篇)       ──────── ⚪ 待启动 (~5天)
Phase 5: Unified VLA (12篇)        ──────── ⚪ 待启动 (~6天)
Phase 6: WM for RL (16篇)          ──────── ⚪ 待启动 (~8天)
Phase 7: WM for Evaluation (10篇)  ──────── ⚪ 待启动 (~5天)
Phase 8: Video Generation (25篇)    ──────── ⚪ 待启动 (~13天)
Phase 9: Benchmarks (8篇)           ──────── ⚪ 待启动 (~4天)
Phase 10: Datasets (8篇)            ──────── ⚪ 待启动 (~4天)

预计总时长: ~57天 (约8周)
```

---

## 📚 最新笔记

| 日期 | 论文 | 分类 | 链接 |
|------|------|------|------|
| 2026-05-05 | **FLARE** — Robot Learning with Implicit World Modeling (CoRL'25) | Latent-space WM | [笔记](papers/latent-space-wm/flare.md) |

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

*Last updated: 2026-05-05 by Lead*
