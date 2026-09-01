# 学习进度追踪

> 更新日期: 2026-09-02
> 技能: world-model-research
> 完整论文列表已录入: 116 篇
> 最新收录: Zero-WAM (arXiv'26.08) — MoE/MoT-style Policies

---

## 概览

```yaml
total_papers: 116
completed: 116
in_progress: 0
pending: 0

# 当前活跃分类
active_category: "completed"
# 全部完成：Latent-space WM (7/7), Single-backbone (8/8), IDM-style (12/12), MoE/MoT (10/10), 
# Unified VLA (12/12), World Model for RL (16/16), World Model for Evaluation (10/10),
# Video Generation (25/25), Benchmarks (8/8), Datasets (8/8)
```

---

## 分类进度

### 🔬 Latent-space World Modeling（隐空间世界建模）
```
total: 7
done: 7
in_progress: 0
pending: 0
```
- [x] FLARE (CoRL'25) — **done** → [笔记](notes/2026-05-05.md#flare)
- [x] VLA-JEPA (arXiv'26.02) — **done** → [笔记](notes/2026-05-05.md#vla-jepa)
- [x] VISTA (arXiv'26.02) — **done** → [笔记](notes/2026-05-07.md#vista)
- [x] JEPA-VLA (arXiv'26.02) — **done** → [笔记](notes/2026-05-07.md#jepa-vla)
- [x] World Guidance / WoG (arXiv'26.02) — **done** → [笔记](notes/2026-05-07.md#wog)
- [x] DIAL (arXiv'26.03) — **done** → [笔记](notes/2026-05-07.md#dial)
- [x] LeWorldModel (arXiv'26.03) — **done** → [笔记](notes/2026-05-30-lewm.md#leworldmodel)
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
- [x] UniPi (NeurIPS'23) — **done** → [笔记](notes/2026-05-05.md#unipi)
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
total: 10
done: 10
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
- [x] Zero-WAM (arXiv'26.08) — **done** → [../papers/moe-mot/zero-wam.md](../papers/moe-mot/zero-wam.md)

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
done: 10
in_progress: 0
pending: 0
```
- [x] TD-MPC2 (ICLR'24) — **done** → [笔记](notes/2026-05-31.md#td-mpc2)
- [x] WorldGym (ICLR'26) — **done** → [笔记](notes/2026-05-31.md#worldgym)
- [x] Horizon Imagination (ICLR'26) — **done** → [笔记](notes/2026-05-31.md#horizon-imagination)
- [x] WorldEval (arXiv'25.05) — **done** → [笔记](notes/2026-05-31.md#worldeval)
- [x] Scalable Policy Evaluation with Video World Models (arXiv'25.11) — **done** → [笔记](notes/2026-05-31.md#scalable-policy-evaluation)
- [x] Evaluating Gemini Robotics Policies in Veo (arXiv'25.12) — **done** → [笔记](notes/2026-05-31.md#evaluating-gemini-robotics)
- [x] GPC (RA-L'26) — **done** → [笔记](notes/2026-05-31.md#gpc)
- [x] DreamPlan (arXiv'26.03) — **done** → [笔记](notes/2026-05-31.md#dreamplan)
- [x] LeWorldModel (arXiv'26.03) — **done** (Latent-space已分析) → [笔记](notes/2026-05-30-lewm.md#leworldmodel)
- [x] V-JEPA 2.1 (arXiv'26.03) — **done** → [笔记](notes/2026-05-31.md#v-jepa-21)
- **分类综述**: 待更新

### 🎬 World Models for Video Generation（视频生成）
```
total: 25
done: 25
in_progress: 0
pending: 0
```
- [x] Video Language Planning / VLP (ICLR'24) — **done** → [笔记](notes/2026-05-31.md#vlp)
- [x] RoboDreamer (ICML'24) — **done** → [笔记](notes/2026-05-31.md#robodreamer)
- [x] DreamGen (CoRL'25) — **done** → [笔记](notes/2026-05-31.md#dreamgen)
- [x] Ctrl-World (ICLR'26) — **done** → [笔记](notes/2026-05-31.md#ctrl-world)
- [x] Mask2IV (AAAI'26) — **done** → [笔记](notes/2026-05-31.md#mask2iv)
- [x] TesserAct (arXiv'25.04) — **done** → [笔记](notes/2026-05-31.md#tesseract)
- [x] **Dreamitate (CoRL'24)** — **done** → [笔记](notes/2026-06-02-evening.md#dreamitate)
- [x] **DreMa (ICLR'25)** — **done** → [笔记](notes/2026-06-02-evening.md#drema)
- [x] **CogVideoX (ICLR'25)** — **done** → [笔记](notes/2026-06-02-evening.md#cogvideox)
- [x] **PhysWorld (ICCV'25)** — **done** → [笔记](notes/2026-06-02-evening.md#physworld)
- [x] **IRASim (ICCV'25)** — **done** → [笔记](notes/2026-06-07.md#irasim)
- [x] **RoboEnvision (IROS'25)** — **done** → arXiv:2506.22007，[笔记](notes/2026-06-07.md#roboenvision)
- [x] **RoboMaster (ICLR'26)** — **done** → [笔记](notes/2026-06-07.md#robomaster)
- [x] **Vid2World (ICLR'26)** — **done** → [笔记](notes/2026-06-07.md#vid2world)
- [x] Genie Envisioner (ICLR'26) — **done** (Unified VLA已分析) → [笔记](notes/2026-05-22.md#genie-envisioner)
- [x] **ManipDreamer (arXiv'25.04)** — **done** → [笔记](notes/2026-06-07.md#manipdreamer)
- [x] **EnerVerse-AC (arXiv'25.05)** — **done** → [笔记](notes/2026-06-02.md#enerverse-ac)
- [x] **WoW (arXiv'25.09)** — **done** → [笔记](notes/2026-06-01.md#wow)
- [x] **UnifoLM-WMA-0 (Tech Release'25.09)** — **done** → [笔记](notes/2026-06-07.md#unifolm-wma-0)
- [x] **Cosmos Predict 2.5 (Tech Report'25.10)** — **done** → [笔记](notes/2026-06-07.md#cosmos-predict-25)
- [x] **GigaWorld-0 (arXiv'25.11)** — **done** → [笔记](notes/2026-06-01.md#gigaworld-0)
- [x] **RoboVIP (arXiv'26.01)** — **done** → [笔记](notes/2026-06-01.md#robovip)
- [x] **DreamDojo (arXiv'26.02)** — **done** → [笔记](notes/2026-06-01.md#dreamdojo)
- [x] **Interactive World Simulator (arXiv'26.03)** — **done** → [笔记](notes/2026-06-02.md#interactive-world-simulator)
- [x] **ABot-PhysWorld (arXiv'26.03)** — **done** → [笔记](notes/2026-06-02.md#abot-physworld)

### 📋 Benchmarks for Evaluation World-Model
```
total: 8
done: 8
in_progress: 0
pending: 0
```
- [x] **EVA-Bench (ICML'25)** — **done** → [笔记](notes/2026-06-07.md#eva-bench)
- [x] **WorldSimBench (ICML'25)** — **done** → [笔记](notes/2026-06-07.md#worldsimbench)
- [x] **EWMBench (BMVC'25)** — **done** → [笔记](notes/2026-06-07.md#ewmbench)
- [x] **DreamGen Bench (CoRL'25)** — **done** → [笔记](notes/2026-06-07.md#dreamgen-bench)
- [x] **World-in-World (ICLR'26)** — **done** → [笔记](notes/2026-06-07.md#world-in-world)
- [x] **WoW-World-Eval (arXiv'26.01)** — **done** → [笔记](notes/2026-06-09.md#wow-world-eval)
- [x] **RBench (arXiv'26.01)** — **done** → [笔记](notes/2026-06-09.md#rbench)
- [x] **WorldArena (arXiv'26.02)** — **done** → [笔记](notes/2026-06-09.md#worldarena)

### 🗂️ Datasets（数据集）
```
total: 8
done: 8
in_progress: 0
pending: 0
```
- [x] **Open X-Embodiment (ICRA'24)** — **done** → [笔记](notes/2026-06-09.md#open-x-embodiment)
- [x] **DROID (RSS'24)** — **done** → [笔记](notes/2026-06-09.md#droid)
- [x] **EVA-Instruct (ICML'25)** — **done** → [笔记](notes/2026-06-09.md#eva-instruct)
- [x] **HF-Embodied (ICML'25)** — **done** → [笔记](notes/2026-06-09.md#hf-embodied)
- [x] **AgiBot-World (IROS'25)** — **done** → [笔记](notes/2026-06-09.md#agibot-world)
- [x] **Galaxea Open-World Dataset (arXiv'25.09)** — **done** → [笔记](notes/2026-06-09.md#galaxea-open-world-dataset)
- [x] **Action100M (arXiv'26.01)** — **done** → [笔记](notes/2026-06-09.md#action100m)
- [x] **RoVid-X (arXiv'26.01)** — **done** → [笔记](notes/2026-06-09.md#rovid-x)

---

## 🎉 全部完成！115/115

### 2026-06-09 最终批次完成
- Benchmarks: WoW-World-Eval ✅, RBench ✅, WorldArena ✅
- Datasets: OXE ✅, DROID ✅, EVA-Instruct ✅, HF-Embodied ✅, AgiBot-World ✅, Galaxea ✅, Action100M ✅, RoVid-X ✅
- **全部 115 篇论文深度阅读完成！**

### 后续工作
- 更新所有分类综述到 `synthesis.md`
- 撰写完整学习报告
- 更新 GitHub 仓库
- 制定未来研究方向计划

---

## 学习节奏

- **每日目标**: 1-2 篇论文深度阅读 + 笔记
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
| 2026-05-30 | notes/2026-05-30.md | 8 (DayDreamer, UniSim, DiWA, World-Env, LeWorldModel) |
| 2026-05-30 | notes/2026-05-30-batch2.md | 16 (World Model for RL 全分类) |
| 2026-05-31 | notes/2026-05-31.md | 16 (WM for Evaluation 10 + Video Generation 6) |
| 2026-06-01 | notes/2026-06-01.md | 4 (Video Generation: DreamDojo, RoboVIP, WoW, GigaWorld-0) |
| 2026-06-02 | notes/2026-06-02.md | 3 (Video Generation: Interactive World Simulator, ABot-PhysWorld, EnerVerse-AC + 4篇阻塞) |
| 2026-06-02 | notes/2026-06-02-evening.md | 4 (Video Generation: Dreamitate, DreMa, CogVideoX, PhysWorld) |
| 2026-06-07 | notes/2026-06-07.md | 11 (Video Generation: IRASim, RoboMaster, Vid2World, ManipDreamer, UnifoLM-WMA-0, Cosmos Predict 2.5 + Benchmarks: EVA-Bench, WorldSimBench, EWMBench, DreamGen Bench, World-in-World + 1阻塞) |
| 2026-06-09 | notes/2026-06-09.md | 11 (Benchmarks: WoW-World-Eval, RBench, WorldArena + Datasets: OXE, DROID, EVA-Instruct, HF-Embodied, AgiBot-World, Galaxea, Action100M, RoVid-X) |


---

## 分类进度

### 🔬 Latent-space World Modeling（隐空间世界建模）
```
total: 7
done: 7
in_progress: 0
pending: 0
```
- [x] FLARE (CoRL'25) — **done** → [笔记](notes/2026-05-05.md#flare)
- [x] VLA-JEPA (arXiv'26.02) — **done** → [笔记](notes/2026-05-05.md#vla-jepa)
- [x] VISTA (arXiv'26.02) — **done** → [笔记](notes/2026-05-07.md#vista)
- [x] JEPA-VLA (arXiv'26.02) — **done** → [笔记](notes/2026-05-07.md#jepa-vla)
- [x] World Guidance / WoG (arXiv'26.02) — **done** → [笔记](notes/2026-05-07.md#wog)
- [x] DIAL (arXiv'26.03) — **done** → [笔记](notes/2026-05-07.md#dial)
- [x] LeWorldModel (arXiv'26.03) — **done** → [笔记](notes/2026-05-30-lewm.md#leworldmodel)
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
total: 10
done: 10
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
- [x] Zero-WAM (arXiv'26.08) — **done** → [../papers/moe-mot/zero-wam.md](../papers/moe-mot/zero-wam.md)

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
done: 10
in_progress: 0
pending: 0
```
- [x] TD-MPC2 (ICLR'24) — **done** → [笔记](notes/2026-05-31.md#td-mpc2)
- [x] WorldGym (ICLR'26) — **done** → [笔记](notes/2026-05-31.md#worldgym)
- [x] Horizon Imagination (ICLR'26) — **done** → [笔记](notes/2026-05-31.md#horizon-imagination)
- [x] WorldEval (arXiv'25.05) — **done** → [笔记](notes/2026-05-31.md#worldeval)
- [x] Scalable Policy Evaluation with Video World Models (arXiv'25.11) — **done** → [笔记](notes/2026-05-31.md#scalable-policy-evaluation)
- [x] Evaluating Gemini Robotics Policies in Veo (arXiv'25.12) — **done** → [笔记](notes/2026-05-31.md#evaluating-gemini-robotics)
- [x] GPC (RA-L'26) — **done** → [笔记](notes/2026-05-31.md#gpc)
- [x] DreamPlan (arXiv'26.03) — **done** → [笔记](notes/2026-05-31.md#dreamplan)
- [x] LeWorldModel (arXiv'26.03) — **done** (Latent-space已分析) → [笔记](notes/2026-05-30-lewm.md#leworldmodel)
- [x] V-JEPA 2.1 (arXiv'26.03) — **done** → [笔记](notes/2026-05-31.md#v-jepa-21)
- **分类综述**: 待更新

### 🎬 World Models for Video Generation（视频生成）
```
total: 25
done: 25
in_progress: 0
pending: 0
```
- [x] Video Language Planning / VLP (ICLR'24) — **done** → [笔记](notes/2026-05-31.md#vlp)
- [x] RoboDreamer (ICML'24) — **done** → [笔记](notes/2026-05-31.md#robodreamer)
- [x] DreamGen (CoRL'25) — **done** → [笔记](notes/2026-05-31.md#dreamgen)
- [x] Ctrl-World (ICLR'26) — **done** → [笔记](notes/2026-05-31.md#ctrl-world)
- [x] Mask2IV (AAAI'26) — **done** → [笔记](notes/2026-05-31.md#mask2iv)
- [x] TesserAct (arXiv'25.04) — **done** → [笔记](notes/2026-05-31.md#tesseract)
- [x] **Dreamitate (CoRL'24)** — **done** → [笔记](notes/2026-06-02-evening.md#dreamitate)
- [x] **DreMa (ICLR'25)** — **done** → [笔记](notes/2026-06-02-evening.md#drema)
- [x] **CogVideoX (ICLR'25)** — **done** → [笔记](notes/2026-06-02-evening.md#cogvideox)
- [x] **PhysWorld (ICCV'25)** — **done** → [笔记](notes/2026-06-02-evening.md#physworld)
- [x] **IRASim (ICCV'25)** — **done** → [笔记](notes/2026-06-07.md#irasim)
- [x] **RoboEnvision (IROS'25)** — **done** → arXiv:2506.22007，[笔记](notes/2026-06-07.md#roboenvision)
- [x] **RoboMaster (ICLR'26)** — **done** → [笔记](notes/2026-06-07.md#robomaster)
- [x] **Vid2World (ICLR'26)** — **done** → [笔记](notes/2026-06-07.md#vid2world)
- [x] Genie Envisioner (ICLR'26) — **done** (Unified VLA已分析) → [笔记](notes/2026-05-22.md#genie-envisioner)
- [x] **ManipDreamer (arXiv'25.04)** — **done** → [笔记](notes/2026-06-07.md#manipdreamer)
- [x] **EnerVerse-AC (arXiv'25.05)** — **done** → [笔记](notes/2026-06-02.md#enerverse-ac)
- [x] **WoW (arXiv'25.09)** — **done** → [笔记](notes/2026-06-01.md#wow)
- [x] **UnifoLM-WMA-0 (Tech Release'25.09)** — **done** → [笔记](notes/2026-06-07.md#unifolm-wma-0)
- [x] **Cosmos Predict 2.5 (Tech Report'25.10)** — **done** → [笔记](notes/2026-06-07.md#cosmos-predict-25)
- [x] **GigaWorld-0 (arXiv'25.11)** — **done** → [笔记](notes/2026-06-01.md#gigaworld-0)
- [x] **RoboVIP (arXiv'26.01)** — **done** → [笔记](notes/2026-06-01.md#robovip)
- [x] **DreamDojo (arXiv'26.02)** — **done** → [笔记](notes/2026-06-01.md#dreamdojo)
- [x] **Interactive World Simulator (arXiv'26.03)** — **done** → [笔记](notes/2026-06-02.md#interactive-world-simulator)
- [x] **ABot-PhysWorld (arXiv'26.03)** — **done** → [笔记](notes/2026-06-02.md#abot-physworld)

### 📋 Benchmarks for Evaluation World-Model
```
total: 8
done: 5
in_progress: 0
pending: 3
```
- [x] **EVA-Bench (ICML'25)** — **done** → [笔记](notes/2026-06-07.md#eva-bench)
- [x] **WorldSimBench (ICML'25)** — **done** → [笔记](notes/2026-06-07.md#worldsimbench)
- [x] **EWMBench (BMVC'25)** — **done** → [笔记](notes/2026-06-07.md#ewmbench)
- [x] **DreamGen Bench (CoRL'25)** — **done** → [笔记](notes/2026-06-07.md#dreamgen-bench)
- [x] **World-in-World (ICLR'26)** — **done** → [笔记](notes/2026-06-07.md#world-in-world)
- [ ] WoW-World-Eval (arXiv'26.01) — pending
- [ ] RBench (arXiv'26.01) — pending
- [ ] WorldArena (arXiv'26.02) — pending

### 🗂️ Datasets（数据集）
```
total: 8
done: 0
in_progress: 0
pending: 8
```
全部 pending

---

## 今日完成 (2026-06-07) ✅ 12篇完成
- Video Generation: IRASim ✅, RoboEnvision ✅, RoboMaster ✅, Vid2World ✅, ManipDreamer ✅, UnifoLM-WMA-0 ✅, Cosmos Predict 2.5 ✅
- Benchmarks: EVA-Bench ✅, WorldSimBench ✅, EWMBench ✅, DreamGen Bench ✅, World-in-World ✅

### 明日计划 (2026-06-08)
- 处理 RoboEnvision 阻塞：通过 Google Scholar 或 Awesome 列表维护者确认正确信息
- 完成 Benchmarks 剩余 3 篇: WoW-World-Eval, RBench, WorldArena
- 进入 Datasets 分类: 8篇全部待处理
- 更新 Video Generation 分类综述 + Benchmarks 分类综述
- git commit && push 到 GitHub

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
| 2026-05-31 | notes/2026-05-31.md | 16 (WM for Evaluation 10 + Video Generation 6) |
| 2026-05-30 | notes/2026-05-30.md + batch2.md | 16 (World Model for RL 全分类) |
| 2026-06-01 | notes/2026-06-01.md | 4 (Video Generation: DreamDojo, RoboVIP, WoW, GigaWorld-0) |
| 2026-06-02 | notes/2026-06-02.md | 3 (Video Generation: Interactive World Simulator, ABot-PhysWorld, EnerVerse-AC + 4篇阻塞) |
| 2026-06-07 | notes/2026-06-07.md | 11 (Video Generation: IRASim, RoboMaster, Vid2World, ManipDreamer, UnifoLM-WMA-0, Cosmos Predict 2.5 + Benchmarks: EVA-Bench, WorldSimBench, EWMBench, DreamGen Bench, World-in-World + 1阻塞) |
