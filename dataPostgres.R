library(DBI)
library(odbc)

con <- DBI::dbConnect(odbc::odbc(),
                      #Driver   = "PostgreSQL Unicode",
                      Driver   = "PostgreSQL ODBC Driver(UNICODE)",
                      Server   = "localhost",
                      Database = "cacao",
                      UID      = "postgres",
                      PWD      = "123456",
                      Port     = 5432)


getDataPostgres = function(){
  query <- dbSendQuery(con, 
                       "SELECT id, peso_promedio,longitud,ancho, espesor FROM muestra")
  data <- dbFetch(query)
  return(data)
}