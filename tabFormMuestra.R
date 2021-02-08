library(shinydashboard)
tabFormMuestra <- tabItem(tabName = "addmuestra",
                          h2("Agregar muestra"),
                          fluidPage(
                            fluidRow(
                              column(width = 1),
                              column(
                                width = 10,
                                conditionalPanel(
                                  condition = "1==0",
                                  numericInput(
                                    inputId = "idmuestra",
                                    label = "Id muestra",
                                    value = 0
                                  )
                                ),
                                numericInput(
                                  inputId = "pesomuestra",
                                  label = "Peso",
                                  value = 0
                                ),
                                numericInput(
                                  inputId = "longitudmuestra",
                                  label = "Longitud",
                                  value = 0
                                ),
                                numericInput(
                                  inputId = "anchomuestra",
                                  label = "Ancho",
                                  value = 0
                                ),
                                numericInput(
                                  inputId = "espesormuestra",
                                  label = "Espesor",
                                  value = 0
                                )
                              ),
                              column(width = 1)
                            ),
                            actionButton(inputId = "btnGuardarMuestra", label = "Guardar muestra")
                          ))