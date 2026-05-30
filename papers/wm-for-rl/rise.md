# RISE: Self-Improving Robot Policy with Compositional World Model

- **Venue**: RSS'26
- **arXiv**: [2602.11075](https://arxiv.org/abs/2602.11075)
- **Project**: [https://opendrivelab.com/RISE/](https://opendrivelab.com/RISE/)
- **Category**: World Model for RL

## Core Problem
How to achieve safe, scalable robot RL self-improvement through world models in contact-rich and dynamic manipulation tasks?

## Core Method
RISE — compositional world model: (1) controllable dynamics model predicts multi-view future, (2) progress value model evaluates imagined outcomes, producing informative advantages.

## Key Characteristics
- Compositional design: dynamics model and value model use different architectures/objectives, each optimized for its role
- Multi-view prediction: dynamics model predicts multi-view future for rich information
- Progress value model: evaluates imagined outcomes, producing advantage estimates
- Closed-loop self-improvement: continuously generates imaginary rollouts, estimates advantages, updates policy in imagined space
- Real-world validation: tested on 3 real-world tasks

## Key Insight
A single world model simultaneously responsible for prediction and evaluation is suboptimal — dynamics prediction and value evaluation require different architectures and training objectives. Compositional design lets each component do what it's best at.

## Technical Details
- **Architecture**: Controllable dynamics model (multi-view video generation) + progress value model (outcome evaluation) + policy
- **Dynamics model**: Predicts multi-view future frames, controllable (action-conditioned)
- **Progress value model**: Evaluates imagined rollout outcomes, outputs advantage estimates
- **Training**: Closed-loop — generate imagined rollouts → value model evaluates → policy updates → repeat
- **Key design**: Compositional architecture, dynamics and value models separated

## Experimental Results
- Dynamic brick sorting: +35% absolute improvement
- Backpack packing: +45% absolute improvement
- Box closing: +35% absolute improvement
- Real-world tasks: significant improvement on 3 challenging tasks

## Limitations
- Compositional system complexity: two models need joint training/maintenance
- Multi-view prediction increases computational cost
- Progress value model accuracy directly affects policy optimization quality
- Only validated on 3 real-world tasks, generalization pending testing

## Connection to Prior Work
- Contrast with RSSM (DayDreamer): evolution from single model to compositional model
- Related to RoboDreamer (compositional world model): shared compositional thinking
- Related to multi-view video generation (RoboVIP etc.)

## Implications for Our Research
- **Long-horizon**: Compositional world model suitable for long-horizon tasks — dynamics model predicts long-horizon trajectories, value model evaluates long-horizon outcomes. More reliable than single model.
- **Home scenes**: Multi-view (multiple cameras) is common in home scenes. RISE's multi-view prediction naturally aligns with home scene setups.
- **Directly testable**: Compositional world model can be tried — video generation model for dynamics prediction, value network for evaluation. Multi-view can be implemented with multiple cameras in lab.
