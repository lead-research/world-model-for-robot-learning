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
| 🔬 Latent-space World Modeling | **7 / 7** | ✅ **已完成** |
| 🏗️ Single-backbone Policies | **8 / 8** | ✅ **已完成** |
| 🎯 IDM-style Policies | **12 / 12** | ✅ **已完成** |
| 🧩 MoE/MoT-style | **9 / 9** | ✅ **已完成** |
| 🔗 Unified VLA | **12 / 12** | ✅ **已完成** |
| 🎮 World Model for RL | **16 / 16** | ✅ **已完成** |
| 📏 World Model for Evaluation | 10 / 10 | ✅ **已完成** |
| 🎬 Video Generation | 6 / 25 | 🔄 **当前进行** |
| 📋 Benchmarks | 0 / 8 | ⚪ 待启动 |
| 🗂️ Datasets | 0 / 8 | ⚪ 待启动 |

**总体: 77 / 115 完成 (67.0%)**

---

## 🗓️ 学习路线图

```
Phase 1: Latent-space WM (7篇)     ──────── ✅ 已完成 (2026-05-05 ~ 2026-05-30)
Phase 2: Single-backbone (8篇)     ──────── ✅ 已完成 (2026-05-08 ~ 2026-05-09)
Phase 3: IDM-style (12篇)          ──────── ✅ 已完成 (2026-05-10 ~ 2026-05-22)
Phase 4: MoE/MoT-style (9篇)        ──────── ✅ 已完成 (2026-05-22补课)
Phase 5: Unified VLA (12篇)        ──────── ✅ 已完成 (2026-05-22补课)
Phase 6: WM for RL (16篇)          ──────── ✅ 已完成 (2026-05-30, 16篇)
Phase 7: WM for Evaluation (10篇)  ──────── ✅ 已完成 (2026-05-31, 10篇)
Phase 8: Video Generation (25篇)    ──────── 🔄 当前进行 (6/25)
Phase 9: Benchmarks (8篇)            ──────── ⚪ 待启动 (~2天)
Phase 10: Datasets (8篇)            ──────── ⚪ 待启动 (~2天)

预计总时长: ~35天 (约5周, 每日4-16篇)
```

---

## 📚 最新笔记

### IDM-style Policies (12/12 ✅)
| 日期 | 论文 | 链接 |
|------|------|------|
| 2026-05-22 | **TC-IDM** — Grounding Video Generation for Executable Zero-shot Robot Motion (arXiv'26.01) | [笔记](papers/idm-style/tc-idm.md) |
| 2026-05-22 | **Say, Dream, and Act** — Learning Video World Models for Instruction-Driven Manipulation (arXiv'26.02) | [笔记](papers/idm-style/say-dream-and-act.md) |
| 2026-05-17 | **LVP** — Large Video Planner Enables Generalizable Robot Control (arXiv'25.12) | [笔记](papers/idm-style/lvp.md) |
| 2026-05-17 | **Vidarc** — Embodied Video Diffusion Model for Closed-loop Control (arXiv'25.12) | [笔记](papers/idm-style/vidarc.md) |
| 2026-05-12 | **mimic-video** — Video-Action Models Beyond VLAs (arXiv'25.12) | [笔记](papers/idm-style/mimic-video.md) |
| 2026-05-12 | **Video2Act** — Dual-System Video Diffusion Policy (arXiv'25.12) | [笔记](papers/idm-style/video2act.md) |
| 2026-05-12 | **V2A** — Grounding Video Models to Actions (ICLR'25) | [笔记](papers/idm-style/v2a.md) |
| 2026-05-12 | **Gen2Act** — Human Video Generation for Manipulation (CoRL'25) | [笔记](papers/idm-style/gen2act.md) |
| 2026-05-10 | **VPP** — Video Prediction Policy (ICML'25 Spotlight) | [笔记](papers/idm-style/vpp.md) |
| 2026-05-10 | **VidMan** — Exploiting Implicit Dynamics from Video Diffusion (NeurIPS'24) | [笔记](papers/idm-style/vidman.md) |
| 2026-05-10 | **GR-1** — Large-Scale Video Generative Pre-training (ICLR'24) | [笔记](papers/idm-style/gr-1.md) |
| 2026-05-10 | **UniPi** — Learning Universal Policies via Text-Guided Video Generation (NeurIPS'23) | [笔记](papers/idm-style/unipi.md) |

### MoE/MoT-style Policies (9/9 ✅)
| 日期 | 论文 | 链接 |
|------|------|------|
| 2026-05-22 | **Fast-WAM** — Do World Action Models Need Test-Time Future Imagination? (arXiv'26.03) | [笔记](papers/moe-mot/fast-wam.md) |
| 2026-05-22 | **DiT4DiT** — Jointly Modeling Video Dynamics and Actions (arXiv'26.03) | [笔记](papers/moe-mot/dit4dit.md) |
| 2026-05-22 | **FRAPPE** — Infusing World Modeling into Generalist Policies (arXiv'26.02) | [笔记](papers/moe-mot/frappe.md) |
| 2026-05-22 | **LDA-1B** — Scaling Latent Dynamics Action Model (arXiv'26.02) | [笔记](papers/moe-mot/lda-1b.md) |
| 2026-05-22 | **BagelVLA** — Enhancing Long-Horizon Manipulation via Interleaved VLA Generation (arXiv'26.02) | [笔记](papers/moe-mot/bagelvla.md) |
| 2026-05-22 | **LingBot-VA** — Causal World Modeling for Robot Control (arXiv'26.01) | [笔记](papers/moe-mot/lingbot-va.md) |
| 2026-05-22 | **Motus** — A Unified Latent Action World Model (arXiv'25.12) | [笔记](papers/moe-mot/motus.md) |
| 2026-05-12 | **mimic-video** — Video-Action Models Beyond VLAs (arXiv'25.12) | [笔记](papers/idm-style/mimic-video.md) |
| 2026-05-07 | **WoG** — World Modeling in Condition Space (arXiv'26.02) | [笔记](papers/latent-space-wm/world-guidance-wog.md) |

### World Model for RL (16/16 ✅)
| 日期 | 论文 | 链接 |
|------|------|------|
| 2026-05-30 | **PlayWorld** — Learning Robot World Models from Autonomous Play (arXiv'26.03) | [笔记](papers/wm-for-rl/playworld.md) |
| 2026-05-30 | **World-VLA-Loop** — Closed-Loop Learning of Video World Model and VLA Policy (arXiv'26.02) | [笔记](papers/wm-for-rl/world-vla-loop.md) |
| 2026-05-30 | **WoVR** — World Models as Reliable Simulators for Post-Training VLA (arXiv'26.02) | [笔记](papers/wm-for-rl/wovr.md) |
| 2026-05-30 | **GigaBrain-0.5M** — VLA That Learns From World Model-Based RL (arXiv'26.02) | [笔记](papers/wm-for-rl/gigabrain-0.5m.md) |
| 2026-05-30 | **VLAW** — Iterative Co-Improvement of VLA Policy and World Model (arXiv'26.02) | [笔记](papers/wm-for-rl/vlaw.md) |
| 2026-05-30 | **RISE** — Self-Improving Robot Policy with Compositional World Model (arXiv'26.02) | [笔记](papers/wm-for-rl/rise.md) |
| 2026-05-30 | **World-Gymnast** — Training Robots with RL in a World Model (arXiv'26.02) | [笔记](papers/wm-for-rl/world-gymnast.md) |
| 2026-05-30 | **RehearseVLA** — Simulated Post-Training for VLAs with WM (CVPR'26) | [笔记](papers/wm-for-rl/rehearsevla.md) |
| 2026-05-30 | **WMPO** — World Model-based Policy Optimization for VLA (ICLR'26) | [笔记](papers/wm-for-rl/wmpo.md) |
| 2026-05-30 | **ProphRL** — Reinforcing Action Policies by Prophesying (arXiv'25.11) | [笔记](papers/wm-for-rl/prophrl.md) |
| 2026-05-30 | **VLA-RFT** — VLA Reinforcement Fine-tuning with Verified Rewards (arXiv'25.10) | [笔记](papers/wm-for-rl/vla-rft.md) |
| 2026-05-30 | **World4RL** — Diffusion World Models for Policy Refinement with RL (arXiv'25.09) | [笔记](papers/wm-for-rl/world4rl.md) |
| 2026-05-30 | **World-Env** — Leveraging World Model as a Virtual Environment for VLA Post-Training (arXiv'25.09) | [笔记](papers/wm-for-rl/world-env.md) |
| 2026-05-30 | **DiWA** — Diffusion Policy Adaptation with World Models (CoRL'25) | [笔记](papers/wm-for-rl/diwa.md) |
| 2026-05-30 | **UniSim** — Learning Interactive Real-World Simulators (ICLR'24) | [笔记](papers/wm-for-rl/unisim.md) |
| 2026-05-30 | **DayDreamer** — World Models for Physical Robot Learning (CoRL'23) | [笔记](papers/wm-for-rl/daydreamer.md) |

### Unified VLA Models (12/12 ✅)
| 日期 | 论文 | 链接 |
|------|------|------|
| 2026-05-22 | **HALO** — Unified VLA for Embodied Multimodal Chain-of-Thought Reasoning (arXiv'26.02) | [笔记](papers/unified-vla/halo-vla.md) |
| 2026-05-22 | **InternVLA-A1** — Unifying Understanding, Generation and Action (arXiv'26.01) | [笔记](papers/unified-vla/internvla-a1.md) |
| 2026-05-22 | **TriVLA** — Triple-System-Based Unified VLA (arXiv'25.07) | [笔记](papers/unified-vla/trivla.md) |
| 2026-05-22 | **RynnVLA-002** — Unified VLA and World Model (arXiv'25.11) | [笔记](papers/unified-vla/rynnvla-002.md) |
| 2026-05-22 | **F1** — VLA Bridging Understanding and Generation to Actions (arXiv'25.09) | [笔记](papers/unified-vla/f1-vla.md) |
| 2026-05-22 | **CoWVLA** — Chain of World: World Model Thinking in Latent Motion (CVPR'26) | [笔记](papers/unified-vla/cowvla.md) |
| 2026-05-22 | **Genie Envisioner** — Unified World Foundation Platform (ICLR'26) | [笔记](papers/unified-vla/genie-envisioner.md) |
| 2026-05-22 | **UniVLA** — Unified Vision-Language-Action Model (ICLR'26) | [笔记](papers/unified-vla/univla.md) |
| 2026-05-22 | **DreamVLA** — VLA Dreamed with Comprehensive World Knowledge (NeurIPS'25) | [笔记](papers/unified-vla/dreamvla.md) |
| 2026-05-22 | **UP-VLA** — Unified Understanding and Prediction Model (ICML'25) | [笔记](papers/unified-vla/up-vla.md) |
| 2026-05-22 | **GR-2** — Generative Video-Language-Action Model with Web-Scale Knowledge (arXiv'24.10) | [笔记](papers/unified-vla/gr-2.md) |
| 2026-05-10 | **GR-1** — Large-Scale Video Generative Pre-training (ICLR'24) | [笔记](papers/idm-style/gr-1.md) |

### Single-backbone Policies (8/8 ✅)
| 日期 | 论文 | 链接 |
|------|------|------|
| 2026-05-09 | **GigaWorld-Policy** — Efficient Action-Centered WAM (arXiv'26.03) | [笔记](papers/single-backbone/gigaworld-policy.md) |
| 2026-05-09 | **DreamZero** — World Action Models are Zero-shot Policies (arXiv'26.02) | [笔记](papers/single-backbone/dreamzero.md) |
| 2026-05-09 | **Cosmos Policy** — Fine-Tuning Video Models for Control and Planning (arXiv'26.01) | [笔记](papers/single-backbone/cosmos-policy.md) |
| 2026-05-09 | **VideoPolicy** — Video Generators are Robot Policies (arXiv'25.08) | [笔记](papers/single-backbone/videopolicy.md) |
| 2026-05-08 | **UD-VLA** — Unified Diffusion VLA via JD3P (ICLR'26) | [笔记](papers/single-backbone/ud-vla.md) |
| 2026-05-08 | **VideoVLA** — Video Generators Can Be Generalizable Robot Manipulators (NeurIPS'25) | [笔记](papers/single-backbone/videovla.md) |
| 2026-05-08 | **UWM** — Unified World Models (RSS'25) | [笔记](papers/single-backbone/uwm.md) |
| 2026-05-08 | **UVA** — Unified Video Action Model (RSS'25) | [笔记](papers/single-backbone/uva.md) |

### World Model for Evaluation (10/10 ✅)
| 日期 | 论文 | 链接 |
|------|------|------|
| 2026-05-31 | **V-JEPA 2.1** — Unlocking Dense Features in Video SSL (arXiv'26.03) | [笔记](papers/wm-for-eval/v-jepa-21.md) |
| 2026-05-31 | **DreamPlan** — RL Fine-Tuning of VLM Planners via Video WMs (arXiv'26.03) | [笔记](papers/wm-for-eval/dreamplan.md) |
| 2026-05-31 | **GPC** — Inference-Time Enhancement via Predictive WM (RA-L'26) | [笔记](papers/wm-for-eval/gpc.md) |
| 2026-05-31 | **Evaluating Gemini Robotics** — in Veo World Simulator (arXiv'25.12) | [笔记](papers/wm-for-eval/evaluating-gemini-robotics-policies-in-a-veo-world-simulator.md) |
| 2026-05-31 | **Scalable Policy Evaluation** — with Video World Models (arXiv'25.11) | [笔记](papers/wm-for-eval/scalable-policy-evaluation-with-video-world-models.md) |
| 2026-05-31 | **WorldEval** — World Model as Real-World Policies Evaluator (arXiv'25.05) | [笔记](papers/wm-for-eval/worldeval.md) |
| 2026-05-31 | **Horizon Imagination** — Efficient On-Policy Rollout in Diffusion WMs (ICLR'26) | [笔记](papers/wm-for-eval/horizon-imagination.md) |
| 2026-05-31 | **WorldGym** — World Model as Environment for Policy Evaluation (ICLR'26) | [笔记](papers/wm-for-eval/worldgym.md) |
| 2026-05-31 | **TD-MPC2** — Scalable World Models for Continuous Control (ICLR'24) | [笔记](papers/wm-for-eval/td-mpc2.md) |
| 2026-05-30 | **LeWorldModel** — Stable End-to-End JEPA from Pixels (arXiv'26.03) | [笔记](papers/latent-space-wm/leworldmodel.md) |

### Video Generation (6/25 🔄)
| 日期 | 论文 | 链接 |
|------|------|------|
| 2026-05-31 | **TesserAct** — Learning 4D Embodied World Models (arXiv'25.04) | [笔记](papers/video-generation/tesseract.md) |
| 2026-05-31 | **Mask2IV** — Interaction-Centric Video Generation via Mask Trajectories (AAAI'26) | [笔记](papers/video-generation/mask2iv.md) |
| 2026-05-31 | **Ctrl-World** — Controllable Generative World Model (ICLR'26) | [笔记](papers/video-generation/ctrl-world.md) |
| 2026-05-31 | **DreamGen** — Generalization via Video World Models (CoRL'25) | [笔记](papers/video-generation/dreamgen.md) |
| 2026-05-31 | **RoboDreamer** — Compositional World Models for Robot Imagination (ICML'24) | [笔记](papers/video-generation/robodreamer.md) |
| 2026-05-31 | **VLP** — Video Language Planning (ICLR'24) | [笔记](papers/video-generation/video-language-planning-vlp.md) |

### Latent-space World Modeling (7/7 ✅)
| 日期 | 论文 | 链接 |
|------|------|------|
| 2026-05-30 | **LeWorldModel** — Stable End-to-End JEPA from Pixels, 15M params, 48x speed (arXiv'26.03) | [笔记](papers/latent-space-wm/leworldmodel.md) |
| 2026-05-07 | **DIAL** — Decoupling Intent and Action via Latent WM (arXiv'26.03) | [笔记](papers/latent-space-wm/dial.md) |
| 2026-05-07 | **WoG** — World Modeling in Condition Space (arXiv'26.02) | [笔记](papers/latent-space-wm/world-guidance-wog.md) |
| 2026-05-07 | **JEPA-VLA** — Video Predictive Embedding for VLA (arXiv'26.02) | [笔记](papers/latent-space-wm/jepa-vla.md) |
| 2026-05-07 | **VISTA** — Scaling World Model for Hierarchical Manipulation (arXiv'26.02) | [笔记](papers/latent-space-wm/vista.md) |
| 2026-05-05 | **FLARE** — Robot Learning with Implicit World Modeling (CoRL'25) | [笔记](papers/latent-space-wm/flare.md) |
| 2026-05-05 | **VLA-JEPA** — Enhancing VLA Model with Latent World Model (arXiv'26.02) | [笔记](papers/latent-space-wm/vla-jepa.md) |

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

*Last updated: 2026-05-31 (16 papers: WM for Evaluation + Video Generation)*
