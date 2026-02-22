
# 04_modelo.R

# Cargar datos
datos <- read.csv("data/raw/datos_simulados.csv")

# Convertir variable a binaria
datos$desempleado <- ifelse(datos$grupo == "desempleado", 1, 0)

# Modelo logístico
modelo <- glm(desempleado ~ edad + ingreso,
              data = datos,
              family = binomial)

# Resumen
summary(modelo)

# Guardar resultados
sink("results/models/modelo_resumen.txt")
summary(modelo)
sink()

cat("Modelo ejecutado y resumen guardado en results/\n")