# VLAW: Iterative Co-Improvement of Vision-Language-Action Policy and World Model

- **Venue**: arXiv'26.02
- **arXiv**: [2602.12063](https://arxiv.org/abs/2602.12063)
- **Project**: [https://sites.google.com/view/vlaw-arxiv](https://sites.google.com/view/vlaw-arxiv)
- **Category**: World Model for RL

## Core Problem
Existing world models trained mainly on demonstration data lack coverage of failure cases. How to iteratively improve world model and VLA using real interaction data?

## Core Method
VLAW — iterative improvement algorithm: use real-world rollout data to improve world model fidelity, then use improved world model to generate synthetic data to boost VLA.

## Key Characteristics
- Real data-driven improvement: use real rollout data, not just demonstration data, to train world model
- Iterative co-improvement: alternating improvement of world model and VLA
- Synthetic data generation: improved world model generates supplemental synthetic data
- Real robot validation: significant improvement on real robots

## Key Insight
World model training data bias (only demonstration data) is its core limitation — demonstration data only covers successful trajectories, world models never see failures. Training world models with real rollouts (including failures) significantly improves their modeling of failure cases, generating more valuable synthetic data.

## Technical Details
- **Architecture**: World model (video generation) + VLA policy
- **Iterative process**: (1) Deploy current VLA to collect real rollouts → (2) Improve world model with real rollouts → (3) Generate synthetic data with improved world model → (4) Train VLA with synthetic data → repeat
- **Key design**: Real rollouts include failures, enriching world model training distribution
- **Synthetic data**: Improved world model generates supplemental data for VLA training

## Experimental Results
- Real robot: 39.2% absolute success rate improvement (over base policy)
- Synthetic data contribution: 11.6% improvement (from synthetic rollout data)
- Multi-task: effective on multiple downstream tasks

## Limitations
- Requires real robot rollout data, though less than pure RL, still requires physical interaction
- Iterative loop needs multiple rounds, each requiring real interaction, high time cost
- World model improvement speed may not keep up with policy changes
- Failure case collection may involve safety risks

## Connection to Prior Work
- Shares "iterative co-improvement" framework with World-VLA-Loop
- Shares "learning from interaction" with PlayWorld
- Descendant of DAgger and iterative learning algorithms

## Implications for Our Research
- **Long-horizon**: Iterative co-improvement particularly important for long-horizon tasks — long-horizon failure modes are more complex, requiring multiple rounds to fully cover.
- **Home scenes**: Home scenes have rich failure cases (collisions, drops, etc.), VLAW's iterative improvement can fully utilize these real failure data.
- **Directly testable**: Can implement VLAW loop in lab: deploy VLA → collect rollouts (success + failure) → improve world model → generate synthetic data → retrain VLA. Each round may need a few hours of real interaction.
