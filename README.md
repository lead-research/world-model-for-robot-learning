# 🤖 World Model Research Notes

> 系统学习 [Awesome World Model for Robotics Policy](https://github.com/NTUMARS/Awesome-World-Model-for-Robotics-Policy) 论文列表，建立世界模型 + 具身智能深度知识库。
>
> 维护者: Lead (AI Research Assistant) for dli
> 
> 🌐 **在线阅读**: https://github.com/lead-research/world-model-for-robot-learning

---

## 📊 学习进度

| 分类 | 进度 | 状态 |
|------|------|------|
| 🔬 Latent-space World Modeling | 1 / 6 | 🟡 进行中 |
| 🎮 World Model for RL | 0 / 16 | ⚪ 待开始 |
| 📏 World Model for Evaluation | 0 / 10 | ⚪ 待开始 |
| 🎯 IDM-style Policies | 0 / 12 | ⚪ 待开始 |
| 🏗️ Single-backbone | 0 / 8 | ⚪ 待开始 |
| 🧩 MoE/MoT-style | 0 / 9 | ⚪ 待开始 |
| 🔗 Unified VLA | 0 / 12 | ⚪ 待开始 |
| 🎬 Video Generation | 0 / 25 | ⚪ 待开始 |
| 📋 Benchmarks | 0 / 8 | ⚪ 待开始 |
| 🗂️ Datasets | 0 / 8 | ⚪ 待开始 |

**总体: 1 / 114 完成**

---

## 🗓️ 学习路线图

```
Phase 1: Latent-space WM (6篇) ──────── 🟡 进行中
Phase 2: WM for RL (16篇)
Phase 3: WM for Evaluation (10篇)
Phase 4: IDM-style (12篇)
Phase 5: Single-backbone (8篇)
Phase 6: MoE/MoT-style (9篇)
Phase 7: Unified VLA (12篇)
Phase 8: Video Generation (25篇)
Phase 9: Benchmarks (8篇)
Phase 10: Datasets (8篇)
```

---

## 📚 最新笔记

| 日期 | 论文 | 分类 | 链接 |
|------|------|------|------|
| 2026-05-05 | **FLARE** — Robot Learning with Implicit World Modeling (CoRL'25) | Latent-space WM | [笔记](papers/latent-space-wm/flare.md) |

---

## 📁 目录结构

```
├── progress/           # 学习进度追踪
├── papers/             # 单篇论文深度笔记
│   ├── idm-style/
│   ├── single-backbone/
│   ├── moe-mot/
│   ├── unified-vla/
│   ├── latent-space-wm/
│   ├── wm-for-rl/
│   ├── wm-for-eval/
│   ├── video-generation/
│   ├── benchmarks/
│   └── datasets/
├── synthesis/          # 分类综述与技术演进
├── open-problems.md    # 领域开放问题
└── method-toolbox.md   # 可复用方法/技巧
```

---

## 🔍 研究聚焦

- **当前方向**: VLA (Vision-Language-Action) 长程操作
- **核心问题**: 世界模型如何赋能长程机器人任务？
- **特别关注**: 模型泛化性，尤其是面向家庭场景的适用性
- **硬件关联**: Pallas 7-DOF + 灵巧手, Piper 桌面臂

---

*Last updated: 2026-05-05 by Lead*
