corr <- function(directorio, horizonte=0){ 
  Archivo <- c("C:/Users/Pablo Rendon/Documents/GitHub/Programacion_Actuarial_III_OT2016")
  g<-vector("numeric",1)
  h <-vector("numeric",1)
  Registro = data.frame("Sulfate" = 0, "Nitrate" = 0)
  a=0
  
  for (i in 1:332){
    
    a=a+1
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
    if (cc > horizonte) {
      g <- sum(complete.cases(Archivo2[,3]))
       h <- sum(complete.cases(Archivo2[,4]))
       Registro[a,] = c(g,h)
  
    }
      
    
  }
 Registro
}
 