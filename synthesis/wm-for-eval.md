# 📏 World Model for Evaluation 综述

> 分类: 📏 World Model for Evaluation
> 完成日期: 2026-05-31
> 论文数: 10
> 状态: ✅ 已完成

---

## 一句话总结这个方向

**世界模型作为真实环境的可扩展、可复现代理，用于机器人策略的评估、排名和改进。** 核心共识：物理测试昂贵且危险，视频世界模型提供了快速、安全、可并行的评估替代方案。

---

## 技术演化全景

```
2024: TD-MPC2 — 隐式世界模型在连续控制中的规模化验证（317M参数，80任务）
   ↓
2025.05: WorldEval — Policy2Vec将视频生成模型转化为世界模拟器（评估起点）
   ↓
2025.06: WorldGym — 自回归视频模型作为策略评估环境，VLM奖励评估
   ↓
2025.09: Scalable Policy Evaluation — 预训练视频模型+动作注入，无需大规模配对数据
   ↓
2025.11: GPC — 推理时世界模型增强冻结策略（inference-time enhancement）
   ↓
2025.12: Evaluating Gemini Robotics — 前沿Veo模型用于全谱系评估（nominal + OOD + safety）
   ↓
2026.02: Horizon Imagination — 扩散世界模型的高效采样调度，半帧预算可行
   ↓
2026.03: DreamPlan — 视频世界模型中的VLM规划器RL微调，无需物理交互
   ↓
2026.03: V-JEPA 2.1 — Dense视频表示学习，机器人抓取提升20点
```

---

## 方法分类

### 按"评估目标"

| 子类型 | 代表 | 评估什么 | 特点 |
|--------|------|---------|------|
| **策略排名** | WorldGym, WorldEval | 不同策略的相对性能 | 保持排名一致性 |
| **检查点评估** | WorldEval | 单一策略不同训练阶段 | 选择最优检查点 |
| **OOD泛化** | Evaluating Gemini Robotics | 新物体/背景/干扰 | 多轴场景编辑 |
| **安全检查** | Evaluating Gemini Robotics | 危险动作/安全违规 | Red teaming |
| **推理增强** | GPC | 冻结策略的实时增强 | 无需重训练 |
| **规划器微调** | DreamPlan | VLM规划器在虚拟环境中RL | 无物理rollout |

### 按"世界模型类型"

| 类型 | 代表 | 特点 |
|------|------|------|
| **自回归视频** | WorldGym | 高真实感，推理慢 |
| **动作条件视频** | WorldEval, Scalable Policy Evaluation | 精确动作跟随 |
| **前沿视频模型** | Evaluating Gemini Robotics | 最高质量，闭源 |
| **扩散模型** | Horizon Imagination | 高保真，调度优化 |
| **隐式世界模型** | TD-MPC2 | 无解码器，高效 |
| **Dense表示** | V-JEPA 2.1 | 像素级理解，机器人应用 |

---

## 共同发现 / 共识

1. **世界模型与真实性能强相关**：多篇论文独立验证，世界模型评估与真实世界成功率高度相关（WorldGym、WorldEval、Gemini Robotics）
2. **VLM评估是标配**：使用VLM对生成视频进行奖励评估成为主流（WorldGym、Evaluating Gemini Robotics）
3. **预训练视频模型可转化**：预训练视频生成模型（如SVD、Veo）通过动作注入可转化为世界模拟器（Scalable Policy Evaluation、Evaluating Gemini Robotics）
4. **推理时增强有价值**：GPC证明世界模型在推理时的轻量级规划可以显著提升策略性能，无需重训练
5. **次优数据足够**：DreamPlan证明次优探索数据足以训练高质量视频世界模型，降低数据门槛

---

## 关键分歧 / 开放问题

| 分歧点 | 阵营A | 阵营B | 尚未解决 |
|--------|-------|-------|---------|
| **专用模型 vs 前沿模型** | WorldGym/WorldEval: 自训练专用模型 | Gemini Robotics: 前沿Veo模型 | 成本-质量权衡？ |
| **评估 vs 改进** | WorldGym/WorldEval: 纯评估 | GPC/DreamPlan: 评估+改进 | 改进的上限？ |
| **自回归 vs 扩散** | WorldGym: 自回归 | Horizon Imagination: 扩散 | 哪种更适合评估？ |
| **VLM奖励 vs 内置奖励** | WorldGym: VLM外置 | V-JEPA 2.1: 表示质量直接决定 | 哪种更可靠？ |
| **在线 vs 离线** | TD-MPC2: 在线学习 | DreamPlan: 离线虚拟RL | 数据效率vs实时性？ |
| **Dense vs 全局** | V-JEPA 2.1: Dense特征 | 其他: 全局视频生成 | 哪种对评估更有价值？ |

---

## 对后续分类的启示

### World Model for Evaluation → Video Generation
- 视频生成模型本身就是评估基础设施的核心组件
- **关键问题**：Video Generation方向的25篇论文中，哪些模型可以直接用于评估？（如Ctrl-World、TesserAct等）

### World Model for Evaluation → Benchmarks
- 评估需要benchmark来验证可靠性
- **关键问题**：WorldSimBench、EVA-Bench等如何与这些评估方法协同？

---

## 技术工具箱（可复用方法）

| 方法 | 来源 | 适用场景 |
|------|------|---------|
| Policy2Vec | WorldEval | 将视频生成模型转化为动作跟随模拟器 |
| 自回归视频评估 | WorldGym | 策略成功率评估，VLM奖励打分 |
| 动作条件注入 | Scalable Policy Evaluation | 预训练视频模型转化为世界模型 |
| 多轴场景编辑 | Evaluating Gemini Robotics | OOD泛化评估，系统生成场景变体 |
| 推理时前视规划 | GPC | 冻结策略的实时增强 |
| ORPO虚拟RL | DreamPlan | VLM规划器在视频世界模型中RL微调 |
| 采样调度优化 | Horizon Imagination | 扩散世界模型的效率优化 |
| Dense视频表示 | V-JEPA 2.1 | 高质量视觉表示用于下游评估 |
| 姿态条件记忆 | Ctrl-World | 长程一致性保持（多视图） |
| 帧级动作条件 | Ctrl-World | 精确动作控制（逐帧） |

---

## 研究机会（gaps）

1. **评估标准化**：尚无统一的评估协议和benchmark，不同论文使用不同指标和任务
2. **实时评估**：推理时评估（如GPC）的计算延迟对实时控制的影响尚未充分研究
3. **跨本体评估**：评估方法在不同机器人本体（单臂→双臂→人形）间的迁移性未知
4. **长程评估**：超过20步的轨迹评估一致性仍是挑战
5. **失败分析**：当前评估主要关注成功率排名，对失败原因的可解释分析不足
6. **家庭场景验证**：所有评估方法在实验室桌面验证，真实家庭场景的可靠性未知

---

*综述日期: 2026-05-31 | 作者: Lead*
