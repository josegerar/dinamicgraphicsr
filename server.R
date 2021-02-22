library(DT)
library(readxl)
library(rio)
library(shiny)
source("dataPostgres.R")
source("graficos.R")
source("functions.R")
source('uploadManager.R')
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
      if (dataPostgres[i,][1] == selectedRow) {
        updateNumericInput(session, "idmuestra", value = as.numeric(dataPostgres[i,][1]))
        updateNumericInput(session, "pesomuestra", value = as.numeric(dataPostgres[i,][2]))
        updateNumericInput(session, "longitudmuestra", value = as.numeric(dataPostgres[i,][3]))
        updateNumericInput(session, "anchomuestra", value = as.numeric(dataPostgres[i,][4]))
        updateNumericInput(session, "espesormuestra", value = as.numeric(dataPostgres[i,][5]))
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
  
  observeEvent(input$uploadXLS, {
    if (is.null(input$uploadXLS)) {
      showNotification("xls o xlsx no seleccionado")
    }
    inFile <- input$uploadXLS
    ext <- tools::file_ext(inFile$datapath)
    req(inFile)
    validate(need(
      ext == "xls" ||
        ext == "xlsx",
      "Por favor, seleccione un archivo xls o xlsx"
    ))
    file.rename(inFile$datapath,
                paste(inFile$datapath, ".xlsx", sep = ""))
    process_xsl = read_excel(paste(inFile$datapath, ".xlsx", sep = ""),
                             1,
                             col_names = input$header)
    update_select_input_data(session, process_xsl, CASO_ESTUDIO_FIELD, "selectcasoestudio")
    update_select_input_data(session, process_xsl, MUESTRA_FIELD, "selectmuestraupload")
    update_select_input_data(session, process_xsl, PESO_FIELD, "selectpesoupload")
    update_select_input_data(session, process_xsl, LONGITUD_FIELD, "selectlongitudupload")
    update_select_input_data(session, process_xsl, ANCHO_FIELD, "selectanchoupload")
    update_select_input_data(session, process_xsl, PESO_FIELD, "selectespesorupload")
    update_select_input_data(session, process_xsl, PESO_FIELD, "selectyearmuestraupload")
    update_select_input_data(session, process_xsl, PESO_FIELD, "selectmesmuestraupload")
    update_select_input_data(session, process_xsl, PESO_FIELD, "selectdiamuestraupload")
  }, ignoreInit = TRUE, ignoreNULL = FALSE)
  
  dataXSL <- reactive({
    if (is.null(input$uploadXLS)) {
      showNotification("xls o xlsx no seleccionado")
    }
    inFile <- input$uploadXLS
    ext <- tools::file_ext(inFile$datapath)
    req(inFile)
    validate(need(
      ext == "xls" ||
        ext == "xlsx",
      "Por favor, seleccione un archivo xls o xlsx"
    ))
    file.rename(inFile$datapath,
                paste(inFile$datapath, ".xlsx", sep = ""))
    process_xsl = read_excel(paste(inFile$datapath, ".xlsx", sep = ""),
                             1,
                             col_names = input$header)
    data_process = proccess_data(
      data = process_xsl, 
      name_ce = input$selectcasoestudio, 
      name_m = input$selectmuestraupload, 
      name_p = input$selectpesoupload, 
      name_a = input$selectanchoupload, 
      name_e = input$selectespesorupload, 
      name_l = input$selectlongitudupload,
      name_am = input$selectyearmuestraupload,
      name_mm = input$selectmesmuestraupload,
      name_dm = input$selectdiamuestraupload
    )
    #data_process = get_field_data(data = process_xsl)
    data_process
  })
  
  observeEvent(input$btnGuardarArchivo, {
    if (is.null(input$uploadXLS)) {
      showNotification("xls o xlsx no seleccionado")
    }
    inFile <- input$uploadXLS
    ext <- tools::file_ext(inFile$datapath)
    req(inFile)
    validate(need(
      ext == "xls" ||
        ext == "xlsx",
      "Por favor, seleccione un archivo xls o xlsx"
    ))
    export(dataXSL(), "./datos/cacao.json")
  })
  
  output$contentsUpload <- renderTable({
    dataXSL()
  })
}