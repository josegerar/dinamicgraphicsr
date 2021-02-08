shinyInput <- function(FUN, len, id, ids, ...) {
  inputs <- character(len)
  for (i in seq_len(len)) {
    inputs[i] <- as.character(FUN(paste0(id, ids[i]), ...))
  }
  inputs
}

getTable <- function(dataref) {
  datatb = data.frame(
    dataref,
    Accion = shinyInput(
      actionButton,
      nrow(dataref),
      'button_',
      ids = dataref[, 1],
      label = "Editar",
      onclick = 'Shiny.onInputChange(\"select_button_edit\",  this.id)'
    ),
    Accion = shinyInput(
      actionButton,
      nrow(dataref),
      'button_',
      ids = dataref[, 1],
      label = "Eliminar",
      onclick = 'Shiny.onInputChange(\"select_button_delete\",  this.id)'
    ),
    stringsAsFactors = FALSE,
    row.names = dataref$id
  )
  return(datatb)
}
