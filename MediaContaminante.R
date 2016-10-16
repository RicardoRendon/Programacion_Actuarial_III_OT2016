mediacontaminante <- function(directorio, contaminante, id = 1:332) {
    ni <- 0
    resultado <- vector(mode="numeric",1)
    c <- vector(mode="numeric",1)
    s <- vector(mode="numeric",1)
    
    for (i in id){
   ni = ni+1
   if (i<10){
    id=paste("00",i,sep = "")
  } else {
    if (i<100){
      id=paste("0",i,sep = "")
    } else {
      id=paste(i,sep="")
    }
  }
  Archivo <- c("C:/Users/Pablo Rendon/Documents/GitHub/Programacion_Actuarial_III_OT2016")
  data <- read.csv(paste(Archivo,"/",directorio,"/",id,".csv",sep = ""),header = TRUE)
  
  if (contaminante=="nitrate"){
    columna <- 3 
  } else if (contaminante=="sulfate") {
    columna <- 2
  }
 c <- sum(complete.cases(data[,columna]))+c
  s <- sum(data[,columna], na.rm = TRUE)+s
 }
  resultado <- (s/c)
  resultado
}

mediacontaminante("specdata","nitrate",2:4)

