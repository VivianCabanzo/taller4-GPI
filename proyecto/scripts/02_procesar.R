# scripts/02_procesar.R

# Cargar función de procesamiento
source("src/procesar.R")

library(jsonlite)

ZENODO_ID <- "18855092"

# Leer metadatos del registro desde la API de Zenodo
api_url <- paste0("https://zenodo.org/api/records/", ZENODO_ID)
meta <- jsonlite::fromJSON(api_url)

# Tomar el primer archivo del registro
file_url <- meta$files$links$self[1]

# Descargar temporalmente el archivo y leerlo
tmp <- tempfile(fileext = ".csv")
download.file(file_url, destfile = tmp, mode = "wb")
datos_raw <- read.csv(tmp)

# Procesar
datos_proc <- procesar_datos(datos_raw)

# Crear carpeta si no existe
dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)

# Guardar datos procesados
write.csv(
  datos_proc,
  "data/processed/datos_procesados.csv",
  row.names = FALSE
)

cat("OK: datos descargados desde Zenodo, procesados y guardados en data/processed/\n")