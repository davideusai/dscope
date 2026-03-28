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

# 📁 Repository Structure
```
dscope/
├── docs/              → Human‑oriented documentation
├── specs/             → Official protocol specifications
├── registry/          → Machine‑readable source of truth
├── dpcr/              → Protocol evolution process
├── examples/          → Frames, CSV logs, diagrams
├── hardware/          → Hardware ecosystem
├── knowledge/         → Research & internal notes
├── tools/             → Validators, converters, utilities
├── modules/           → Embedded firmwares
├── playground/        → Experiments & prototypes
├── libs/              → Shared libraries
└── analyzer/          → Dashboards & advanced parsing
```

Each directory contains its own dedicated README with detailed information.

---

# 🚀 Getting Started

If you’re new to D‑Scope, start here:

1. **docs/** → Overview, architecture, concepts  
2. **specs/** → Protocol rules and normative definitions  
3. **registry/** → Machine‑readable fields and modules  
4. **playground/** → Sensor and module experiments  
5. **modules/** → Firmware implementations  
6. **analyzer/** → Data processing and visualization  

---

# 🧩 Key Concepts

- **Modules** send simple radio frames (`key=value`)  
- The **Hub** enriches frames and publishes them locally  
- The **Analyzer** computes and visualizes data  
- The **Registry** defines all fields and module types  
- The **DPCR** process governs protocol evolution  

Each of these components is documented in its own section of the repository.

---

# 📄 License

D‑Scope is released under the **Apache License 2.0**, ensuring:

- open adoption  
- commercial‑friendly usage  
- strong contributor and patent protection  
- long‑term durability of the standard  

See the `LICENSE` file for details.
