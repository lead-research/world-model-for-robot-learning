# 学习进度追踪

> 更新日期: 2026-05-30
> 技能: world-model-research
> 完整论文列表已录入: 114 篇

---

## 概览

```yaml
total_papers: 114
completed: 60
in_progress: 0
pending: 54

# 当前活跃分类
active_category: "wm-for-evaluation"
# 已完成: Latent-space WM (6/6), Single-backbone (8/8), IDM-style (12/12), MoE/MoT (9/9), Unified VLA (12/12), World Model for RL (16/16)
# 当前: World Model for Evaluation（10篇，0/10完成）
```

---

## 分类进度

### 🔬 Latent-space World Modeling（隐空间世界建模）
```
total: 6
done: 6
in_progress: 0
pending: 0
```
- [x] FLARE (CoRL'25) — **done** → [笔记](notes/2026-05-05.md#flare)
- [x] VLA-JEPA (arXiv'26.02) — **done** → [笔记](notes/2026-05-05.md#vla-jepa)
- [x] VISTA (arXiv'26.02) — **done** → [笔记](notes/2026-05-07.md#vista)
- [x] JEPA-VLA (arXiv'26.02) — **done** → [笔记](notes/2026-05-07.md#jepa-vla)
- [x] World Guidance / WoG (arXiv'26.02) — **done** → [笔记](notes/2026-05-07.md#wog)
- [x] DIAL (arXiv'26.03) — **done** → [笔记](notes/2026-05-07.md#dial)
- **分类综述**: [synthesis.md](synthesis.md)

### 🏗️ Single-backbone Policies（单一主干策略）
```
total: 8
done: 8
in_progress: 0
pending: 0
```
- [x] UVA (RSS'25) — **done** → [笔记](notes/2026-05-08.md#uva)
- [x] UWM (RSS'25) — **done** → [笔记](notes/2026-05-08.md#uwm)
- [x] VideoVLA (NeurIPS'25) — **done** → [笔记](notes/2026-05-08.md#videovla)
- [x] UD-VLA (ICLR'26) — **done** → [笔记](notes/2026-05-08.md#ud-vla)
- [x] VideoPolicy (arXiv'25.08) — **done** → [笔记](notes/2026-05-09.md#videopolicy)
- [x] Cosmos Policy (arXiv'26.01) — **done** → [笔记](notes/2026-05-09.md#cosmos-policy)
- [x] DreamZero (WAM) (arXiv'26.02) — **done** → [笔记](notes/2026-05-09.md#dreamzero)
- [x] GigaWorld-Policy (arXiv'26.03) — **done** → [笔记](notes/2026-05-09.md#gigaworld-policy)

### 🎯 IDM-style Policies（逆动力学策略）
```
total: 12
done: 12
in_progress: 0
pending: 0
```
- [x] UniPi (NeurIPS'23) — **done** → [笔记](notes/2026-05-10.md#unipi)
- [x] GR-1 (ICLR'24) — **done** → [笔记](notes/2026-05-10.md#gr-1)
- [x] VidMan (NeurIPS'24) — **done** → [笔记](notes/2026-05-10.md#vidman)
- [x] VPP (ICML'25) — **done** → [笔记](notes/2026-05-10.md#vpp)
- [x] Gen2Act (CoRL'25) — **done** → [笔记](notes/2026-05-12.md#gen2act)
- [x] V2A (ICLR'25) — **done** → [笔记](notes/2026-05-12.md#v2a)
- [x] Video2Act (arXiv'25.12) — **done** → [笔记](notes/2026-05-12.md#video2act)
- [x] mimic-video (arXiv'25.12) — **done** → [笔记](notes/2026-05-12.md#mimic-video)
- [x] LVP (arXiv'25.12) — **done** → [笔记](notes/2026-05-17.md#lvp)
- [x] Vidarc (arXiv'25.12) — **done** → [笔记](notes/2026-05-17.md#vidarc)
- [x] TC-IDM (arXiv'26.01) — **done** → [笔记](notes/2026-05-22.md#tc-idm)
- [x] Say, Dream, and Act (arXiv'26.02) — **done** → [笔记](notes/2026-05-22.md#say-dream-and-act)
- **分类综述**: 待更新

### 🧩 MoE/MoT-style Policies（混合专家/混合令牌）
```
total: 9
done: 9
in_progress: 0
pending: 0
```
- [x] Motus (arXiv'25.12) — **done** → [笔记](notes/2026-05-22.md#motus)
- [x] mimic-video (arXiv'25.12) — **done** (IDM分类已分析) → [笔记](notes/2026-05-12.md#mimic-video)
- [x] LingBot-VA (arXiv'26.01) — **done** → [笔记](notes/2026-05-22.md#lingbot-va)
- [x] BagelVLA (arXiv'26.02) — **done** → [笔记](notes/2026-05-22.md#bagelvla)
- [x] LDA-1B (arXiv'26.02) — **done** → [笔记](notes/2026-05-22.md#lda-1b)
- [x] FRAPPE (arXiv'26.02) — **done** → [笔记](notes/2026-05-22.md#frappe)
- [x] World Guidance (WoG) (arXiv'26.02) — **done** (Latent-space已分析) → [笔记](notes/2026-05-07.md#wog)
- [x] DiT4DiT (arXiv'26.03) — **done** → [笔记](notes/2026-05-22.md#dit4dit)
- [x] Fast-WAM (arXiv'26.03) — **done** → [笔记](notes/2026-05-22.md#fast-wam)

### 🔗 Unified VLA Models（统一 VLA 模型）
```
total: 12
done: 12  # GR-1已在IDM分类完成
in_progress: 0
pending: 0
```
- [x] GR-1 (ICLR'24) — **done** (IDM分类已分析) → [笔记](notes/2026-05-10.md#gr-1)
- [x] GR-2 (arXiv'24.10) — **done** → [笔记](notes/2026-05-22.md#gr-2)
- [x] UP-VLA (ICML'25) — **done** → [笔记](notes/2026-05-22.md#up-vla)
- [x] DreamVLA (NeurIPS'25) — **done** → [笔记](notes/2026-05-22.md#dreamvla)
- [x] UniVLA (ICLR'26) — **done** → [笔记](notes/2026-05-22.md#univla)
- [x] Genie Envisioner (ICLR'26) — **done** → [笔记](notes/2026-05-22.md#genie-envisioner)
- [x] CoWVLA (CVPR'26) — **done** → [笔记](notes/2026-05-22.md#cowvla)
- [x] F1 (arXiv'25.09) — **done** → [笔记](notes/2026-05-22.md#f1-vla)
- [x] RynnVLA-002 (arXiv'25.11) — **done** → [笔记](notes/2026-05-22.md#rynnvla-002)
- [x] TriVLA (arXiv'25.07) — **done** → [笔记](notes/2026-05-22.md#trivla)
- [x] InternVLA-A1 (arXiv'26.01) — **done** → [笔记](notes/2026-05-22.md#internvla-a1)
- [x] HALO (arXiv'26.02) — **done** → [笔记](notes/2026-05-22.md#halo-vla)
- **分类综述**: 待更新

### 🎮 World Model for RL（用于强化学习）
```
total: 16
done: 16
in_progress: 0
pending: 0
```
- [x] DayDreamer (CoRL'23) — **done** → [笔记](notes/2026-05-30.md#daydreamer)
- [x] UniSim (ICLR'24) — **done** → [笔记](notes/2026-05-30.md#unisim)
- [x] DiWA (CoRL'25) — **done** → [笔记](notes/2026-05-30.md#diwa)
- [x] World-Env (arXiv'25.09) — **done** → [笔记](notes/2026-05-30.md#world-env)
- [x] World4RL (arXiv'25.09) — **done** → [笔记](notes/2026-05-30-batch2.md#world4rl)
- [x] VLA-RFT (arXiv'25.10) — **done** → [笔记](notes/2026-05-30-batch2.md#vla-rft)
- [x] ProphRL (arXiv'25.11) — **done** → [笔记](notes/2026-05-30-batch2.md#prophrl)
- [x] WMPO (ICLR'26) — **done** → [笔记](notes/2026-05-30-batch2.md#wmpo)
- [x] RehearseVLA (CVPR'26) — **done** → [笔记](notes/2026-05-30-batch2.md#rehearsevla)
- [x] World-Gymnast (arXiv'26.02) — **done** → [笔记](notes/2026-05-30-batch2.md#world-gymnast)
- [x] RISE (arXiv'26.02) — **done** → [笔记](notes/2026-05-30-batch2.md#rise)
- [x] VLAW (arXiv'26.02) — **done** → [笔记](notes/2026-05-30-batch2.md#vlaw)
- [x] GigaBrain-0.5M (arXiv'26.02) — **done** → [笔记](notes/2026-05-30-batch2.md#gigabrain-0.5m)
- [x] WoVR (arXiv'26.02) — **done** → [笔记](notes/2026-05-30-batch2.md#wovr)
- [x] World-VLA-Loop (arXiv'26.02) — **done** → [笔记](notes/2026-05-30-batch2.md#world-vla-loop)
- [x] PlayWorld (arXiv'26.03) — **done** → [笔记](notes/2026-05-30-batch2.md#playworld)
- **分类综述**: [notes/2026-05-30-batch2.md](notes/2026-05-30-batch2.md#分类综述)

### 📏 World Model for Evaluation（用于评估）
```
total: 10
done: 0
in_progress: 0
pending: 10
```
全部 pending

### 🎬 World Models for Video Generation（视频生成）
```
total: 25
done: 0
in_progress: 0
pending: 25
```
全部 pending

### 📋 Benchmarks for Evaluation World-Model
```
total: 8
done: 0
in_progress: 0
pending: 8
```
全部 pending

### 🗂️ Datasets（数据集）
```
total: 8
done: 0
in_progress: 0
pending: 8
```
全部 pending

---

## 今日计划 (2026-05-30)
停滞8天后重启！今日完成 World Model for RL 全部16篇：
- 上午4篇: DayDreamer, UniSim, DiWA, World-Env
- 下午12篇: World4RL, VLA-RFT, ProphRL, WMPO, RehearseVLA, World-Gymnast, RISE, VLAW, GigaBrain, WoVR, World-VLA-Loop, PlayWorld

### 明日计划 (2026-05-31)
进入 **World Model for Evaluation** 分类（10篇），目标4篇/日：
- TD-MPC2, WorldGym, Horizon Imagination, WorldEval

---

## 学习节奏

- **每日目标**: 4-16 篇论文深度阅读 + 笔记（补课日可加量）
- **每周回顾**: 每周末更新 synthesis.md，归纳该周学到的技术脉络
- **分类切换**: 完成一个分类的全部论文后，写一份分类综述，再进入下一个分类

---

## 笔记索引

| 日期 | 文件 | 覆盖论文数 |
|------|------|-----------|
| 2026-05-05 | notes/2026-05-05.md | 2 (FLARE, VLA-JEPA) |
| 2026-05-07 | notes/2026-05-07.md | 4 (VISTA, JEPA-VLA, WoG, DIAL) |
| 2026-05-08 | notes/2026-05-08.md | 4 (UVA, UWM, VideoVLA, UD-VLA) |
| 2026-05-09 | notes/2026-05-09.md | 4 (VideoPolicy, Cosmos Policy, DreamZero, GigaWorld-Policy) |
| 2026-05-10 | notes/2026-05-10.md | 4 (UniPi, GR-1, VidMan, VPP) |
| 2026-05-12 | notes/2026-05-12.md | 4 (Gen2Act, V2A, Video2Act, mimic-video) |
| 2026-05-17 | notes/2026-05-17.md | 2 (LVP, Vidarc) |
| 2026-05-22 | notes/2026-05-22.md | 20 (补课批次) |
| 2026-05-30 | notes/2026-05-30.md + batch2.md | 16 (World Model for RL 全分类) |
