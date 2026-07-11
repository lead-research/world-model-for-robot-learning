# WAM Research Notes

> 系统学习 [Awesome-WAM](https://github.com/OpenMOSS/Awesome-WAM) 论文列表（**106篇**），建立 World Action Model 深度知识库。
>
> 维护者: Lead (AI Research Assistant) for dli
>
> 🌐 **在线阅读**: https://github.com/lead-research/world-model-for-robot-learning/wam

---

## 📊 学习进度

| 分类 | 进度 | 状态 |
|------|------|------|
| 📹 Cascaded WAM - Pixel-space | **0 / 13** | 🔄 **进行中** |
| 🔷 Cascaded WAM - Geometric | **0 / 9** | ⏳ 待开始 |
| 🔮 Cascaded WAM - Implicit | **0 / 12** | ⏳ 待开始 |
| 📝 Joint WAM - Autoregressive | **0 / 8** | ⏳ 待开始 |
| 🎨 Joint WAM - Diffusion Unified | **0 / 11** | ⏳ 待开始 |
| 🎨 Joint WAM - Diffusion Multi | **0 / 23** | ⏳ 待开始 |
| 🎯 World Model for VLA - IL | **0 / 3** | ⏳ 待开始 |
| 🎯 World Model for VLA - RL | **0 / 23** | ⏳ 待开始 |
| 🎯 World Model for VLA - Eval | **0 / 5** | ⏳ 待开始 |

**总体: 0 / 106 完成 (0%)** 🚀

---

## 📅 学习路线图

```
Phase 1: Cascaded Pixel-space (13篇)    ──────── 🔄 进行中 (Day 1-2)
Phase 2: Cascaded Geometric (9篇)        ──────── ⏳ 待开始 (Day 3)
Phase 3: Cascaded Implicit (12篇)        ──────── ⏳ 待开始 (Day 4-5)
Phase 4: Joint Autoregressive (8篇)      ──────── ⏳ 待开始 (Day 6)
Phase 5: Joint Diffusion Unified (11篇)  ──────── ⏳ 待开始 (Day 7-8)
Phase 6: Joint Diffusion Multi (23篇)    ──────── ⏳ 待开始 (Day 9-11)
Phase 7: VLA Imitation (3篇)             ──────── ⏳ 待开始 (Day 12)
Phase 8: VLA RL (23篇)                   ──────── ⏳ 待开始 (Day 12-14)
Phase 9: VLA Evaluation (5篇)           ──────── ⏳ 待开始 (Day 14)

总计: ~14天 (每日8篇)
```

---

## 📁 目录结构

```
wam/
├── README.md              ← 本文件
├── progress/              ← 学习进度追踪
├── papers/                ← 单篇论文深度笔记
│   ├── cascaded-pixel/
│   ├── cascaded-geometric/
│   ├── cascaded-implicit/
│   ├── joint-autoregressive/
│   ├── joint-diffusion-unified/
│   ├── joint-diffusion-multi/
│   ├── vla-imitation/
│   ├── vla-rl/
│   └── vla-eval/
├── synthesis/             ← 分类综述与技术演进
└── open-problems.md       ← 领域开放问题
```

---

## 🔍 研究聚焦

- **当前方向**: World Action Model (WAM) 统一预测世界建模与动作生成
- **核心问题**: 世界模型如何与动作生成耦合？级联 vs 联合建模哪种更好？
- **特别关注**: 模型泛化性、跨本体迁移、实时推理效率
- **硬件关联**: Pallas 7-DOF + 灵巧手, Piper 桌面臂

---

*Last updated: 2026-07-11 (WAM project started!)*
