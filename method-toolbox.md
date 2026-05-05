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

### JEPA 风格 (VLA-JEPA 范式)
```python
# 核心: leakage-free state prediction
# student 只看到当前观测，target encoder 编码未来帧
# 预测在隐空间而非像素空间
student_rep = student_encoder(current_obs)
predicted_future = predictor(student_rep)
target_rep = target_encoder(future_obs)  # no grad, EMA updated
loss = mse(predicted_future, target_rep)
```

### 视频预测 backbone
- (待填充)

### 动作-视频联合建模
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

### JEPA 训练技巧
```python
# VLA-JEPA 关键: target encoder 不参与梯度
# 防止信息泄漏，确保学到真正的预测而非复制
target_encoder.requires_grad = False
# 通过 EMA 从 student 缓慢更新
θ_target ← ρ * θ_target + (1-ρ) * θ_student
```

---

## 可复用组件

| 组件 | 来源 | 用途 |
|------|------|------|
| Q-former | FLIC/BLIP | 压缩 VL tokens 到固定数量 |
| DiT + cross-attention | GR00T N1 | VLA policy backbone |
| SigLIP-2 | Google | 高质量 vision-language 编码 |
| REPA alignment | Seedream | 扩散模型表征对齐 |
| JEPA predictor | LeCun/Meta | 隐空间未来预测 |

---

*持续更新*
