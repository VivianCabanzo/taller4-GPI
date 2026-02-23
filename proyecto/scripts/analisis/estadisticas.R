# analisis/estadisticas.R


datos <- read.csv("proyecto/data/raw/datos_simulados.csv")

#: función mean mal escrita (meen)
media_edad <- mean(datos$edad)

sd_ingreso <- sd(datos$ingreso)

summary(datos)

cat("Media edad:", media_edad, "\n")
cat("SD ingreso:", sd_ingreso, "\n")