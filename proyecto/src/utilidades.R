# /src/utilidades.R
# Funciones de utilidad

# Calcular media y desviación estándar
resumen_basico <- function(x) {
  c(
    media = mean(x, na.rm = TRUE),
    sd    = sd(x, na.rm = TRUE),
    min   = min(x, na.rm = TRUE),
    max   = max(x, na.rm = TRUE)
  )
}

# Normalizar vector
normalizar <- function(x) {
  (x - min(x, na.rm = TRUE)) /
    (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
}