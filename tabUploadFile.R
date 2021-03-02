library(shinydashboard)
library(shiny)
library(DT)
tabUploadFile <- tabItem(
  tabName = "upload",
  h2('Subir archivos con datos de muestras'),
  sidebarLayout(
    # Sidebar panel for inputs ----
    sidebarPanel(
      # Input: Select a file ----
      fileInput(
        "uploadXLS",
        "Seleccione archivo xlsx o xls a subir",
        multiple = FALSE,
        accept = c(".xlsx", '.xls')
      ),
      
      # Horizontal line ----
      tags$br(),
      fluidRow(
        column(
          width = 6,
          # Input: Checkbox if file has header ----
          checkboxInput("header", "Encabezado", TRUE),
          selectInput(
            inputId = "selectcasoestudio",
            label = "Columna caso de estudio",
            choices = c('Seleccione')
          ),
          selectInput(
            inputId = "selectmuestraupload",
            label = "Columna muestra",
            choices = c('Seleccione')
          ),
          selectInput(
            inputId = "selectyearmuestraupload",
            label = "Columna año muestra",
            choices = c('Seleccione')
          ),
          selectInput(
            inputId = "selectmesmuestraupload",
            label = "Columna mes muestra",
            choices = c('Seleccione')
          ),
          selectInput(
            inputId = "selectdiamuestraupload",
            label = "Columna dia muestra",
            choices = c('Seleccione')
          )
        ),
        column(
          width = 6,
          selectInput(
            inputId = "selectpesoupload",
            label = "Columna peso",
            choices = c('Seleccione')
          ),
          selectInput(
            inputId = "selectlongitudupload",
            label = "Columna longitud",
            choices = c('Seleccione')
          ),
          selectInput(
            inputId = "selectanchoupload",
            label = "Columna ancho",
            choices = c('Seleccione')
          ),
          selectInput(
            inputId = "selectespesorupload",
            label = "Columna espesor",
            choices = c('Seleccione')
          )
        )
      )
    ),
    
    mainPanel(
      fluidRow(column(
        width = 12,
        DT::dataTableOutput("contentsUpload")
      )),
      actionButton(inputId = "btnGuardarArchivo", label = "Guardar muestras de archivo")
    )
    
  )
)