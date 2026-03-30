# 🔧 D‑Scope Hardware Ecosystem

This directory contains all hardware‑related resources for D‑Scope.

## Contents
- Schematics
- PCB designs
- Wiring diagrams
- Bill of materials
- Mechanical parts (3D models)

## Modules
Each hardware module has:
- its own folder
- documentation
- wiring
- test notes

The hardware ecosystem is designed to be modular, reproducible, and open.

## 🧪 Prototyping & Hardware Foundations

D‑Scope follows a progressive and reproducible development workflow designed to keep experimentation simple while ensuring a clean path toward industrial‑grade hardware:

- **Component testing and early prototyping** are performed using an **Arduino Uno**, providing a straightforward environment to validate sensors, signals, and early ideas.
- **Measurement modules** are implemented using **Microchip PIC microcontrollers**, chosen for their robustness, low‑power operation, and suitability for autonomous wireless nodes.
- The **Hub**, initially prototyped on Arduino for rapid iteration, is implemented in its production version on an **STM32 microcontroller**, offering the performance, peripherals, and multitasking capabilities required for FreeRTOS‑based operation.

This layered approach ensures fast experimentation, clean separation of responsibilities, and a smooth transition from prototype to production‑ready hardware.

