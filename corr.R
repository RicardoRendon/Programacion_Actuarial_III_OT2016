corr <- function(directorio, horizonte=0){ 
  Archivo <- c("C:/Users/Pablo Rendon/Documents/GitHub/Programacion_Actuarial_III_OT2016")
  g<-vector("numeric",1)
  h <-vector("numeric",1)
  Registro <- vector(mode = "numeric",1)
  a=1
  g <- vector(mode = "numeric")
  for (i in 1:332){
    if (i <10){
      Ubicación<-paste(Archivo,"/",directorio,"/","00",i,".csv",sep="")
      Archivo2<-read.csv(Ubicación)
    } else if (i<100){
      Ubicación<-paste(Archivo,"/",directorio,"/0",i,".csv",sep="")
      Archivo2<-read.csv(Ubicación)
    } else{
      Ubicación<-paste(Archivo,"/",directorio,"/",i,".csv",sep="")
      Archivo2<-read.csv(Ubicación)
    }
    cc = sum(complete.cases(Archivo2))
    if (cc > horizonte){
      completos <- complete.cases(Archivo2) 
      Archivo2 <- Archivo2[completos,]
      x <- Archivo2["sulfate"]
      y <- Archivo2["nitrate"]
      w1<-(cor(x,y))
      Registro[a]<-(c(g,w1))
      a= a+1
    }
    
  }
Registro
}

cr <- corr("specdata",150)
head(cr)
