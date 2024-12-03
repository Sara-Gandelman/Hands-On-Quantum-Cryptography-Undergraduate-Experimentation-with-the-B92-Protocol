# Hands-On-Quantum-Cryptography-Undergraduate-Experimentation-with-the-B92-Protocol
This repository presents an educational emulation of the B92 Quantum Key Distribution protocol using pulsed lasers. It simplifies the setup for secure key exchange demonstrations, illustrating core quantum cryptography principles like eavesdropping detection and measurement disturbance in a lab-friendly environment.

<!-- # Paper by:
Sara P. Gandelman - The Raymond and Beverly Sackler School of Physics and Astronomy, Tel Aviv University, Tel Aviv 69978, Israel
Alona Maslennikov - Department of Chemistry Boston University, 590 Commonwealth Avenue, Boston, MA 02215, USA
Georgi Gary Rozenman - Research Laboratory of Electronics, MIT-Harvard Center for
Ultracold Atoms, Department of Physics, Massachusetts Institute of Technology, Cambridge, MA 02139, USA -->


## Simulation Codes

This repository includes two MATLAB simulation codes that demonstrate key aspects of the B92 Quantum Key Distribution (QKD) protocol. Each simulation explores the "granted bits" proportion based on different measurement and eavesdropping scenarios, providing valuable insights into the behavior of the protocol.

### 1. `B92_granted_bits_simulation_With_Eve_13_10_2024.m`
This simulation introduces eavesdropping probabilities into the B92 protocol, allowing users to study the effects of an eavesdropper (Eve) on the proportion of "granted bits." It uses updated probabilities to reflect potential disturbances caused by eavesdropping attempts. 

#### Features:
- Calculates the proportion of granted bits as a function of the number of transmitted bits \(N\).
- Evaluates variability across multiple runs to capture the stochastic nature of quantum measurements.
- Outputs a plot with log-scaled \(x\)-axis, showing granted bit proportions and error regions.

### 2. `B92loop_Alice_bob_13_10_2024.m`
This simulation focuses on the interaction between Alice and Bob in the absence of eavesdropping. It evaluates the proportion of "granted bits" while incorporating different probabilities for measurement outcomes.

#### Features:
- Compares theoretical and observed proportions of granted bits.
- Highlights the protocol's robustness through variability visualization across multiple runs.
- Outputs a plot similar to the first simulation, with clearly labeled axes and legends.

### Outputs
Both simulations generate plots showing the proportion of "granted bits" as a function of \(N\), with:
- Logarithmic scaling on the \(x\)-axis to represent large ranges of \(N\).
- Shaded regions indicating variability across runs.
- Titles, legends, and labeled axes for enhanced clarity.

### How to Use
1. Install MATLAB.
2. Download the desired `.m` file from this repository.
3. Run the script in MATLAB to generate results.

These codes are designed for educational purposes, providing hands-on insights into the B92 protocol's operation and behavior under varying conditions.
