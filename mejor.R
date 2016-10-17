mejor <- function(estado, resultado){
    # Lectura de datos 
    setwd("C:/Users/Pablo Rendon/Documents/GitHub/Programacion_Actuarial_III_OT2016")
    datos <- read.csv("outcome-of-care-measures.csv",na.strings = c("Not Available"))
    # Revisión de la validez de estado y resultado 
     resultados <- c("falla","neumonía", "ataque")
     estados <- datos[ , 7]
    if ((estado %in% estados) == FALSE) {
        stop(print("estado inválido"))
    } else if ((resultado %in% resultados)==FALSE){
        stop(print("resultado inválido"))
    }
    # Regresa el nombre del hospital con la tasa más baja de mortalidad de 30 días 
    
    data <- subset(datos, State == estado)
    if (resultado == "ataque") {
        columna <- 11
    }
    else if (resultado == "falla") {
        columna <- 17
    }
    else {
        columna <- 23
    }
    datosrequeridos <- as.numeric(data[,columna])
    bad <- is.na(datosrequeridos)
    desired_data <- data[!bad,]
    columns_considered <- as.numeric(desired_data[,columna])
    desired_rows <- which(columns_considered == min(columns_considered))
    desired_hospitals <-as.vector(desired_data[desired_rows,2])
    if (length(desired_hospitals) > 1) {
        hospitals_sorted <- sort(desired_hospitals)
        hospitals_sorted[1]
    }else {
        desired_hospitals
    }
}
mejor("MD", "ataque")
mejor("TX", "falla") 
mejor("MD", "neumonía") 
mejor("TX", "ataque") 
mejor("NY", "atakue") 
      