
# runall.ps1

Set-Location $PSScriptRoot
Write-Host "==> Proyecto:" (Get-Location) -ForegroundColor Cyan

# Crear carpetas (estructura requerida)
New-Item -ItemType Directory -Force -Path ".\data\raw" | Out-Null
New-Item -ItemType Directory -Force -Path ".\data\processed" | Out-Null
New-Item -ItemType Directory -Force -Path ".\results\figures" | Out-Null
New-Item -ItemType Directory -Force -Path ".\results\tables" | Out-Null
New-Item -ItemType Directory -Force -Path ".\results\models" | Out-Null

# Buscar Rscript.exe
Write-Host "==> Buscando Rscript.exe..." -ForegroundColor Cyan
$cmd = Get-Command Rscript -ErrorAction SilentlyContinue

if ($null -ne $cmd) {
    $RscriptPath = $cmd.Source
} else {
    $candidatos = @(
        "C:\Program Files\R\*\bin\Rscript.exe",
        "C:\Program Files\R\*\bin\x64\Rscript.exe",
        "C:\Program Files (x86)\R\*\bin\Rscript.exe",
        "C:\Program Files (x86)\R\*\bin\x64\Rscript.exe"
    )

    $RscriptPath = Get-ChildItem -Path $candidatos -ErrorAction SilentlyContinue |
        Sort-Object FullName -Descending |
        Select-Object -First 1 -ExpandProperty FullName
}

if (-not $RscriptPath) {
    throw "No se encontró Rscript.exe. Instala R o agrega Rscript al PATH."
}

Write-Host "==> Usando:" $RscriptPath -ForegroundColor Green

function Ejecutar-RScript {
    param([string]$scriptPath, [string]$mensaje)

    Write-Host $mensaje -ForegroundColor Cyan
    $salida = & $RscriptPath $scriptPath 2>&1
    $exitCode = $LASTEXITCODE

    if ($salida) { $salida | ForEach-Object { Write-Host $_ } }

    if ($exitCode -ne 0) {
        Write-Host "[ERROR] Falló: $scriptPath (exit=$exitCode)" -ForegroundColor Red
        exit $exitCode
    }
}

Ejecutar-RScript ".\scripts\01_simular.R" "==> (1/5) Simulando datos..."
Ejecutar-RScript ".\scripts\02_procesar.R"    "==> (2/5) Procesando datos..."
Ejecutar-RScript ".\scripts\03_analizar.R"   "==> (3/5) Analizando y generando tablas..."
Ejecutar-RScript ".\scripts\04_modelar.R"    "==> (4/5) Generando modelos..."
Ejecutar-RScript ".\scripts\05_visualizar.R"   "==> (5/5) Generando figuras..."

Write-Host "==> Pipeline completado." -ForegroundColor Green

