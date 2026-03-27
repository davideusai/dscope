# 📘 D‑Scope — Open Standard for Multi‑Module Measurement and Telemetry

<p align="left">
  <img src="https://img.shields.io/badge/status-work_in_progress-orange" alt="Status: Work in progress" />
  <img src="https://img.shields.io/badge/license-Apache_2.0-blue" alt="License: Apache 2.0" />
  <img src="https://img.shields.io/badge/standard-DS--000-lightgrey" alt="Standard version: DS-000" />
  <img src="https://img.shields.io/badge/modular-architecture-success" alt="Modular architecture" />
</p>

Open, modular telemetry standard for comfort and environmental devices.

D‑Scope is an **open, modular, local‑first ecosystem** designed to measure, collect, and analyze data from a wide range of modules: environmental sensors, energy monitoring, HVAC/heat pumps, flow measurement, and specialized sensors.

It is built around:

- a **simple and extensible protocol** (key=value),
- **autonomous wireless modules**,
- a **local Hub** that collects and enriches frames,
- an **extensible Analyzer** for processing and visualization.

D‑Scope aims to become an **open, reproducible, documented, and durable standard** for local telemetry.

---

# 📁 Project Tree
```
dscope/
├── docs/              → Narrative documentation
├── specs/             → Official protocol specifications
├── registry/          → Machine‑readable registry (source of truth)
├── dpcr/              → Protocol evolution process
├── examples/          → Frames, CSV logs, diagrams
├── hardware/          → Contains the full D‑Scope hardware ecosystem
├── knowledge/         → Internal notes, research
├── tools/             → Technical tools (validators, converters)
├── modules/           → All embedded firmwares
├── playground         → Experiments and prototypes
├── libs/              → Shared libraries
└── analyzer/          → Analysis tool, dashboards, advanced parsing
```

---

# 🎯 Project Goals

## Main Objectives

- Define an **open and extensible protocol** for heterogeneous measurement modules.  
- Provide **simple and autonomous modules** (Comfort, Flow, Energy, HVAC/PAC…).  
- Centralize data through a **local Hub** that enriches frames.  
- Offer an **Analyzer** capable of computing, storing, and visualizing data.  
- Provide **native integration** with Home Assistant (via MQTT).  
- Enable **interoperability** with Alexa (via Home Assistant).  
- Document the standard: specs, registry, DPCR, examples.

## Core Principles

- **Local‑first**: no cloud dependency.  
- **Simplicity**: key=value protocol, minimalist modules.  
- **Modularity**: each module is independent.  
- **Scalability**: DPCR process for evolving the standard.  
- **Interoperability**: MQTT, JSON, Home Assistant.

---

# 🧩 Overall Architecture

## Modules

- Send simple radio frames (key=value).  
- Are specialized by function (Comfort, Flow, Energy, HVAC/PAC…).  
- Use ESP32 / RP2040 / PIC depending on the use case.

## Hub

- Receives radio frames.  
- Adds metadata: RSSI, CHK, timestamp.  
- Publishes to MQTT.  
- May expose a local API.

## Analyzer

- Retrieves data via MQTT.  
- Computes, stores, and visualizes.  

---

# 🧱 D‑Scope Modules

## 1. Comfort Module

Indoor environmental sensor:

- Temperature (TIN)  
- Humidity (RHIN)  
- Air quality  
- Periodic measurement transmission

## 2. Flow Module

Flow measurement:

- Water flow  
- Air flow  
- Associated temperatures

## 3. Energy Module

Energy monitoring:

- Instant power  
- Cumulative energy  
- Voltage / current  
- Power factor

## 4. HVAC/PAC Module

Heat pump monitoring:

- Supply/return temperatures  
- Pressures  
- Operating states  
- Error codes

## 5. Hub Module

System core:

- Radio reception  
- Frame enrichment  
- MQTT publication  
- Optional local API

## 6. PIC Module

Ultra‑low‑power module:

- Simple sensors  
- Radio transmission  
- XC8 firmware + Makefile

---

# 📡 D‑Scope Protocol

## General Format

A **key=value** protocol: simple, robust, readable.

Example: ID=02;TYPE=COMFORT;TIN=21.4;RHIN=48;BAT=3.01


## Hub Enrichment

The Hub adds:

- `RSSI`  
- `CHK` (checksum)  
- `TS` (timestamp)  
- `SRC` (radio source)

## JSON Registry

Two central files:

- `fields.json` → field definitions  
- `modules.json` → module definitions

## Protocol Evolution

DPCR (D‑Scope Protocol Change Request) process:

- `DPCR-template.md`  
- `DPCR-0001.md` (example)

---

# 📁 D‑Scope Project Structure

The D‑Scope repository is designed to be **clear, modular, and durable**, explicitly separating:

- **documentation** (for humans),  
- **specifications** (normative reference),  
- the **registry** (machine‑readable source of truth),  
- the **evolution process** (DPCR),  
- **firmware modules**,  
- **shared libraries**,  
- **technical tools**.

This structure ensures D‑Scope remains an **open standard**, easy to maintain and extend.

---

# 🧠 Structuring Principles

## ✔ Documentation (`docs/`)

Contains **all human‑oriented explanations**:  
guides, diagrams, architecture, protocol, hardware, software.

## ✔ Specifications (`specs/`)

Contains the **normative documents** of the protocol:  
frame format, official rules, versions, changelog.

## ✔ Registry (`registry/`)

Contains **machine‑readable files**:

- `fields.json`  
- `modules.json`  

Used by:

- validation tools  
- the Hub  
- the Analyzer  
- documentation generators  
- modules  

This is the **single source of truth**.

## ✔ DPCR (`dpcr/`)

The **formal process** for evolving the protocol:

- propose changes  
- analyze impacts  
- document decisions  
- ensure consistency  

Documentation says **what exists**.  
DPCR explains **why it changes**.

## ✔ Examples (`examples/`)

Concrete examples:

- raw frames  
- CSV logs  
- diagrams  

## ✔ Tools (`tools/`)

Scripts and utilities:

- frame validators  
- converters  
- analysis tools  

## ✔ Modules (`modules/`)

Each module is an independent project:

- Comfort  
- Flow  
- Energy  
- HVAC/PAC  
- Hub  
- PIC module  

## ✔ Libraries (`libs/`)

Shared code:

- `dscope-protocol` → frame parsing & generation  
- `dscope-utils` → helpers and utilities  

---



---

# 📄 License

D‑Scope is distributed under the **Apache License 2.0**.

This choice reflects the project’s philosophy:

- ensure an **open standard**, easy to adopt,  
- allow **broad usage**, including commercial,  
- provide **strong legal protection** (patents, contributions),  
- encourage contributions without heavy constraints,  
- ensure the **long‑term durability** of the protocol and ecosystem.

The full license text is available in the `LICENSE` file.
