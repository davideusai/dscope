```mermaid
sequenceDiagram
    autonumber

    participant C as Module Comfort
    participant F as Module Flow
    participant E as Module Energy
    participant H as Module HVAC‑PAC
    participant HUB as Hub
    participant REG as Registry

    Note over C,H: Chaque module génère des mesures<br/>selon sa fréquence propre

    C->>HUB: Frame D‑Scope (temp, humidité, CO₂)
    F->>HUB: Frame D‑Scope (débit, pression)
    E->>HUB: Frame D‑Scope (puissance, énergie)
    H->>HUB: Frame D‑Scope (état, consignes)

    HUB->>REG: Validation des champs<br/>(types, unités, contraintes)
    REG-->>HUB: OK / Erreur

    HUB->>HUB: Normalisation & routage interne
    HUB-->>API: Publication (MQTT / REST / WebSocket)