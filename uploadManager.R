CASO_ESTUDIO_FIELD = 'caso_estudio'
MUESTRA_FIELD = 'muestra'
ANCHO_FIELD = 'ancho'
PESO_FIELD = 'peso'
ESPESOR_FIELD = 'espesor'
LONGITUD_FIELD = 'longitud'
YEAR_FIELD = 'año'
MES_FIELD = 'mes'
DIA_FIELD = 'dia'

get_dataset = function(n_row){
  dataset <- data.frame(matrix(ncol = 9, nrow = n_row))
  nombres_columnas <- c(
    CASO_ESTUDIO_FIELD, 
    MUESTRA_FIELD, 
    PESO_FIELD, 
    ANCHO_FIELD, 
    ESPESOR_FIELD, 
    LONGITUD_FIELD,
    YEAR_FIELD,
    MES_FIELD,
    DIA_FIELD
  )
  colnames(dataset) <- nombres_columnas
  return(dataset)
}

get_field_data = function(name, data){
  ds_cacao = get_dataset(n_row = nrow(data))
  for (ic in seq_len(ncol(ds_cacao))) {
    for (id in seq_len(ncol(data))) {
      if(names(data)[id] == names(ds_cacao)[ic]){
        ds_cacao[ic] = data[id]
      }
    }
  }
  return(ds_cacao)
}

proccess_data = function(data, name_ce, name_m, name_p, name_a, name_e, name_l, name_am, name_mm, name_dm){
  ds_cacao = get_dataset(n_row = nrow(data))
  for (id in seq_len(ncol(data))) {
    if(names(data)[id] == name_ce){
      ds_cacao[1] = data[id]
    }
    if(names(data)[id] == name_m){
      ds_cacao[2] = data[id]
    }
    if(names(data)[id] == name_p){
      ds_cacao[3] = data[id]
    }
    if(names(data)[id] == name_a){
      ds_cacao[4] = data[id]
    }
    if(names(data)[id] == name_e){
      ds_cacao[5] = data[id]
    }
    if(names(data)[id] == name_l){
      ds_cacao[6] = data[id]
    }
    if(names(data)[id] == name_am){
      ds_cacao[7] = data[id]
    }
    if(names(data)[id] == name_mm){
      ds_cacao[8] = data[id]
    }
    if(names(data)[id] == name_dm){
      ds_cacao[9] = data[id]
    }
  }
  return(ds_cacao)
}

get_index_fiel = function(data, label_search){
  for (i in seq_len(ncol(data))) {
    if(names(data)[i] == label_search){
      return(i)
    }
  }
  return(1)
}