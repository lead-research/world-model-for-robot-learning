## Zero-WAM: In-Context World-Action Modeling from Human Videos for Open-Ended Task Generalization [arXiv 2026]

- **链接**: [arXiv 2608.26103](https://arxiv.org/abs/2608.26103) | [Project](https://robbyant-research.github.io/Zero-WAM/)
- **分类**: MoE/MoT-style
- **核心问题**: 如何实现机器人在未见过任务上的零样本跨任务泛化？现有 VLA 和视频-动作模型主要依赖语言作为任务接口，但语言对空间约束、中间状态、时序结构等操纵细节欠指定；而人类示范视频能直接提供任务演化的视觉证据，但缺乏大规模配对的人类-机器人数据，且模型容易在训练任务上学到捷径而忽略视频中的人类视频提示。
- **核心方法**: Zero-WAM 是一个因果视频-动作模型，支持语言指令和人类视频示范两种任务规格。通过自动化的 in-context 人类视频生成流程，将任务级采样的机器人轨迹转换为语义匹配的人类操纵视频，构建 HumanGen 数据集（74.2K 对人类-机器人 ICL 配对，8.6K 任务）；并提出 In-Context Future Chunk Prediction (IFP) 目标，强制模型从人类视频提示中提取任务信息。
- **主要特点**:
  - **人类视频作为任务接口**：将 LLM 中的 in-context learning 范式迁移到机器人操纵，用人类视频直接指定未见过任务的期望视觉动态。
  - **自动化、可扩展的人类视频生成**：利用 VLM 提取任务语义、生成图像编辑提示和视频生成提示，通过图像编辑模型和视频生成模型合成人类视频，并用 VLM 进行语义/物理质量筛选。
  - **任务级平衡采样**：对公开机器人视频-动作预训练数据集按任务重新分区并限制每任务的采样数量，得到 Task-diverse VA（~400K 轨迹/epoch，>6K 任务），防止少量任务的重复遥操作主导预训练。
  - **MoT 因果视频-动作架构**：基于 Wan-2.2-TI2V-5B 改造，视频 Transformer 与动作 Transformer 参数分离但通过共享注意力交互；动作预测以预测的未来机器人视频为条件，构成逆动力学。
  - **高度轴 RoPE offset**：在人类视频与机器人视频共享 VAE 隐空间的前提下，通过高度轴坐标偏移区分人类视频 token 与机器人视频 token，避免表示混淆。
  - **IFP 防捷径机制**： auxiliary 分支从当前机器人视频表示预测 K=4 个跨步未来视频块，且不直接接收人类视频输入，迫使主视频分支将人类视频的任务信息编码进当前表示。

### 与现有方法对比

- **vs LingBot-VA**: Zero-WAM 直接继承并扩展了 LingBot-VA 的因果视频-动作框架（MoT、自回归流匹配），但额外引入人类视频 ICL 接口、HumanGen 数据和 IFP 目标，专门解决跨任务泛化。
- **vs VLA 模型 (π0.5, OpenVLA, RT-X)**: VLA 把世界建模作为语言-动作模型的隐式能力，Zero-WAM 显式把未来视频生成作为中间表示，动作作为未来视频的逆动力学解码，更符合“生成式世界模型”思路。
- **vs 传统人类视频提示方法 (BC-Z, Vid2Robot)**: 这些方法依赖人工收集的人类视频或任务覆盖有限，Zero-WAM 通过自动生成流程实现任务多样性三个数量级的扩展。
- **vs WAM-TTT / RoboTTT**: 后者需要在测试时进行轻量微调或记忆更新，Zero-WAM 与之形成鲜明对比，强调纯 in-context 零样本，不更新任何参数。
- **vs DreamZero (WAM)**: 同为 2026 年的 WAM 零样本策略工作，DreamZero 强调视觉域迁移，Zero-WAM 强调跨任务迁移。

### 关键洞察

最有价值的创新是**把 LLM 的 in-context learning 范式真正迁移到机器人操纵**，并解决了两个关键瓶颈：**数据**和**模型使用提示的意愿**。作者敏锐地指出：人类视频是比语言更自然的操纵任务规格，因为语言难以表达空间布局、中间状态和时序；但人类视频的稀缺性限制了此前方法。HumanGen 通过“机器人→人类”的生成式转换，把已有机器人轨迹自动转换成语义一致的人类视频，从而把任务覆盖从几十/几百扩展到 8.6K。

同样重要的是 **IFP（In-Context Future Chunk Prediction）**。作者发现，在训练任务上，模型仅凭机器人历史就能预测下一帧，于是会走“捷径”而忽略人类视频提示。IFP 通过让模型从当前表示预测多个跨步未来视频块，并且 auxiliary 分支不直接读人类视频，迫使主分支必须把人类视频中的任务演化信息编码进当前机器人视频表示。消融显示加上 IFP 后平均成功率从 28.55% 提升到 46.95%。

### 技术细节

- **数据构造 HumanGen**:
  - Task-diverse VA: AgiBot, InternData-A1, OXE, RoboCOIN, RoboMIND 等按任务级采样，>6K 任务，~400K 轨迹/epoch。
  - 人类视频生成流程: VLM 任务分析 → 首帧图像编辑（Nano Banana 2 / Qwen-Image-2.0）→ 视频生成（Wan 2.7 / Kling AI 3.0）→ VLM 语义+物理质量筛选。
  - HumanGen 子集: Pre-train ICL (External) 41,188 对 / 5,062 任务；Pre-train ICL (In-house) 30,247 对 / 3,522 任务；Simulation ICL 2,500 对 / 50 任务；Real-world ICL 252 对。
- **模型架构**:
  - 基于 Wan-2.2-TI2V-5B 改造为因果视频-动作模型。
  - 视频 Transformer: dv=3072，30 层；动作 Transformer: da=3072，MoT 共享注意力、独立 QKV/FFN/输出头。
  - 序列组织: `[human video tokens, robot video tokens, action tokens]`。
  - RoPE 高度轴偏移 ΔH=32 区分人类视频与机器人视频 token。
- **训练目标**:
  - 流匹配视频损失 L_fm（下一机器人视频块）+ 流匹配动作损失 L_a（下一动作块）+ IFP 损失 L_ifp（K=4, stride=2, 权重 0.5/0.25/0.15/0.15）。
  - ICL 样本: c={h,ℓ}，非 ICL: c=ℓ。
  - 预训练 Task-diverse VA : HumanGen = 1:5；语言 dropout 非 ICL 0.1，ICL 中提升到 0.4，人类视频 dropout 0.1。
  - 预训练 15,360 GPU 小时；Post-train 64 GPUs × 4,000 steps，采样比 Task-diverse VA : HumanGen : RoboTwin = 2:10:3。

### 实验结果深度分析

- **RoboTwin 2.0 仿真（7 个 unseen 任务）**:
  - Zero-WAM: 46.95% 平均成功率
  - LingBot-VA: 17.45%
  - WAN-Action: 10.98%
  - Zero-WAM 比 LingBot-VA 提升 +29.50 pp，在所有 7 个任务上均更优。
  - 最大增益来自需要推断未见过动态的任务：open microwave (59.0% vs 29.3%)、stamp seal (47.0% vs 3.7%)、move stapler to pad (69.1% vs 23.3%)。
  - 最难任务 stack blocks three 仍仅 9.0%，但已是唯一非零的方法。
- **真实世界 Franka 实验**:
  - Object-to-container placement: 53.3% vs LingBot-VA 43.3%
  - Three-object sequential manipulation: 33.3% vs 10.0%
  - Two-table-leg insertion: 16.7% vs 0.0%
  - 长程和细粒度任务上人类视频提示优势最明显。
- **消融实验**:
  - 人类视频提示效果（仅 43 seen 任务训练）: 加人类视频从 10.98% → 36.36%，超过 LingBot-VA 的 17.45%。
  - IFP 效果: 28.55% → 46.95%；在 stack blocks three 上从 0% → 9%。
  - 任务平衡数据效果（text-only Zero-WAM vs LingBot-VA）: 39.44% vs 17.45%，+21.99 pp，说明公开数据集原始分布严重冗余。

### 存在的不足/局限性

1. **真实世界成功率仍有限**：最高 53.3%，细粒度插入 16.7%，执行精度仍受机器人控制和感知误差限制。
2. **长程任务仍是瓶颈**：仿真 stack blocks three 仅 9%，真实 three-object sequential 33.3%。
3. **人类视频生成依赖商用模型**：Gemini 3.1 Pro、Wan 2.7、Kling AI 3.0 等，可复现性和规模化可能受限。
4. **未显式建模物理/接触**：视频生成损失不保证物理一致性，精细插入仍是弱项。
5. **未见过的 embodiment 泛化未验证**：只在桌面双臂/单臂 setup 上测试。
6. **评估任务数量有限**：仿真 7 个 unseen 任务，真实 3 个任务族，统计可靠性有限。
7. **语言 vs 人类视频的系统对比不够**：真实实验中接口与模型双重差异，未完全隔离单一变量。

### 与已有知识的关联

- **LingBot-VA / LingBot-VA-2**: Zero-WAM 的架构基础，直接继承 MoT 因果视频-动作框架。
- **Next Forcing**: IFP 的多块未来预测灵感来源，Zero-WAM 将其改造为“防人类视频提示被忽略”的 ICL 机制。
- **BC-Z / Vid2Robot**: 早期使用人类视频作为任务提示的工作，但依赖手动收集。
- **AGNOSTOS**: 指出 VLA 在跨任务泛化上的失败，Zero-WAM 提供了一条不依赖测试时机器人轨迹的替代路径。
- **WAM-TTT / RoboTTT**: 需要测试时更新记忆/权重，Zero-WAM 强调纯 in-context 零样本。
- **EgoWAM**: 同样探索 ego 人类视频与世界模型的结合，但 Zero-WAM 更强调自动生成的人类-机器人 ICL 配对和跨任务泛化。

### 开放问题/局限性

1. 当人类视频与机器人 embodiment 差异极大时，任务语义传递的边界在哪里？
2. 如何自动评估生成人类视频的“可操作性”？
3. IFP 是否依赖训练任务与测试任务有足够共享的子目标？完全不重叠时是否仍有效？
4. 视频生成的计算成本如何压缩到实时控制？
5. 语言与人类视频如何互补？当前两种模式互相独立。
6. 长程 rollout 中视频生成误差的累积如何缓解？是否需要显式 replanning？

### 对研究工作的启示

- **长程任务**: IFP 强制编码“未来演化”的做法可直接借鉴，但 stack blocks three 仍低，提示仅靠视频块预测难以解决长程依赖，可能需要显式分层规划。
- **泛化性/家庭场景**: 人类视频示范是家庭环境中最自然的任务 teaching 方式，自动生成人类视频的数据飞轮对家庭场景尤其实用。
- **直接可试**:
  - 在 VLA/WAM 训练中加入跨步未来预测辅助损失，抑制模型忽略任务条件。
  - 按任务而非轨迹频率采样现有机器人数据集，可能在不增加数据量的情况下提升泛化。
  - 在机械臂 SDK 上部署“人类视频→机器人动作”接口，先用合成视频 post-train，再测试真实人类视频。
  - 用 RoPE offset 区分不同来源的视频 token，避免表示混淆。

---
*分析完成日期: 2026-09-02*
*内容来源: arXiv PDF 全文*
