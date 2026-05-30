# DiWA: Diffusion Policy Adaptation with World Models

- **Venue**: CoRL'25
- **arXiv**: [2508.03645](https://arxiv.org/abs/2508.03645)
- **Code**: [https://diwa.cs.uni-freiburg.de](https://diwa.cs.uni-freiburg.de)
- **Category**: World Model for RL

## Core Problem
How to fine-tune diffusion policies with RL using a world model offline, avoiding millions of real-world interactions?

## Core Method
DiWA — train a world model on small offline play data once, then perform RL fine-tuning of diffusion policy entirely inside the world model without any real-world interaction.

## Key Characteristics
- Fully offline: world model trained on offline play data once, all subsequent RL in world model
- RL optimization for diffusion policy: denoising process modeled as MDP, but rollout in world model instead of real environment
- Extreme sample efficiency: hundreds of thousands of offline play data vs millions of real interactions for model-free RL
- First demonstration of fine-tuning diffusion policies with world model on real robots

## Key Insight
Diffusion policy's long denoising sequence hinders reward propagation in RL — but if rollouting in a world model, this problem is solved through imagined long rollouts while avoiding real interaction risks and costs.

## Technical Details
- **Architecture**: World Model (likely RSSM-based) + Diffusion Policy Actor
- **RL algorithm**: Policy gradient or actor-critic inside world model
- **Diffusion MDP modeling**: Each denoising step as an action step, state includes current noise level and history
- **Training pipeline**: (1) Collect small offline play data → (2) Train world model → (3) RL fine-tune diffusion policy in world model

## Experimental Results
- **CALVIN benchmark**: Improvement across 8 tasks with pure offline adaptation
- **Real robot**: First successful demonstration on real robot arm
- **Comparison**: Orders of magnitude fewer physical interactions than model-free baselines

## Limitations
- Relies on world model accuracy: biased world model leads to biased policy (compound error)
- Offline play data still requires manual collection (though much less than RL interactions)
- Only manipulation tasks validated, long-horizon tasks not tested
- World model training itself requires compute resources

## Connection to Prior Work
- Direct RL extension path for Diffusion Policy (Columbia)
- Shared "reduce real interactions" thinking with DayDreamer
- Similar "world model replaces real environment" concept with World-Env

## Open Problems
- How does world model hallucination/inaccuracy affect RL optimization? Any theoretical guarantees?
- How to extend to more complex diffusion architectures (e.g., DiT-based)?
- Error accumulation in world model for long-horizon tasks?

## Implications for Our Research
- **Long-horizon**: World model offline RL is ideal for long-horizon task post-training — can explore long-horizon strategies in simulation without environment resets.
- **Home scenes**: DiWA proves small play data + world model + offline RL can surpass imitation learning. This lowers data requirements for home scenarios.
- **Directly testable**: On our lab's Piper/Pallas, collect small free-play data to train world model, then offline RL fine-tune diffusion policy. Immediately testable.
