rankhospital <- function(estado,resultado,num="best"){
    # Lectura de datos 
        setwd("C:/Users/Pablo Rendon/Documents/GitHub/Programacion_Actuarial_III_OT2016")
            datos <- read.csv("outcome-of-care-measures.csv",na.strings = c("Not Available"),colClasses=c("character"))
    # Revisión de la validez de estado y resultado 
        resultados <- c("falla","neumonía", "ataque")
        ranking2 <- vector(mode="numeric")
            estados <- datos[ , 7]
                if ((estado %in% estados) == FALSE) {
                    stop(print("estado inválido"))
                }  else if ((resultado %in% resultados)==FALSE){
                    stop(print("resultado inválido"))
                }
        data <- subset(datos,State == estado)
            if (resultado == "ataque") {
                columna <- 11
            }   else if (resultado == "falla") {
                    columna <- 17
                }   else {
                        columna <- 23
                }
        if (num=="mejor"){
            num <- 1
        }else if (num=="peor"){
            faltantes <- is.na(data[,columna])
            num <- nrow(data)- sum(faltantes)
        } else if(is.numeric(num)==FALSE){
            stop("num no es número")
        }
        nombrehospital <-  c(as.character(data[,2]))
        tasa <-c(as.numeric(data[,columna]))
        orden <- as.integer(rank(tasa))
        matriz <- rbind(nombrehospital,tasa,orden)
        filasconsideradas <- as.numeric(which(matriz[3,] == num))
        largo <- length(filasconsideradas)
        maximo <- as.integer(max(orden))
       
        if (maximo<num){
            ranking <- c(Na)
        } else{
            if (largo>1){
                for (i in 1:largo){
                    ranking2[i] <- matriz[1,filasconsideradas[i]] 
                    ranking<- min(ranking2)
                    } 
            }   else if (largo ==1){
                            ranking <- matriz[1,filasconsideradas]
            } else{
                for (i in 1:largo){
                filasconsideradas <- as.numeric(which(matriz[3,] == num-1))
                ranking2[i] <- matriz[1,filasconsideradas[i]]    
                ranking <- max(ranking2)            
                }
            }    
        }
      ranking
 }
rankhospital("AL", "ataque", 1)
rankhospital("AL", "ataque", "mejor")
 rankhospital("TX", "falla", 4)
 rankhospital("MD", "ataque", "peor")

 