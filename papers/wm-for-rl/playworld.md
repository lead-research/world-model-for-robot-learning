# PlayWorld: Learning Robot World Models from Autonomous Play

- **Venue**: arXiv'26.03
- **arXiv**: [2603.09030](https://arxiv.org/abs/2603.09030)
- **Project**: [https://robot-playworld.github.io/](https://robot-playworld.github.io/)
- **Category**: World Model for RL

## Core Problem
How to learn high-fidelity world models from autonomous robot play rather than success-biased human demonstrations?

## Core Method
PlayWorld — fully autonomous, scalable pipeline where robots collect interaction data through unsupervised self-play, training high-fidelity video world simulators.

## Key Characteristics
- Fully autonomous: no human supervision, robots play and learn by themselves
- Learning from unsupervised play: not success-biased demonstration data
- Capturing long-tail physical interactions: autonomous play naturally covers complex, long-tail physical interactions
- Failure prediction: predicts fine-grained failures, 40% improvement over human data
- Policy evaluation: world model can be used for policy evaluation
- RL improvement: RL training in world model, 65% improvement in real-world deployment

## Key Insight
Human demonstration data has "success bias" — only contains successful trajectories, world models never learn failures. Autonomous play is unbiased, naturally covering failures, collisions, drops and other long-tail physical interactions — this is ideal data for training world models.

## Technical Details
- **Architecture**: Autonomous play data collection → video world model training → policy evaluation/RL optimization
- **Autonomous play**: Robot freely explores in unsupervised environment, collects interaction data
- **Scalability**: Fully autonomous, no manual annotation, data volume naturally scales
- **Long-tail coverage**: Autonomous play covers complex physical interactions (contact, sliding, deformation, etc.)
- **Key design**: Unsupervised play data vs success-biased demonstration data

## Experimental Results
- Physical consistency: generates high-quality, physically consistent contact-rich interaction predictions
- Failure prediction: 40% improvement over human data (fine-grained failure prediction)
- Policy evaluation: world model can effectively evaluate policies
- RL improvement: RL training in world model, 65% improvement in real-world deployment

## Limitations
- Autonomous play requires safe environment (cannot damage objects or harm robot)
- Autonomous play data efficiency may be lower than human demonstrations (lots of meaningless interactions)
- Requires pre-deploying a base policy for autonomous play
- In real-world environments, autonomous play coverage limited by environment

## Connection to Prior Work
- Descendant of autonomous play/self-supervised learning (e.g., Play-LMP)
- Related to unsupervised data collection (e.g., DROID large-scale robot datasets)
- Related to failure prediction/anomaly detection

## Implications for Our Research
- **Long-horizon**: Autonomous play can cover various intermediate states in long-horizon tasks, including failure recovery. Particularly valuable for long-horizon task world model training.
- **Home scenes**: Autonomous play is ideal data collection method for home scenes — let robot freely explore at home, collect natural interaction data. Safety constraints need design (e.g., soft collision detection, force limits).
- **Directly testable**: Can let Piper/Pallas perform autonomous play in lab (free exploration in controlled environment), collect data to train world model. Then use for policy evaluation and RL optimization. Need to design safety boundaries (e.g., collision detection, workspace limits).
