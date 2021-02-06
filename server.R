source("dataPostgres.R")
source("graficos.R")

server <- function(input, output) {
  # dataPostgres = getDataPostgres()
  dataPostgres = iris
  observe({
    cantidad = as.integer(input$selectcantidadgraficos)
    # variable = as.numeric(input$selectvariables)
    variable = input$selectvariables
    g1 = 0
    g2 = 0
    g3 = 0
    g4 = 0
    if(cantidad >= 1){
      g1 = as.integer(input$sgrafico1)
    }
    if(cantidad >= 2){
      g2 = as.integer(input$sgrafico2)
    }
    if(cantidad >= 3){
      g3 = as.integer(input$sgrafico3)
    }
    if(cantidad >= 4){
      g4 = as.integer(input$sgrafico4)
    }
    output$resultado <- renderPlot({
      managerGraphics(dataPostgres, variable, cantidad, g1, g2, g3, g4)
    })
  })
}
