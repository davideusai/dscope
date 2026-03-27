# Suppression de l'ancien dossier hardware
Write-Host "Suppression de l'ancien dossier hardware..."
Remove-Item -Recurse -Force "hardware" -ErrorAction SilentlyContinue

# Création de la nouvelle arborescence hardware
Write-Host "Création de la nouvelle arborescence hardware..."

# Dossiers communs
New-Item -ItemType Directory -Path "hardware/common/symbols" -Force | Out-Null
New-Item -ItemType Directory -Path "hardware/common/footprints" -Force | Out-Null
New-Item -ItemType Directory -Path "hardware/common/templates" -Force | Out-Null

# Guidelines
New-Item -ItemType Directory -Path "hardware/guidelines" -Force | Out-Null
New-Item -ItemType File -Path "hardware/guidelines/design-rules.md" -Force | Out-Null
New-Item -ItemType File -Path "hardware/guidelines/naming-conventions.md" -Force | Out-Null
New-Item -ItemType File -Path "hardware/guidelines/electrical-rules.md" -Force | Out-Null

# Fonction utilitaire pour créer un module hardware
function New-HardwareModule {
    param([string]$name)

    $base = "hardware/modules/$name"

    New-Item -ItemType Directory -Path "$base/schematics" -Force | Out-Null
    New-Item -ItemType Directory -Path "$base/pcb" -Force | Out-Null
    New-Item -ItemType File -Path "$base/bom.csv" -Force | Out-Null
    New-Item -ItemType Directory -Path "$base/tests" -Force | Out-Null
}

# Création des modules
New-HardwareModule "comfort"
New-HardwareModule "flow"
New-HardwareModule "energy"
New-HardwareModule "hub"
New-HardwareModule "hvac-pac"

Write-Host "Nouvelle arborescence hardware créée avec succès."
