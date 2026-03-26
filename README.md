# 📘 D‑Scope — Standard Ouvert pour la Mesure et la Télémétrie Multi‑Modules
# D-Scope

<p align="left">
  <img src="https://img.shields.io/badge/status-work_in_progress-orange" alt="Status: Work in progress" />
  <img src="https://img.shields.io/badge/license-Apache_2.0-blue" alt="License: Apache 2.0" />
  <img src="https://img.shields.io/badge/standard-DS--000-lightgrey" alt="Standard version: DS-000" />
  <img src="https://img.shields.io/badge/modular-architecture-success" alt="Modular architecture" />
</p>

D‑Scope est un **écosystème ouvert**, modulaire et local-first, conçu pour mesurer, collecter et analyser des données provenant de modules variés : environnement, énergie, HVAC/PAC, débit, capteurs spécialisés, etc.

Il repose sur :
- un **protocole simple et extensible** (clé=valeur),
- des **modules sans‑fil autonomes**,
- un **Hub local** qui collecte et enrichit les trames,
- un **Analyzer** extensible pour le traitement et la visualisation.

D‑Scope vise à devenir un **standard ouvert**, reproductible, documenté et durable pour la télémétrie locale.

---

# 🎯 Objectifs du projet

## Objectifs principaux
- Définir un **protocole ouvert et extensible** pour des modules de mesure hétérogènes.  
- Fournir des **modules simples et autonomes** (Comfort, Flow, Energy, HVAC/PAC…).  
- Centraliser les données via un **Hub local** enrichissant les trames.  
- Proposer un **Analyzer** capable de calculer, historiser et visualiser.  
- Offrir une **intégration native** avec Home Assistant (via MQTT).  
- Permettre une **interopérabilité** avec Alexa (via Home Assistant).  
- Documenter le standard : specs, registre, DPCR, exemples.

## Principes fondamentaux
- **Local-first** : aucune dépendance cloud.  
- **Simplicité** : protocole clé=valeur, modules minimalistes.  
- **Modularité** : chaque module est indépendant.  
- **Évolutivité** : processus DPCR pour faire évoluer le standard.   
- **Interopérabilité** : MQTT, JSON, Home Assistant.

---

# 🧩 Architecture générale

## Modules
- Envoient des trames radio simples (clé=valeur).  
- Sont spécialisés par fonction (Comfort, Flow, Energy, HVAC/PAC…).  
- Utilisent ESP32 / RP2040 / PIC selon le cas.

## Hub
- Reçoit les trames radio.  
- Ajoute des métadonnées : RSSI, CHK, timestamp.  
- Publie en MQTT.  
- Peut exposer une API locale.

## Analyzer
- Récupère les données via MQTT.  
- Calcule, historise, visualise.  

---

# 🧱 Modules D‑Scope

## 1. Comfort Module
Capteur environnemental intérieur :
- Température (TIN)  
- Humidité (RHIN)  
- Qualité d’air 
- Envoi périodique des mesures

## 2. Flow Module
Mesure des débits :
- Débit d’eau
- Débit d’air  
- Températures associées

## 3. Energy Module
Mesures énergétiques :
- Puissance instantanée  
- Énergie cumulée  
- Tension / courant  
- Facteur de puissance

## 4. HVAC/PAC Module
Module spécialisé pour les pompes à chaleur :
- Températures aller/retour  
- Pressions  
- États de fonctionnement  
- Codes d’erreur éventuels

## 5. Hub Module
Cœur du système :
- Réception radio  
- Enrichissement des trames  
- Publication MQTT  
- API locale (optionnel)

## 6. PIC Module
Module ultra‑low‑power :
- Capteurs simples  
- Transmission radio  
- Firmware XC8 + Makefile

---

# 📡 Protocole D‑Scope

## Format général
Protocole **clé=valeur**, simple, robuste, lisible.

Exemple :
ID=02;TYPE=COMFORT;TIN=21.4;RHIN=48;BAT=3.01


## Enrichissement par le Hub
Le Hub ajoute :
- `RSSI`  
- `CHK` (checksum)  
- `TS` (timestamp)  
- `SRC` (source radio)

## Registre JSON
Deux fichiers centraux :
- `fields.json` → définition des champs  
- `modules.json` → définition des modules

## Évolution du protocole
Processus DPCR (D‑Scope Protocol Change Request) :
- `DPCR-template.md`  
- `DPCR-0001.md` (exemple)

---

# 📁 Organisation du projet D‑Scope

L’arborescence de D‑Scope est conçue pour être **claire, modulaire et durable**, en séparant explicitement :

- la **documentation** (pour les humains),
- les **spécifications** (référence normative),
- le **registre** (source de vérité machine‑lisible),
- le **processus d’évolution** (DPCR),
- les **modules firmware**,
- les **bibliothèques communes**,
- les **outils techniques**.

Cette structure permet à D‑Scope d’être un **standard ouvert**, facile à maintenir et à étendre.

---

## 🧠 Principes de structuration

## ✔ Documentation (`docs/`)
Contient **tout ce qui explique** le fonctionnement du projet :  
guides, schémas, architecture, protocoles, hardware, software.

C’est une documentation **narrative**, destinée aux humains.

## ✔ Spécifications (`specs/`)
Contient les **documents normatifs** du protocole :  
format des trames, règles officielles, versions, changelog.

C’est la **référence technique** du standard.

## ✔ Registre (`registry/`)
Contient les fichiers **machine‑lisibles** :

- `fields.json` : liste des champs autorisés  
- `modules.json` : liste des modules et de leurs champs  

Ce registre est utilisé par :

- les outils de validation  
- le Hub  
- l’Analyzer  
- les générateurs de documentation  
- les modules eux‑mêmes  

C’est la **source de vérité unique** du standard.

## ✔ DPCR (`dpcr/`)
Le **D‑Scope Protocol Change Request** est le processus formel pour :

- proposer une évolution du protocole  
- analyser les impacts  
- documenter les décisions  
- garantir la cohérence du standard  

La documentation dit **ce qui existe**.  
La DPCR dit **pourquoi ça change**.

## ✔ Exemples (`examples/`)
Contient des exemples concrets :

- trames brutes  
- fichiers CSV  
- diagrammes  

Utile pour les tests, la compréhension et la validation.

## ✔ Outils (`tools/`)
Scripts et utilitaires :

- validateurs de trames  
- convertisseurs  
- outils d’analyse  

Ces outils peuvent utiliser le registre pour valider ou générer des données.

## ✔ Modules (`modules/`)
Chaque module est un projet indépendant :

- Comfort  
- Flow  
- Energy  
- HVAC/PAC  
- Hub  
- PIC module  

Chaque module possède son propre firmware, sa documentation et sa configuration.

## ✔ Bibliothèques (`libs/`)
Code partagé entre modules :

- `dscope-protocol` : parsing, génération de trames  
- `dscope-utils` : helpers, conversions, outils génériques  


# 📁 Arborescence du projet
```
dscope/
├── docs/              → Documentation narrative
├── specs/             → Spécifications officielles du protocole
├── registry/          → Registre machine‑lisible (source de vérité)
├── dpcr/              → Processus d’évolution du protocole
├── examples/          → Exemples de trames, CSV, diagrammes
├── tools/             → Outils techniques (validators, converters)
├── modules/           → Tous les firmwares embarqués
├── libs/              → Bibliothèques communes
└── analyzer/          → Outil d’analyse, dashboards, parsing avancé
```

# 🧩 Arborescence détaillée
```
dscope/
├── README.md                 → Présentation générale du projet
├── ROADMAP.md                → Vision et étapes du projet
├── LICENSE                   → Licence Apache 2.0
├── NOTICE                    → Mentions légales et attributions
├── .gitignore                → Fichiers ignorés par Git
└── dscope.code-workspace     → Workspace VS Code
│
├── docs/                     → Documentation narrative
│   ├── architecture/         → Schémas et architecture globale
│   ├── protocol/             → Explications du protocole
│   ├── hardware/             → Documentation matérielle
│   └── software/             → Documentation logicielle
│
├── specs/                    → Spécifications officielles
│   ├── dscope-message-spec-v0.1.md
│   └── changelog.md
│
├── registry/                 → Registre machine‑lisible
│   ├── fields.json           → Définition des champs
│   └── modules.json          → Définition des modules
│
├── dpcr/                     → Processus d’évolution du protocole
│   ├── DPCR-template.md      → Modèle de proposition
│   └── DPCR-0001.md          → Exemple de DPCR
│
├── examples/                 → Exemples concrets
│   ├── frames/               → Exemples de trames
│   ├── csv/                  → Exemples de logs CSV
│   └── diagrams/             → Diagrammes et illustrations
│
├── tools/                    → Outils techniques
│   ├── validators/           → Scripts de validation
│   └── converters/           → Scripts de conversion
│
├── modules/                  → Tous les firmwares embarqués
│   ├── comfort/              → Module Comfort
│   ├── flow/                 → Module Flow
│   ├── energy/               → Module Energy
│   ├── hvac-pac/             → Module HVAC/PAC
│   └── hub/                  → Module Hub
│
├── libs/                     → Bibliothèques communes
│   ├── dscope-protocol/      → Parsing et génération de trames
│   │   ├── src/
│   │   └── include/
│   └── dscope-utils/         → Helpers et utilitaires
│       ├── src/
│       └── include/
│
└── analyzer/                 → Outil d’analyse D‑Scope
    ├── README.md             → Présentation générale de l’Analyzer
    │
    ├── src/                  → Code source principal
    │   ├── core/             → Parsing, validation, registry loading
    │   ├── ui/               → Interface (CLI, web, desktop)
    │   ├── widgets/          → Widgets graphiques
    │   ├── exporters/        → CSV, JSON, MQTT, InfluxDB…
    │   └── utils/
    │
    ├── plugins/              → Extensions externes
    │   └── README.md
    │
    ├── examples/             → Exemples Analyzer
    │   ├── frames/           → Trames d’exemple
    │   ├── sessions/         → Sessions d’analyse
    │   └── dashboards/       → Dashboards préconfigurés
    │
    └── docs/                 → Documentation utilisateur
        ├── installation.md
        ├── usage.md
        ├── dashboards.md
        └── plugins.md
```
---

# 📄 Licence

D‑Scope est distribué sous licence **Apache License 2.0**.

Ce choix reflète la philosophie du projet :

- garantir un **standard ouvert**, simple à adopter,
- permettre une **utilisation large**, y compris commerciale,
- offrir une **protection juridique solide** (brevets, contributions),
- encourager les contributions sans imposer de contraintes fortes,
- assurer la **pérennité** du protocole et de son écosystème.

La licence Apache 2.0 est aujourd’hui l’une des plus utilisées pour les projets
qui visent à devenir des standards ouverts (Kubernetes, MQTT, TensorFlow, VS Code…).

Le texte complet de la licence est disponible dans le fichier [`LICENSE`](LICENSE).
