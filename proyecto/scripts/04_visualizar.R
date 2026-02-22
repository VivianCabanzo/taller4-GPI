# scripts/04_visualizar.R

source("src/plot_results.R")

# Leer datos procesados
proc <- read.csv("data/processed/datos_procesados.csv")

# Asegurar carpeta de salida
dir.create("results/figures", recursive = TRUE, showWarnings = FALSE)

# Generar figuras
plot_hist_ingreso(proc, "results/figures/hist_ingreso.png")
plot_box_ingreso_por_grupo(proc, "results/figures/box_ingreso_grupo.png")

cat("OK: figuras generadas en results/figures/\n")