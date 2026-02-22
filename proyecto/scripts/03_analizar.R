# scripts/03_analizar.R

# Leer datos procesados
proc <- read.csv("data/processed/datos_procesados.csv")

# Cálculos: ingreso promedio por grupo
tabla_ingreso <- aggregate(
  proc$ingreso,
  list(
    grupo = proc$grupo,
    edad_grupo = proc$edad_grupo
  ),
  mean
)

colnames(tabla_ingreso)[3] <- "ingreso_promedio"

# Crear carpeta
dir.create("results/tables", recursive = TRUE, showWarnings = FALSE)

# Guardar tabla
write.csv(
  tabla_ingreso,
  "results/tables/ingreso_promedio.csv",
  row.names = FALSE
)

cat("OK: tabla generada en results/tables/\n")