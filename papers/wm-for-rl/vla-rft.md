# VLA-RFT: Vision-Language-Action Reinforcement Fine-tuning with Verified Rewards in World Simulators

- **Venue**: arXiv'25.10
- **arXiv**: [2510.00406](https://arxiv.org/abs/2510.00406)
- **Code**: [GitHub](https://github.com/OpenHelix-Team/VLA-RFT)
- **Project**: [https://vla-rft.github.io/](https://vla-rft.github.io/)
- **Category**: World Model for RL

## Core Problem
How to provide efficient RL post-training for VLA using data-driven world models as controllable simulators, avoiding real-world interaction and sim-to-real gap?

## Core Method
VLA-RFT — train world model on real interaction data to predict future visual observations, perform policy rollouts in world model with trajectory-level dense rewards derived from goal-achieving references.

## Key Characteristics
- Data-driven world model: learned from real interaction data, not hand-engineered
- Trajectory-level dense rewards: efficient learning signal from goal achievement
- Extreme sample efficiency: <400 fine-tuning steps surpassing strong supervised baselines
- Perturbation robustness: stable task execution under disturbances

## Key Insight
The key to VLA post-training is "trustworthy reward signals" — trajectory-level goal-achievement rewards are more stable than per-step rewards, and combined with world model predicted future frames, form "verifiable" RL signals.

## Technical Details
- **Architecture**: World model (future visual prediction) + VLA policy + trajectory-level reward computation
- **Training**: Real interaction data pre-training → VLA RL fine-tuning in world model
- **Reward design**: Trajectory-level dense rewards from goal-achievement references
- **Key design**: Action-conditioned world model + goal reference comparison

## Experimental Results
- Sample efficiency: <400 steps surpassing strong supervised baselines
- Efficiency: more efficient than simulator-based RL
- Robustness: stable execution under perturbations

## Limitations
- World model prediction accuracy limits reward accuracy
- Trajectory-level rewards require predefined goal-achievement criteria
- Only manipulation tasks validated, long-horizon not tested
- World model training requires real interaction data (though less than RL)

## Connection to Prior Work
- Shares "world model as VLA post-training environment" with World-Env, WoVR
- Related to GRPO/RLHF: verified reward concept similar to reward models in RLHF
- Shares "data-driven world model" with DayDreamer

## Implications for Our Research
- **Long-horizon**: Trajectory-level rewards naturally fit long-horizon tasks — can use subgoal decomposition with trajectory-level rewards per subgoal.
- **Home scenes**: Goal-achievement standards in home scenes are often language-defined (e.g., "put cup on table"), aligning with VLA-RFT's reward design.
- **Directly testable**: VLA-RFT components are clear: world model + trajectory rewards. Can try with open-source VLA (e.g., OpenVLA) + custom world model. Rewards can use language-defined goal detection (VLM or hand-crafted rules).
