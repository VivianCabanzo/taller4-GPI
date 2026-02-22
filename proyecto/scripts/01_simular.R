
# scripts/01_simular.R

# Cargar funciones (desde proyecto/)
source("src/simulacion.R")

# Crear carpeta si no existe
if (!dir.exists("data/raw")) {
  dir.create("data/raw", recursive = TRUE)
}

# Semilla
set.seed(123)

# Simulación
datos <- simular(n = 1000, seed = 123)

# Guardar
write.csv(
  datos,
  "data/raw/datos_simulados.csv",
  row.names = FALSE
)

cat("Datos guardados en proyecto/data/raw/datos_simulados.csv\n")