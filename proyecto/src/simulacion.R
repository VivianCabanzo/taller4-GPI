# simulacion
simular <- function(n = 1000, seed = 123) {
  set.seed(seed)

  # Ejemplo genérico: ajusta a tu Taller 2
  data.frame(
    id = 1:n,
    grupo = sample(c("ocupado", "desempleado"), n, replace = TRUE, prob = c(0.7, 0.3)),
    edad = sample(18:65, n, replace = TRUE),
    ingreso = round(rlnorm(n, meanlog = 10, sdlog = 0.35))
  )
}