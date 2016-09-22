mediacontaminante <- function(directorio, contaminante, id = 1:332) {
  if (id<10){
    id=paste("00",id,sep = "")
  } else {
    if (id<100){
    id=paste("0",id,sep = "")
      } else {
    id=id
        }
  }
  datos = read.csv(paste(directorio, id , ".csv",sep=""), header = TRUE)
  if(contaminante == "sulfate"){
    a = mean(datos$sulfate, trim = 0,na.rm = T)
    print(a)
  }
  if(contaminante == "nitrate"){
    b = mean(datos$nitrate, trim = 0 ,na.rm = T)
    print(b)
}
}
mediacontaminante("C:/Users/Pablo Rendon/Documents /GitHub/Programacion_Actuarial_III_OT16/specdata","sulfate",34)



