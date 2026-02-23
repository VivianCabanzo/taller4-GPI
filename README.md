# taller4-GPI

Este repositorio contiene el desarrollo del **Taller 4** del curso *Gestión de Proyectos de Investigación y Ciencia Abierta*.

El proyecto incluye la planificación, control de versiones, y documentación de flujos de trabajo reproducibles.

---

## Autora

Vivian Cabanzo

Curso: Gestión de Proyectos de Investigación y Ciencia Abierta

Universidad de los Andes

## Estructura del repositorio

taller4-GPI/
│
├── proyecto/ # Proyecto principal en R
├── renv/ # Entorno reproducible de R
├── renv.lock # Archivo de dependencias
│
├── workflows/ # Diagramas de flujo de trabajo
│ ├── diagram.mermaid
│ └── diagram.drawio
│
├── pdf/ # Documento final
│ └── taller4.pdf
│
├── LICENSE # Licencia MIT
└── README.md # Documentación del proyecto

## Reproducibilidad

Este proyecto utiliza `renv` para gestionar las dependencias en R.

Para restaurar el entorno:

```r
renv::restore()

