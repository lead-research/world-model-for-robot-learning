# GigaBrain-0.5M: a VLA That Learns From World Model-Based RL

- **Venue**: arXiv'26.02
- **arXiv**: [2602.12099](https://arxiv.org/abs/2602.12099)
- **Code**: [GitHub](https://github.com/open-gigaai/giga-brain-0)
- **Project**: [https://gigabrain05m.github.io/](https://gigabrain05m.github.io/)
- **Category**: World Model for RL

## Core Problem
How to leverage web-scale video world model's spatiotemporal reasoning to enhance VLA learning?

## Core Method
GigaBrain-0.5M* — based on GigaBrain-0.5 (pre-trained on 10,000+ hours of robotic manipulation data), integrates world model-based RL via RAMP (Reinforcement leArning via world Model-conditioned Policy) for cross-task adaptation.

## Key Characteristics
- Large-scale pre-training: GigaBrain-0.5 trained on 10,000+ hours robot data, currently ranks first on RoboChallenge benchmark
- RAMP: world model-conditioned RL enabling cross-task adaptation
- Video world model: leverages web-scale video pre-training's spatiotemporal reasoning
- Multi-step action prediction: directly predicts multi-step action chunks

## Key Insight
Web-scale video pre-training gives world models powerful spatiotemporal reasoning — this capability directly transfers to robot manipulation, enabling world models to predict future outcomes of complex manipulation sequences, providing high-quality rollout environments for RL.

## Technical Details
- **Architecture**: GigaBrain-0.5 (large-scale VLA) + RAMP (world model-conditioned RL)
- **Pre-training**: 10,000+ hours of robotic manipulation data
- **RAMP**: world model-conditioned RL policy, using world model predictions to guide policy optimization
- **Cross-task adaptation**: RAMP enables cross-task generalization
- **Key design**: synergy of large-scale pre-training + world model RL

## Experimental Results
- RoboChallenge benchmark: currently ranks first (intermediate version)
- Difficult tasks: ~30% improvement on Laundry Folding, Box Packing, Espresso Prep, etc.
- Compared to RECAP baseline: significant improvement

## Limitations
- 10,000+ hours data collection cost extremely high
- Large-scale pre-training computational overhead huge
- RAMP specific mechanism not detailed enough in abstract
- Limited open-source, difficult to reproduce

## Connection to Prior Work
- Shares pre-training thinking with large-scale VLA (GR-2, InternVLA-A1)
- Related to web-scale video pre-training (Cosmos, GigaWorld-0)
- RAMP represents integration direction of this field

## Implications for Our Research
- **Long-horizon**: GigaBrain-0.5M* improves 30% on Laundry Folding, Box Packing and other long-horizon tasks, showing world model RL's particular value for long-horizon tasks.
- **Home scenes**: 10,000 hours of data unrealistic for home scenes, but RAMP's cross-task adaptation thinking can be borrowed — achieve similar effects with small-scale data + world model RL.
- **Directly testable**: If unable to reproduce full GigaBrain-0.5M* system, can try RAMP's core concept: use pretrained video model as world model, RL optimize VLA on top. Key is world model conditioning mechanism.
