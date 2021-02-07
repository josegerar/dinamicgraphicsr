library(DBI)
library(odbc)

con <- DBI::dbConnect(
  odbc::odbc(),
  #Driver   = "PostgreSQL Unicode",
  Driver   = "PostgreSQL ODBC Driver(UNICODE)",
  Server   = "localhost",
  Database = "cacao",
  UID      = "postgres",
  PWD      = "123456",
  Port     = 5432
)


getDataPostgres = function() {
  query <- dbSendQuery(con,
                       "SELECT id, peso_promedio,longitud,ancho, espesor FROM muestra")
  data <- dbFetch(query)
  dbClearResult(query)
  return(data)
}

deletemuestra <- function(id){
  dbExecute(conn = con, paste("delete from muestra where id=", id))
}

editMuestra <- function(id, peso, longitud, ancho, espesor){
  dbExecute(
    conn = con,
    paste("update muestra set peso_promedio=", peso, ", longitud="
          , longitud, ", ancho=", ancho, ", espesor=", espesor, " where id=", id)
  )
}

saveMuestra <- function(peso, longitud, ancho, espesor) {
  dbExecute(
    con,
    paste(
      "INSERT INTO muestra (peso_promedio, longitud, ancho, espesor)VALUES ("
      ,
      peso
      ,
      ","
      ,
      longitud
      ,
      ","
      ,
      ancho
      ,
      ","
      ,
      espesor
      ,
      ")"
    )
    , immediate = TRUE
  )
}
