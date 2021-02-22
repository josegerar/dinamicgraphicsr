library(shinydashboard)
source("dataPostgres.R")
source("tabGraficos.R")
source("tabFormMuestra.R")
source("tabMuestras.R")
source('tabUploadFile.R')
# head(iris)


ui <- dashboardPage(
  dashboardHeader(title = "Tarea 10"),
  dashboardSidebar(
    sidebarMenu(
      id = "tabs",
      menuItem("Graficos", tabName = "graficos", icon = icon("th")),
      menuItem("Añadir muestra", tabName = "addmuestra", icon = icon("th")),
      menuItem("Ver muestras", tabName = "muestras", icon = icon("th")),
      menuItem("Subir muestras", tabName = "upload", icon = icon("th"))
    )
  ),
  dashboardBody(
    tabItems(tabGraficos,
             tabFormMuestra,
             tabMuestras,
             tabUploadFile)
  )
)