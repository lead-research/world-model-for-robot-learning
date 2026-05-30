# UniSim: Learning Interactive Real-World Simulators

- **Venue**: ICLR'24
- **arXiv**: [2310.06114](https://arxiv.org/abs/2310.06114)
- **Project**: [https://universal-simulator.github.io](https://universal-simulator.github.io)
- **Category**: World Model for RL

## Core Problem
Can we learn a universal real-world interaction simulator by orchestrating diverse heterogeneous datasets (images, videos, robot actions, navigation)?

## Core Method
Orchestrate different datasets through conditional video generation — each data source provides a different dimension of the world. Internet images provide object appearance, robot data provides dense actions, navigation data provides diverse movements.

## Key Characteristics
- Multi-dataset orchestration: images, video captions, human activities, robot data each contribute different aspects
- Supports both high-level ("open the drawer") and low-level ("move by Δx,Δy") control
- Zero-shot deployment: policies trained in simulator deploy directly to real world
- Generality: applicable to video captioning models, not just robotics

## Key Insight
Natural datasets are complementary along different dimensions — no single dataset covers all aspects of the world, but through conditional generation, we can piece together the "puzzle" into a complete world simulator.

## Technical Details
- **Architecture**: Conditional video diffusion model
- **Training**: Multi-dataset joint training with conditional/orchestration mechanisms
- **Condition inputs**: Text instructions, action vectors, initial frames
- **Output**: Future video frame sequences

## Experimental Results
- High-level policies: VLA policies trained in simulator deploy zero-shot to real world successfully
- Low-level policies: RL-trained policies in simulator deploy effectively to real world
- Video captioning: Models trained on simulated data also show benefits

## Limitations
- Video generation quality limits precise physical contact and deformation simulation
- Complex multi-dataset orchestration may introduce data conflicts
- Long-horizon temporal consistency challenges (general video generation problem)
- High computational cost for training universal simulator

## Connection to Prior Work
- Predecessor to large-scale video world models (Cosmos Predict, GigaWorld-0)
- Provides precedent for "world model as virtual environment" (World-Env, World4RL)
- Shared compositional thinking with RoboDreamer, DreMa

## Open Problems
- How to prevent "dilution" of each dataset's characteristics during multi-dataset fusion?
- How to ensure physical consistency (contact, gravity) in generated video?
- Sim-to-real transfer gap may still exist

## Implications for Our Research
- **Long-horizon**: Universal simulator can generate massive training data for long-horizon tasks at much lower cost than real-world collection.
- **Home scenes**: UniSim's approach — combining internet video + limited robot data — is especially valuable for data-scarce home scenarios.
- **Directly testable**: Could train a lab-scene-specific interactive simulator using similar ideas with internet videos + our own robot data.
