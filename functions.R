#source('uploadManager.R')
shinyInput <- function(FUN, len, id, ids, ...) {
  inputs <- character(len)
  for (i in seq_len(len)) {
    inputs[i] <- as.character(FUN(paste0(id, ids[i]), ...))
  }
  inputs
}

update_select_input_data = function(session, data_proccess, label_search_data, select_name){
  updateSelectInput(
    session,
    select_name,
    choices = names(data_proccess),
    selected = tail(names(data_proccess)[get_index_fiel(data = data_proccess, label_search = label_search_data)], 1)
  )
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
