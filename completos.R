completos <- function(directorio, id=1:332){ 
  Archivo <- c("C:/Users/Pablo Rendon/Documents/GitHub/Programacion_Actuarial_III_OT2016")
  Nobs<-vector("numeric",1)
  Registro = data.frame("id" = 0, "nobs" = 0)
    a=0
  for (i in 1:id){
    Nobs <- c(0)
    a=a+1
    if (i <10){
      Ubicaci�n<-paste(Archivo,"/",directorio,"/","00",i,".csv",sep="")
      Archivo2<-read.csv(Ubicaci�n)
    } else if (i<100){
      Ubicaci�n<-paste(Archivo,"/",directorio,"/0",i,".csv",sep="")
      Archivo2<-read.csv(Ubicaci�n)
    } else{
      Ubicaci�n<-paste(Archivo,"/",directorio,"/",i,".csv",sep="")
      Archivo2<-read.csv(Ubicaci�n)
    }
    Nobs = sum(complete.cases(Archivo2))
    Registro[a,] = c(i,Nobs)
  }
Registro
}