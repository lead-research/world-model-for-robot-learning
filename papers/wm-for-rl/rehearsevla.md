# RehearseVLA: Simulated Post-Training for VLAs with Physically-Consistent World Model

- **Venue**: CVPR'26
- **arXiv**: Shared with World-Env (2509.24948) — likely extended version or closely related work
- **Category**: World Model for RL

## Core Problem
How to provide a safe simulated post-training environment for VLA using physically-consistent world models?

## Core Method
Based on World-Env framework, using physically-consistent world simulator to generate temporally consistent future visual observations for VLA simulated post-training.

## Key Characteristics
- Physical consistency: world model maintains temporal consistency and physical plausibility
- Simulated post-training: safely explore VLA strategies in world model
- Related to World-Env: likely extension or conference version emphasizing physical consistency

## Key Insight
Physical consistency is the core requirement for world models as simulators — if generated video is not physically consistent, policies learned in simulation cannot transfer to real world.

## Technical Details
- **Architecture**: Physically-consistent video diffusion world model + VLA policy
- **Physical consistency mechanisms**: Object continuity, motion consistency, contact constraints
- **Training**: Generate rollouts in world model, VLA policy optimization

## Experimental Results
- Similar to World-Env, validated on LIBERO benchmarks
- Emphasizes importance of physical consistency for policy transfer

## Limitations
- Shared with World-Env: world model generation quality, VLM rewards, etc.
- Physical consistency challenges in complex contact scenarios

## Connection to Prior Work
- Directly related to World-Env (possibly same work in different version)
- Related to PhysWorld, IRASim and other physically-consistent video generation models

## Implications for Our Research
- **Long-horizon**: Physical consistency more critical in long-horizon tasks — error accumulation breaks physical rules.
- **Home scenes**: Physical consistency in home scenes (objects don't disappear, gravity is reasonable) is fundamental requirement.
- **Directly testable**: When trying in lab, ensure world model maintains physical consistency — object continuity, reasonable kinematics.
