library(DT)
source("dataPostgres.R")
source("graficos.R")
source("functions.R")
dataPostgres = getDataPostgres()
RV <- reactiveValues(data = dataPostgres)


server <- function(input, output, session) {
  dataPostgres = getDataPostgres()
  df <- reactiveValues(data = getTable(dataPostgres))
  
  observeEvent(input$btnGuardarMuestra, {
    idm = as.numeric(input$idmuestra)
    if (idm > 0) {
      editMuestra(
        idm,
        input$pesomuestra,
        input$longitudmuestra,
        input$anchomuestra,
        input$espesormuestra
      )
    } else{
      saveMuestra(
        input$pesomuestra,
        input$longitudmuestra,
        input$anchomuestra,
        input$espesormuestra
      )
    }
    
    updateNumericInput(session, "idmuestra", value = 0)
    updateNumericInput(session, "longitudmuestra", value = 0)
    updateNumericInput(session, "anchomuestra", value = 0)
    updateNumericInput(session, "espesormuestra", value = 0)
    updateNumericInput(session, "pesomuestra", value = 0)
    dataPostgres = getDataPostgres()
    df$data = getTable(dataPostgres)
    RV$data = dataPostgres
    newtab <- switch(input$tabs,
                     "addmuestra" = "muestras")
    updateTabItems(session, "tabs", newtab)
  })
  
  observeEvent(input$select_button_edit, {
    selectedRow <-
      as.numeric(strsplit(input$select_button_edit, "_")[[1]][2])
    output$textouput <- renderText({
      selectedRow
    })
    for (i in seq_len(nrow(dataPostgres))) {
      if (dataPostgres[i, ][1] == selectedRow) {
        updateNumericInput(session, "idmuestra", value = as.numeric(dataPostgres[i, ][1]))
        updateNumericInput(session, "pesomuestra", value = as.numeric(dataPostgres[i, ][2]))
        updateNumericInput(session, "longitudmuestra", value = as.numeric(dataPostgres[i, ][3]))
        updateNumericInput(session, "anchomuestra", value = as.numeric(dataPostgres[i, ][4]))
        updateNumericInput(session, "espesormuestra", value = as.numeric(dataPostgres[i, ][5]))
      }
    }
    newtab <- switch(input$tabs,
                     "muestras" = "addmuestra")
    updateTabItems(session, "tabs", newtab)
  })
  
  observeEvent(input$select_button_delete, {
    selectedRow <-
      as.numeric(strsplit(input$select_button_delete, "_")[[1]][2])
    output$textouput <- renderText({
      selectedRow
    })
    deletemuestra(selectedRow)
    dataPostgres = getDataPostgres()
    df$data = getTable(dataPostgres)
    RV$data = dataPostgres
  })
  
  observe({
    cantidad = as.integer(input$selectcantidadgraficos)
    # variable = as.numeric(input$selectvariables)
    variable = input$selectvariables
    g1 = 0
    g2 = 0
    g3 = 0
    g4 = 0
    if (cantidad >= 1) {
      g1 = as.integer(input$sgrafico1)
    }
    if (cantidad >= 2) {
      g2 = as.integer(input$sgrafico2)
    }
    if (cantidad >= 3) {
      g3 = as.integer(input$sgrafico3)
    }
    if (cantidad >= 4) {
      g4 = as.integer(input$sgrafico4)
    }
    output$resultado <- renderPlot({
      managerGraphics(RV$data, variable, cantidad, g1, g2, g3, g4)
    })
    
    # output$tablemuestras = DT::renderDataTable({
    #   RV$data
    # })
    
    output$tablemuestras <- DT::renderDataTable(df$data,
                                                server = FALSE,
                                                escape = FALSE,
                                                selection = 'none')
  })
}