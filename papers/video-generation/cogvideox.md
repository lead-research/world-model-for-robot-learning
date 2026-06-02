# CogVideoX

> **Text-to-Video Diffusion Models with An Expert Transformer**  
> ICLR'25 | arXiv:2408.06072 | [Code](https://github.com/THUDM/CogVideo)

---

## 核心问题

如何生成长时长、高分辨率、运动幅度大、文本对齐准确的视频？

## 核心方法

基于Diffusion Transformer的text-to-video生成模型，包含3D Causal VAE、Expert Transformer（专家自适应LayerNorm）、渐进训练和多分辨率帧打包技术。

## 主要特点

- **3D Causal VAE**: 沿空间和时间维度压缩视频，提高压缩率和保真度
- **Expert Transformer**: 专家自适应LayerNorm促进文本与视频模态的深度融合
- **渐进训练**: 从低分辨率到高分辨率逐步训练
- **多分辨率帧打包**: 支持不同形状视频生成
- **长时长**: 10秒、16fps、768×1360分辨率
- **SOTA**: 在机器指标和人工评估中均达到SOTA

## 与机器人领域的关系

虽然CogVideoX是通用视频生成模型，但它为机器人世界模型提供了关键基座能力：
- 高质量视频生成可作为世界模型的decoder基础
- 文本条件能力可用于指令遵循的机器人任务
- 3D VAE的时空压缩技术可被机器人视频预测模型借鉴
- 开源模型权重可作为机器人世界模型预训练的初始化

## 局限性

- 非专门为机器人设计，缺乏物理一致性和动作条件控制
- 大规模DiT需要显著计算资源
- 作为纯视频模型，不保证物理合理性

## 对研究工作的启示

CogVideoX可作为机器人世界模型的预训练基座，在其基础上增加动作条件（如EnerVerse/EVAC的做法）。3D VAE的时空压缩技术可直接用于机器人视频预测模型。

---

*笔记日期: 2026-06-02*
