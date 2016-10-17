rankingcompleto <- function(resultado, num = "mejor") {
    setwd("C:/Users/Pablo Rendon/Documents/GitHub/Programacion_Actuarial_III_OT2016")
    #Lectura de datos
        data<- read.csv("outcome-of-care-measures.csv")
            s <- numeric()
    #Validación de datos
        if (resultado == "ataque"){
            columna <- 11
                }  else if (resultado == "falla"){ 
                    columna <- 17
                        }   else if (resultado == "neumonia") {
                            columna <- 23
                                }    else {
                                    stop("resultado inválido")
                                    }       
    data[,2] <- as.character(data[, 2])
        St <- levels(data$State)
            n <- length(St)
                for(i in 1:n) {
                    EstadoI <- data[St[i] == data$State,]
                        co1 <- EstadoI[, columna]
                            or <- EstadoI[order(co1, na.last = NA), ]
                        primero <- or[1,2]
                    ultimo <- or[nrow(or),2]
                        if(num == "mejor"){
                            numm <- primero
                                }else if(num == "peor"){
                                    numm <- ultimo
                                        }else if (is.numeric(num)==TRUE){
                                        numm <- or[num, 2]
                                    } else{
                                stop("num no es número")
                                    }
                            Hosp <- c(numm, St[i])
                        s <- append(s,Hosp)
                    }
        m <- matrix(s,n,2,byrow = T)
            colnames(m) <- c("Hospital", "Estado")
                rownames(m)<- St
                    DATOS <- data.frame(m)
    DATOS
}

head(rankingcompleto("ataque", 20), 10)
tail(rankingcompleto("neumonia", "peor"), 3)
