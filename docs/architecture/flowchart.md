```mermaid
flowchart LR

    %% STYLE
    classDef module fill:#e8f5e9,stroke:#2e7d32,stroke-width:1px,color:#1b5e20;
    classDef hub fill:#e3f2fd,stroke:#1565c0,stroke-width:1px,color:#0d47a1;
    classDef proto fill:#fff3e0,stroke:#ef6c00,stroke-width:1px,color:#e65100;

    %% HUB
    HUB[Hub<br/>Agrégation & Routage]:::hub

    %% MODULES
    C[Comfort<br/>Température, Humidité, CO₂]:::module
    F[Flow<br/>Débit, Pression]:::module
    E[Energy<br/>Puissance, Consommation]:::module
    H[HVAC‑PAC<br/>État, Commandes]:::module

    %% PROTOCOLE
    P[D‑Scope Message Format<br/>Frames normalisées]:::proto

    %% LINKS
    C -- "Messages D‑Scope" --> HUB
    F -- "Messages D‑Scope" --> HUB
    E -- "Messages D‑Scope" --> HUB
    H -- "Messages D‑Scope" --> HUB

    HUB -- "Encapsulation / Routage" --> P
    P -- "Validation / Parsing" --> HUB