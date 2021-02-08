library(shinydashboard)
dataPostgres = getDataPostgres()

tabGraficos <- tabItem(tabName = "graficos",
                       h2("Datos de cacao"),
                       fluidPage(
                         fluidRow(column(
                           width = 6,
                           selectInput(
                             inputId = "selectvariables",
                             label = "Seleccione la variable a mostrar",
                             choices = names(dataPostgres)
                           )
                         ),
                         column(
                           width = 6,
                           selectInput(
                             inputId = "selectcantidadgraficos",
                             label = "Seleccione la cantidad de graficos a mostrar",
                             choices = list(
                               "1 grafico" = 1,
                               "2 graficos" = 2,
                               "3 graficos" = 3,
                               "4 graficos" = 4
                             )
                           )
                         )),
                         h3("Selecione los graficos a mostrar"),
                         fluidRow(
                           column(
                             width = 3,
                             selectInput(
                               inputId = "sgrafico1",
                               label = "Grafico 1",
                               choices = list(
                                 "Histograma" = 1,
                                 "Densidad" = 2,
                                 "Boxplot" = 3,
                                 "Poligono" = 4
                               )
                             )
                           ),
                           column(
                             width = 3,
                             conditionalPanel(
                               condition = "input.selectcantidadgraficos >= 2",
                               selectInput(
                                 inputId = "sgrafico2",
                                 label = "Grafico 2",
                                 choices = list(
                                   "Histograma" = 1,
                                   "Densidad" = 2,
                                   "Boxplot" = 3,
                                   "Poligono" = 4
                                 )
                               )
                             )
                           ),
                           column(
                             width = 3,
                             conditionalPanel(
                               condition = "input.selectcantidadgraficos >= 3",
                               selectInput(
                                 inputId = "sgrafico3",
                                 label = "Grafico 3",
                                 choices = list(
                                   "Histograma" = 1,
                                   "Densidad" = 2,
                                   "Boxplot" = 3,
                                   "Poligono" = 4
                                 )
                               )
                             )
                           ),
                           column(
                             width = 3,
                             conditionalPanel(
                               condition = "input.selectcantidadgraficos >= 4",
                               selectInput(
                                 inputId = "sgrafico4",
                                 label = "Grafico 4",
                                 choices = list(
                                   "Histograma" = 1,
                                   "Densidad" = 2,
                                   "Boxplot" = 3,
                                   "Poligono" = 4
                                 )
                               )
                             )
                           )
                         ),
                         plotOutput("resultado")
                       ))