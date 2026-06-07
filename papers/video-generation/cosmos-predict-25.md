# Cosmos Predict 2.5

> Cosmos Predict 2.5: A Suite of Diffusion-based World Foundation Models
> Venue: Tech Report'25.10

---

## 基本信息

- **arXiv**: https://arxiv.org/abs/2511.00062
- **Code**: https://github.com/nvidia-cosmos/cosmos-predict2.5
- **Project**: https://research.nvidia.com/labs/cosmos-lab/cosmos-predict2.5/
- **HuggingFace**: https://huggingface.co/collections/nvidia/cosmos-predict25-68bb63255f2fc206c5e5b346
- **分类**: World Models for Video Generation

## 核心问题

如何构建一个统一的高质量世界基础模型，同时支持Text2World、Image2World、Video2World，并在机器人、自动驾驶等Physical AI领域高效后训练？

## 核心方法

基于Rectified Flow的扩散模型，统一Text2World/I2V/V2V。使用Cosmos-Reason1（Physical AI推理VLM）作为文本编码器。改进数据管线：2亿高质量预训练视频clip+后训练数据。采用模型合并（model merging）和新型RL算法进行后训练质量提升。提供2B和14B两种规模，以及多领域专用模型（自动驾驶多视角、机器人多视角、机器人动作条件、机器人策略等）。

## 主要特点

- 统一能力：单模型支持Text2World、Image2World、Video2World
- Cosmos-Reason1文本编码：利用VLM的物理推理能力增强文本条件化
- 大规模高质量数据：2亿预训练clip，数据管线有改进
- 多领域专用模型：auto/multiview（7摄像头自动驾驶）、robot/multiview（3摄像头操作）、robot/action-cond（动作条件）、robot/policy（策略后训练）
- 与Cosmos-Transfer2.5联合：ControlNet风格模型用于sim2real/real2real

## 技术细节

- 架构：Rectified Flow + UniPC solver
- 模型规模：2B（实时推理）和14B（最高质量）
- 文本编码器：Cosmos-Reason1（Physical AI VLM）
- 数据：2亿高质量预训练clip，覆盖物理AI各领域
- 后训练技术：Model Merging + RL-based quality boost
- 机器人专用模型：
  - robot/multiview-basic: 3视角，trans err 0.08, rot err 0.20 rad, sampson err 19.73px
  - robot/action-cond: PSNR 24.95, SSIM 0.85, Latent L2 0.28, FVD 146（优于Cosmos1-7B的PSNR 21.14/SSIM 0.82/FVD 190）
- 开源：Apache 2 license代码 + NVIDIA Open Model License模型权重

## 实验结果

- PAI-Bench Text2World: Predict2.5-2B post-train Overall 0.768，与Wan2.2-A14B（0.769）接近，但模型小7倍
- PAI-Bench Image2World: Predict2.5-2B post-train Overall 0.810，超越Wan2.2-5B（0.804）
- 自动驾驶多视角：FVD StyleGAN从63.7→23.1（vs Predict1），FID 25.3→12.1，显著提升
- 机器人动作条件：相比Cosmos1-7B，PSNR↑18%，SSIM↑3.7%，FVD↓23%
- VLA训练：Cosmos2.5-sft在Object/Behavior/Env维度上全面优于Hunyuan/CogVideoX/WAN，GPT-4o评估Object达91.8%（vs Hunyuan 38%）

## 局限性

- 2B模型在某些复杂物理场景仍不如14B模型
- 2B模型与Wan2.2-A14B接近但仍有差距，质量-效率权衡仍存在
- 模型合并和RL后训练的细节未充分公开，难以复现
- 已转向Cosmos 3（NVIDIA下一代平台），Predict2.5不再积极开发

## 对研究工作的启示

- **长程任务**: 多视角模型（multiview）对长程任务中的遮挡和视角变化很重要，可直接借鉴
- **泛化性/家庭场景**: 2B模型的高效性使其可能部署在边缘设备（如机器人 onboard GPU），家庭场景实用性高
- **直接可试**: Cosmos Predict 2.5的开源推理+LoRA后训练管道可直接用于生成家庭场景操作数据，Cosmos Cookbook提供完整recipe
