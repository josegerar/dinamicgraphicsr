#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
source("ui.R")

# Define server logic required to draw a histogram
source("server.R")

# Run the application 
if (interactive()) {
    shinyApp(ui = ui, server = server)
}

