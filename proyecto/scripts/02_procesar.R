# scripts/02_procesar.R

source("src/procesar.R")
# Leer datos crudos
raw <- read.csv("data/raw/datos_simulados.csv")

# Procesar
proc <- procesar_datos(raw)

# Crear carpeta si no existe
dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)

# Guardar datos procesados
write.csv(
  proc,
  "data/processed/datos_procesados.csv",
  row.names = FALSE
)

cat("OK: datos procesados guardados en data/processed/\n")