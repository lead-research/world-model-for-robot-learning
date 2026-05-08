# VideoVLA [NeurIPS'25]

> **arXiv**: [2512.06963](https://arxiv.org/abs/2512.06963)  
> **Project**: [Website](https://videovla-nips2025.github.io)  
> **Authors**: Yichao Shen, Fangyun Wei, Zhiying Du, Yaobo Liang, Yan Lu, Jiaolong Yang, Nanning Zheng, Baining Guo (XJTU + MSRA + Fudan)

---

## 核心问题

能否将大规模预训练视频生成模型直接改造为机器人VLA操纵器？

---

## 核心方法

VideoVLA 的核心是**把CogVideoX-5B视频生成模型改造成联合视频-动作预测器**：

1. **预训练基础**: CogVideoX-5B（大规模视频生成DiT）
2. **联合预测**: 给定语言指令+当前观测，同时预测未来动作块和未来视频帧
3. **多模态DiT**: 语言(T5编码) + 视频(VAE编码) + 动作(7D向量) → 统一token序列 → DiT自注意力
4. **DDPM扩散**: 对视频latent和动作同时加噪/去噪

### 关键洞察

> **视频想象质量 = 动作可靠性指标**：当生成的未来视频与真实结果一致时，对应动作的成功率更高。这为联合预测提供了内在一致性约束。

---

## 技术细节

- **动作表示**: 7D向量（3旋转 + 3平移 + 1夹爪开合）
- **视频编码**: 3D-causal VAE（CogVideoX），当前帧latent作为condition
- **预测频率**: 每步预测6个动作 + 13个视频latents（对应49帧）
- **推理**: DDIM 50步去噪；执行时只执行前3个动作
- **训练**: 100K pretrain + 15K finetune，32x AMD MI300X，batch 256

---

## 实验结果

**SIMPLER仿真（表1）**:
- WidowX VM平均: **53.1%** — 与π0持平(53.1%)，优于OpenVLA(4.2%)
- Google Robot VM: **73.1%** — 仅次于CogACT(75.2%)
- Google Robot VA: **62.8%** — 最优
- **总体平均(12任务): 63.0% — 最高**

**新物体泛化（表2）**:
- 10个YCB/GSO新物体Pick Up任务 — **最高平均成功率**，10个中有8个最优

**新技能泛化**:
- 从WidowX迁移到Google Robot的未见技能 — 表现优异

---

## 与UVA/UWM的对比

| 维度 | VideoVLA | UVA | UWM |
|------|----------|-----|-----|
| 预训练 | **CogVideoX-5B视频生成** | 从头训练 | 从头训练 |
| 架构 | 多模态DiT | VAE+Transformer+轻量head | 耦合Diffusion Transformer |
| 视频推理 | **必须生成**（50步DDIM） | 可跳过 | 可跳过（marginalize）|
| 参数量 | **5B** | 0.5B | — |
| 泛化能力 | **强**（新物体/新技能） | 中等 | 中等 |

VideoVLA是**"预训练视频模型→VLA"**的路线，而UVA/UWM是**"从头联合训练"**的路线。

---

## 局限性

1. **推理速度**: 50步DDIM去噪，比UVA/UWM慢
2. **视频必须生成**: 不像UVA可以跳过视频head
3. **预训练依赖**: 强绑定了CogVideoX，难以替换其他backbone
4. **5B参数**: 对实时部署要求高

---

## 对研究工作的启示

- **直接可试**: 如果有CogVideoX推理环境，可直接在实验室Pallas上测试
- **预训练策略**: 验证了"视频生成预训练→机器人"路线的可行性，值得跟进最新视频模型
- **一致性利用**: 视频-动作一致性可作为动作质量的自我评估指标

---

*笔记整理: 2026-05-08*  
*分类: Single-backbone Policies*
