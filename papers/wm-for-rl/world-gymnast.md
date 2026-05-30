# World-Gymnast: Training Robots with RL in a World Model

- **Venue**: arXiv'26.02
- **arXiv**: [2602.02454](https://arxiv.org/abs/2602.02454)
- **Code**: [GitHub](https://github.com/world-gymnast/world-gymnast)
- **Project**: [https://world-gymnast.github.io/](https://world-gymnast.github.io/)
- **Category**: World Model for RL

## Core Problem
Is training VLA policies in a world model more effective than supervised learning or software simulators?

## Core Method
World-Gymnast — rollout VLA policy in action-conditioned video world model, use VLM rewards, perform RL fine-tuning.

## Key Characteristics
- vs SFT: outperforms SFT by 18x on Bridge robot
- vs software simulators: outperforms software simulators (Mujoco etc.) by 2x
- Diverse language instructions: can train on diverse language instructions in world model
- Test-time training: can perform test-time training in world model for new scenes
- Online iterative improvement: alternating world model and policy improvement

## Key Insight
Software simulators (Mujoco/Gazebo) require hand-engineered physics and scenes, while data-driven world models learn from real videos — this avoids sim-to-real gap and includes real-world visual complexity (textures, lighting, object diversity) that software simulators cannot match.

## Technical Details
- **Architecture**: Action-conditioned video world model + VLA policy + VLM reward
- **Training**: World model pre-training → VLA RL fine-tuning in world model → deploy to real world
- **Test-time training**: Quick policy training in world model for new scenes
- **Online iteration**: Alternating world model and policy improvement
- **Key design**: VLM provides rewards, no hand-engineered reward design needed

## Experimental Results
- Bridge robot: outperforms SFT 18x, outperforms software simulator 2x
- Diverse language instructions: effective training in world model
- Test-time training: effective performance improvement for new scenes
- Online iteration: continuous improvement from alternating world model and policy updates

## Limitations
- World model generalization limits trainable task diversity
- VLM reward reliability issues
- Online iteration requires alternating world model and policy updates, system complexity
- Only validated on Bridge dataset, other robot platforms not tested

## Connection to Prior Work
- Shares "world model + VLM reward" framework with World-Env, VLA-RFT, WoVR
- Contrast with software simulators (Mujoco/Gazebo) — paradigm shift from artificial to data-driven simulation
- Related to test-time training, a new direction in 2026

## Implications for Our Research
- **Long-horizon**: Test-time training particularly valuable for long-horizon tasks — can quickly adapt when encountering new scenes in long-horizon tasks.
- **Home scenes**: World-Gymnast's 18x improvement over SFT shows huge potential of world model RL for home scenes — home scenes are data-scarce, SFT performs poorly, world model RL can significantly improve.
- **Directly testable**: Reproduce World-Gymnast on Bridge dataset (open source) to validate world model + VLM reward effects. Then transfer to lab scenes.
