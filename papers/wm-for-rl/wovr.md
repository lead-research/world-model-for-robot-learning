# WoVR: World Models as Reliable Simulators for Post-Training VLA Policies with RL

- **Venue**: arXiv'26.02
- **arXiv**: [2602.13977](https://arxiv.org/abs/2602.13977)
- **Code**: [GitHub](https://github.com/RLinf/RLinf)
- **Category**: World Model for RL

## Core Problem
How to handle hallucination and long-horizon error accumulation in closed-loop imagined rollouts, making world models reliable RL simulators?

## Core Method
WoVR — three mechanisms: (1) controllable action-conditioned video world model improves rollout stability, (2) Keyframe-Initialized Rollouts reduce effective error depth, (3) World Model-Policy co-evolution maintains alignment.

## Key Characteristics
- Explicit hallucination control: doesn't assume perfect world model, actively regulates RL interaction with imperfect dynamics
- Keyframe-Initialized Rollouts: use keyframes to reset and reduce long-horizon error accumulation
- Co-evolution: world model and policy evolve together, maintaining alignment
- Significant performance gains: LIBERO +29.3 points, real robot +30.0 points

## Key Insight
World model hallucination is not a "bug" but a "feature" — if hallucination patterns can be controlled, it becomes manageable in RL. WoVR's core is "accept imperfection, manage imperfection," rather than pursuing perfect world models.

## Technical Details
- **Architecture**: Controllable action-conditioned video world model + VLA policy + Keyframe mechanism + co-evolution
- **Controllable world model**: Improves rollout stability, reduces random hallucinations
- **Keyframe-Initialized Rollouts**: Reset rollouts with keyframes, limiting error accumulation depth
- **Co-evolution**: Alternating world model and policy updates, maintaining mutual adaptation
- **Key design**: Triple mechanism jointly controls hallucination

## Experimental Results
- LIBERO: average success rate from 39.95% to 69.2% (+29.3 points)
- Real robot: from 61.7% to 91.7% (+30.0 points)
- Long-horizon stability: achieves stable long-horizon imagined rollouts
- Key ablation: three mechanisms each contribute, joint effect strongest

## Limitations
- Keyframe-Initialized Rollouts requires keyframe strategy design
- Co-evolution may introduce system instability
- "Controllability" of controllable world model has upper limits
- Only validated on LIBERO and real robot manipulation tasks

## Connection to Prior Work
- Shares "co-evolution" concept with World-VLA-Loop
- Related to keyframe-based video generation (e.g., TesserAct)
- Related to world model error control (e.g., TD-MPC2 robustness design)

## Implications for Our Research
- **Long-horizon**: Keyframe-Initialized Rollouts is key for long-horizon tasks — regularly reset to reduce error accumulation. Can combine subgoals as keyframes.
- **Home scenes**: World model hallucination more common in home scenes (e.g., object occlusion, lighting changes). WoVR's explicit control mechanism particularly valuable.
- **Directly testable**: Can implement WoVR's three mechanisms in lab: controllable world model (use conditional video diffusion), Keyframe Rollouts (reset with keyframes), co-evolution (alternately update world model and policy).
