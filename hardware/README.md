# 📘 D‑Scope Hardware  
**Référence matérielle du standard D‑Scope**

Ce dossier contient l’ensemble des éléments matériels du standard D‑Scope :  
schémas électroniques, PCB, bibliothèques KiCad, BOM et outils de test.

L’objectif est de fournir une base matérielle **cohérente, reproductible et maintenable**, commune à tous les modules D‑Scope (Comfort, Flow, Energy, HVAC/PAC, Hub…).

Cette section est **centralisée** afin d’éviter la duplication, garantir la cohérence et faciliter la contribution.

---

## 🧩 Structure du dossier

### `schematics/`
Schémas électroniques KiCad, organisés par module et par version.  
Le dossier `common/` contient les blocs partagés (MCU, alimentation, protections, connecteur D‑Scope…).

### `pcb/`
Routage PCB, fichiers KiCad, Gerbers et perçages, organisés par module et par version.

### `bom/`
Bill of Materials (BOM) pour chaque module et chaque révision matérielle.

### `footprints/`
Empreintes KiCad communes à tous les modules.

### `symbols/`
Symboles KiCad communs à tous les modules.

### `tests/`
Jigs, fixtures, cartes de test et scripts de validation.

---

## 🎯 Philosophie de conception

### ✔️ Centralisation des éléments communs  
Les symboles, footprints, règles de design et blocs électroniques partagés sont regroupés dans des dossiers uniques.  
Cela garantit :

- cohérence entre modules  
- maintenance simplifiée  
- absence de duplication  
- gouvernance claire du standard  

### ✔️ Séparation claire entre matériel et logiciel  
Le matériel est centralisé ici, tandis que le firmware de chaque module se trouve dans : modules/<module>/software/


Chaque module pointe vers son hardware correspondant.

### ✔️ Versioning matériel propre  
Chaque module peut avoir plusieurs révisions (ex. `v1.0`, `v1.1`, `v2.0`).  
Cela permet :

- traçabilité  
- reproductibilité  
- compatibilité ascendante  

### ✔️ Réutilisation maximale  
Les blocs communs (MCU, alimentation, protections, connecteur D‑Scope…) sont conçus pour être réutilisés dans tous les modules.

---

## 🛠️ Contenu attendu dans chaque section

### `schematics/`
- Fichiers `.kicad_sch`  
- PDF exportés  
- Notes de conception  
- Versions par module  

### `pcb/`
- Fichiers `.kicad_pcb`  
- Gerbers  
- Fichiers de perçage  
- DRC/ERC validés  

### `bom/`
- BOM par module et par version  
- Références fournisseurs (Mouser, LCSC, Digikey)  
- Alternatives validées  

### `footprints/` & `symbols/`
- Librairies KiCad officielles D‑Scope  
- Empreintes et symboles standardisés  
- Connecteur D‑Scope  
- MCU et composants communs  

### `tests/`
- Jigs de test  
- Fixtures  
- Scripts de validation  
- Cartes de calibration  

---

## 🧭 Workflow recommandé

1. Concevoir ou modifier un schéma dans `schematics/<module>/vX.Y/`  
2. Mettre à jour les symboles/footprints si nécessaire  
3. Router le PCB dans `pcb/<module>/vX.Y/`  
4. Générer la BOM correspondante dans `bom/`  
5. Ajouter les fichiers de test dans `tests/` si applicable  
6. Documenter dans `docs/hardware/` si nécessaire  
7. Commit + PR avec justification technique  