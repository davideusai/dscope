# 📘 D‑Scope — Open Standard for Local Measurement & Telemetry

<p align="left">
  <img src="https://img.shields.io/badge/status-work_in_progress-orange" />
  <img src="https://img.shields.io/badge/license-Apache_2.0-blue" />
  <img src="https://img.shields.io/badge/standard-DS--000-lightgrey" />
  <img src="https://img.shields.io/badge/modular-architecture-success" />
</p>

D‑Scope is an **open, modular, local‑first standard** for collecting, transmitting, and analyzing environmental and technical measurements.  
It provides a unified way to build **autonomous wireless modules**, a **local Hub**, and an **Analyzer** capable of processing and visualizing data.

The project aims to be **reproducible, durable, and fully documented**, with a clear separation between:

- human‑oriented documentation  
- normative specifications  
- machine‑readable registry  
- protocol evolution  
- hardware ecosystem  
- firmware modules  
- tools and libraries  

---

# 🧭 What D‑Scope Provides

- A **simple, extensible key=value protocol**  
- A set of **specialized measurement modules** (Comfort, Flow, Energy, HVAC/PAC…)  
- A **local Hub** that enriches and publishes frames (MQTT)  
- An **Analyzer** for computation, storage, and visualization  
- A complete **open governance process** (DPCR)  
- A **machine‑readable registry** defining fields and modules  
- Full **local‑first operation** (no cloud dependency)

---

## 🧪 Prototyping & Hardware Foundations

D‑Scope follows a progressive and reproducible development workflow designed to keep experimentation simple while ensuring a clean path toward industrial‑grade hardware:

- **Component testing and early prototyping** are performed using an **Arduino Uno**, providing a straightforward environment to validate sensors, signals, and early ideas.
- **Measurement modules** are implemented using **Microchip PIC microcontrollers**, chosen for their robustness, low‑power operation, and suitability for autonomous wireless nodes.
- The **Hub**, initially prototyped on Arduino for rapid iteration, is implemented in its production version on an **STM32 microcontroller**, offering the performance, peripherals, and multitasking capabilities required for FreeRTOS‑based operation.

This layered approach ensures fast experimentation, clean separation of responsibilities, and a smooth transition from prototype to production‑ready hardware.

---

# 📎 Project Navigation

To explore the project in depth, you can jump directly to the dedicated sections:

- **docs/** → Global documentation, architecture, concepts  
- **dpcr/** → D‑Scope Protocol & Registry (DS‑000)  
- **hardware/** → Modules, electronics, schematics, production notes
- **knowledge/** → Notes, research, experiments, engineering references
- **knowledge/sketches/** → All STM32/Arduino prototypes and experimental sketches  
- **libs/** → Shared libraries and reusable components  
- **software/** → Analyzer 

---

# 🚀 Getting Started

If you’re new to D‑Scope, start here:

1. [**docs/**](docs/architecture/README.md) → Overview, architecture, concepts  
2. [**hardware/modules/**](/hardware/modules/README.md) → Choose the module you are interested in  

---

# 📄 License

D‑Scope is released under the **Apache License 2.0**, ensuring:

- open adoption  
- commercial‑friendly usage  
- strong contributor and patent protection  
- long‑term durability of the standard  

See the `LICENSE` file for details.
