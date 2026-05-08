# UD-VLA — Unified Diffusion VLA [ICLR'26]

> **arXiv**: [2511.01718](https://arxiv.org/abs/2511.01718)  
> **Code**: [GitHub](https://github.com/OpenHelix-Team/Unified-Diffusion-VLA)  
> **Project**: [Website](https://irpn-eai.github.io/UD-VLA.github.io/)  
> **Authors**: Jiayi Chen et al. (OpenHelix Team)

---

## 核心问题

如何让多模态（理解、生成、动作）真正协同，而非各自为政？

---

## 核心方法

UD-VLA 提出 **JD3P (Joint Discrete Denoising Diffusion Process)**：

1. **统一token化空间**: 所有模态（图像、语言、动作）映射到同一离散token空间
2. **联合扩散过程**: 单条去噪轨迹同时处理所有模态，迭代优化中动作在视觉引导下演化
3. **混合注意力机制**: 跨模态注意力实现理解与生成/动作的内在协同
4. **两阶段训练**: 预训练 + 微调，优化性能和效率

### 关键洞察

> **同步去噪哲学**: 不是分别生成视频和动作，而是在同一条去噪轨迹中，让动作在持续的视觉引导下逐步演化。这种"共生"关系让理解和生成真正协同。

---

## 实验结果

- **CALVIN, LIBERO, SimplerEnv**: SOTA性能
- **推理速度**: 比自回归方法 **4x 更快**
- **真实世界评估**: 有效

---

## 与已有工作的对比

| 维度 | UD-VLA | VideoVLA | UVA | UWM |
|------|--------|----------|-----|-----|
| 统一机制 | **联合扩散轨迹** | 联合DiT | 联合隐空间 | 耦合扩散 |
| Token化 | **统一离散token** | 连续latent+动作 | 连续 | 连续 |
| 速度 | **4x faster than AR** | 50步DDIM | 快 | 中等 |
| 注意力 | 混合注意力 | 纯自注意力 | Transformer | Transformer |

---

## 局限性

1. 论文详细实验数字未完整获取（摘要描述），需补充
2. "统一token化"的具体实现（离散化方法）未详述
3. 4x快是相对于自回归方法，与扩散方法的对比未明确

---

## 对研究工作的启示

- **离散token统一**: 值得探索是否比连续表示更适合多模态融合
- **速度优势**: 如果确实4x更快，对实时部署很有价值
- **开源代码**: GitHub已开源，可直接复现

---

*笔记整理: 2026-05-08*  
*分类: Single-backbone Policies*
