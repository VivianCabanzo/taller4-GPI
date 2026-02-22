# src/procesar.R

procesar_datos <- function(df) {

  # Quitar filas con NA
  df <- na.omit(df)

  # Variables derivadas
  df$edad_grupo <- cut(
    df$edad,
    breaks = c(18, 30, 45, 65),
    labels = c("18-29", "30-44", "45-65"),
    include.lowest = TRUE
  )

  # Asegurar tipos
  df$grupo <- as.factor(df$grupo)

  return(df)
}