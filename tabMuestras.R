library(shinydashboard)
tabMuestras <- tabItem(tabName = "muestras",
                       h2("Muestras"),
                       fluidPage(
                         fluidRow(
                           column(width = 1),
                           column(width = 10,
                                  DT::dataTableOutput("tablemuestras")),
                           column(width = 1)
                         ),
                         textOutput(outputId = "textouput")
                       ))