# 🧰 方法工具箱

> 收集各领域可复用的技巧、损失函数、架构模式、训练 trick

---

## 世界模型架构模式

### 隐空间对齐 (FLARE 范式)
```python
# 核心: future tokens 对齐未来观测嵌入
future_tokens = nn.Embedding(M, hidden_dim)
future_obs_embedding = target_encoder(future_obs)  # frozen/EMA
predicted = mlp(dit_outputs[:, -M:])
loss = -cosine_similarity(predicted, future_obs_embedding)
```

### 视频预测 backbone
- (待填充)

### JEPA / 隐空间预测
- (待填充)

---

## 训练技巧

### EMA Target更新
```python
# FLARE 的经验: ρ=0.995 最优
# ρ=1.0 (frozen) 仍有效
# ρ=0.99 (更新太快) 性能最差
θ_target ← ρ * θ_target + (1-ρ) * θ_policy
```

### Flow-matching 超参
```python
# 来自 π0, GR00T N1
τ ~ Beta((s-τ)/s; 1.5, 1), s=0.999
K = 4  # denoising steps
```

---

## 可复用组件

| 组件 | 来源 | 用途 |
|------|------|------|
| Q-former | FLIC/BLIP | 压缩 VL tokens 到固定数量 |
| DiT + cross-attention | GR00T N1 | VLA policy backbone |
| SigLIP-2 | Google | 高质量 vision-language 编码 |
| REPA alignment | Seedream | 扩散模型表征对齐 |

---

*持续更新*
