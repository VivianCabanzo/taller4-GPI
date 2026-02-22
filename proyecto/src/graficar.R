# src/graficar.R

plot_hist_ingreso <- function(df, outpath) {
  png(outpath, width = 900, height = 600)
  hist(df$ingreso,
       main = "Histograma de ingreso",
       xlab = "Ingreso",
       col = "red")
  dev.off()
}

plot_box_ingreso_por_grupo <- function(df, outpath) {
  png(outpath, width = 900, height = 600)
  boxplot(ingreso ~ grupo, data = df,
          main = "Ingreso por grupo",
          xlab = "Grupo",
          ylab = "Ingreso",
          col = "red")
  dev.off()
}