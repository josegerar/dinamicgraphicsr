library(ggplot2)
library(gridExtra)

get_histogram = function(datos, xlab, titlelab){
  bindw = (max(xlab)- min(xlab))/ceiling(sqrt(length(datos)))
  hist = ggplot(datos , aes(x =xlab)) +
    geom_histogram(bins = nclass.Sturges(xlab)) +
    labs(title = "Histograma", x = titlelab, y = "Frecuencia", caption = "") +
    theme(axis.text.x = element_text(size=9, angle=90, hjust = 1),
          axis.text.y = element_text(size=9, angle=0))
  return(hist)
}
get_density = function(datos, xlab, titlelab){
  dens = ggplot(datos, aes(x = xlab)) +
    geom_density(aes(y = ..density..)) +
    labs(title = "Densidad", x = titlelab, y = "Frecuencia", caption = "") +
    theme(axis.text.x = element_text(size=9, angle=90, hjust = 1),
          axis.text.y = element_text(size=9, angle=0))
  return(dens)
}

get_polyn = function(datos, xlab, titlelab){
  plyn = ggplot(datos, aes(x = xlab)) +
    geom_freqpoly(bins = nclass.Sturges(xlab)) +
    labs(title = "Poligono", x = titlelab, y = "Frecuencia", caption = "") +
    theme(axis.text.x = element_text(size=9, angle=90, hjust = 1),
          axis.text.y = element_text(size=9, angle=0))
  return(plyn)
}

get_boxplot = function(datos, xlab, titlelab){
  bptx = ggplot(datos, aes(x = xlab)) +
    geom_boxplot() +
    labs(title = "Boxplot", x = titlelab, y = "Frecuencia", caption = "") +
    theme(axis.text.x = element_text(size=9, angle=90, hjust = 1),
          axis.text.y = element_text(size=9, angle=0))
  return(bptx)
}

get_graphic = function(data, columdata, columname, gnum){
  graphic = NULL
  if(gnum == 1){
    graphic = get_histogram(data, columdata, columname)
  } else if(gnum == 2){
    graphic = get_density(data, columdata, columname)
  } else if(gnum == 3){
    graphic = get_boxplot(data, columdata, columname)
  } else if(gnum == 4){
    graphic = get_polyn(data, columdata, columname)
  }
  return(graphic)
}

managerGraphics = function(data, columname, cant, g1, g2, g3, g4){
  gr1 = get_graphic(data, as.numeric(as.factor(unlist(data[columname]))), columname, g1)
  gr2 = get_graphic(data, as.numeric(as.factor(unlist(data[columname]))), columname, g2)
  gr3 = get_graphic(data, as.numeric(as.factor(unlist(data[columname]))), columname, g3)
  gr4 = get_graphic(data, as.numeric(as.factor(unlist(data[columname]))), columname, g4)
  res = NULL
  if(cant == 1){
    res = gr1
  } else if(cant == 2){
    res = grid.arrange(gr1, gr2, nrow = 1, ncol = 2)
  } else if(cant == 3){
    arrs = arrangeGrob(gr2, gr3, nrow = 1, ncol = 2)
    res = grid.arrange(gr1, arrs, nrow = 2, ncol = 1)
  } else {
    res = grid.arrange(gr1, gr2, gr3, gr4, nrow = 2, ncol = 2)
  }
  return(res)
}
