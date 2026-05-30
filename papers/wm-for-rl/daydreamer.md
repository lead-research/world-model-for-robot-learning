# DayDreamer: World Models for Physical Robot Learning

- **Venue**: CoRL'23
- **arXiv**: [2206.14176](https://arxiv.org/abs/2206.14176)
- **Project**: [https://danijar.com/daydreamer](https://danijar.com/daydreamer)
- **Category**: World Model for RL

## Core Problem
Can Dreamer algorithm learn online directly on physical robots without simulators, avoiding the sim-to-real gap?

## Core Method
Deploy Dreamer world model (RSSM) to 4 physical robots for online learning in the real world without simulators or resets. Plan inside the learned world model to reduce real-world trial-and-error.

## Key Characteristics
- RSSM-based planning instead of real-world trial-and-error, dramatically reducing physical interactions
- Same hyperparameters across 4 different robots (quadruped, two robotic arms, wheeled robot)
- Online adaptation: quadruped recovers from being pushed within 10 minutes
- Learns purely from camera images and sparse rewards

## Key Insight
Planning in a world model is a viable path for physical robot learning — quadruped learns to stand and walk from scratch in 1 hour, which is impossible with pure RL.

## Technical Details
- **Architecture**: RSSM (Recurrent State-Space Model) — deterministic path + stochastic state
- **Training**: Online data collection → train world model → imagine rollouts in latent space → Dreamer actor-critic optimization
- **Data requirement**: Extremely small — quadruped 1 hour, arms learn pick-and-place from images

## Experimental Results
- **Quadruped**: 1 hour from lying down → standing → walking; adapts to perturbations in 10 minutes
- **Robotic arms**: Pick-and-place from RGB images approaching human performance
- **Wheeled robot**: Goal navigation from camera images, automatically resolves orientation ambiguity

## Limitations
- Tasks are relatively simple (single skill, short-horizon)
- Long-horizon tasks and compositional skills not validated
- World model prediction accuracy may be limited in high-dimensional complex contact
- No language input, pure vision-action

## Connection to Prior Work
- Direct descendant of Dreamer (RSSM) — crossing from video games to physical robots
- Establishes the foundation for subsequent world model-based RL works (World-Env, DiWA, WMPO)

## Open Problems
- How to extend world models to long-horizon multi-step tasks?
- Can world models handle high-contact, deformable complex physical interactions?
- Potential for combining with VLA (DayDreamer lacks language interface)

## Implications for Our Research
- **Long-horizon**: World model-based planning naturally fits task decomposition, but DayDreamer only validated short-horizon skills. Needs HRL extension.
- **Home scenes**: Unstructured environments with many objects and contacts require stronger world model capabilities. Needs explicit object representations.
- **Directly testable**: RSSM architecture could be applied to our lab's Pallas/Piper arms for simple pick-and-place or push tasks.
