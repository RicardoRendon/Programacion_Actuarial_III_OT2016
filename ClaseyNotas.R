?file.exists()
?dir.create()
#investigar
#Crear una carpeta para guardar los datos descargados
if(!file.exists("data")){
    dir.create("data")
}
#Descargar datos de internet
url <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
    download.file(url, destfile = "./data/camaras.csv")
        list.files("./data")
fechaDescarga <- date()
fechaDescarga

#cargar los datos desde mi computadora
dataCam <- read.csv("./data/camaras.csv", )
dataCam[2:5,]

datacam <- read.table("./data/camaras.csv",sep=",", header = TRUE)
datacam[2:5,]

#read.csv(_)= read.table(_, sep=",", header=TRUE)
#read.csv sets sep="," and header=TRUE

if(!file.exists("data")){dir.create("data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.xlsx?accessType=DOWNLOAD"
download.file(fileUrl,destfile="./data/cameras.xlsx")
list.files("./data")
dateDownloaded <- date()
install.packages("xlsx")
install.packages("rJava")
library("rJava")
library("xlsx")
cameraData <- read.table("./data/cameras.xlsx",sheetIndex=1,header=TRUE)
head(cameraData)


#26 octubre 2016

url <- "http://www.w3schools.com/xml/simple.xml"
data <- xmlTreeParse(url, useInternalNodes = TRUE)
nodoRaíz <- xmlRoot(data)
xmlName(nodoRaíz)
names(nodoRaíz)
nodoRaíz[[1]][[1]]
nodoRaíz[[1]]
xmlSApply(nodoRaíz,xmlValue)

#/node Top level node #nodo de nivel superior
#//node Node at any levels   #nodo de cualquier nivel
#node[@attr-name] Node with an attribute name    #nodo con un atributo de nombre
#node[@attr-name='bob'] Node with attribute name attr-name='bob'     #nodo con atributo de nombre attr-name="bob"


xpathSApply(nodoRaíz,"//name",xmlValue)
xpathSApply(nodoRaíz,"//price",xmlValue)



fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl,useInternal=TRUE)
scores <- xpathSApply(doc,"//li[@class='scores']",xmlValue)
teams <- xpathSApply(doc,"//li[@class='game-date']",xmlValue)
scores
teams

install.packages("jsonlite")
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/RicardoRendon/repos")
names(jsonData)
jsonData$name

iris
myjson <- toJSON(iris,pretty = TRUE)
cat(myjson)

iris2 <- fromJSON(myjson)
head(iris2)

library(data.table)
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DF,3)
DT = data.table(x=rnorm(9),y=rep(c("a","b","c"),each=3),z=rnorm(9))
head(DT,3)
tables()
DT[2,]  #Fila 2
DT[DT$y=="a",] #todas las filas donde la columna y sea a
DT[c(2,3)] #Así no sale nada "2,3"

DT[,list(mean(x),sum(z))]
DT[,table(y)]

DT[,w:=z^2]
DT

DT2 <- DT #creamos segundoDT y le asignamos el original
DT[, y:= 2]
DT

DT2 # DT2=DT, las tablas trabajan vinculadas

#Operaciones múltiples
DT[,m:= {tmp <- (x+z); log2(tmp+5)}]  #crea columna m con datos log base2 de(x+y+5)
DT

DT[,a:=x>0] #Verdadero o falso, cada elemento de columna x mayor a 0
DT

DT[,b:= mean(x+w),by=a] #operación por factores, separa todos los TRUE y los FALSE
DT

set.seed(123)
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE)) #toma letras de la 1 a la 3

DT[, .N, by=x] #recuento de cuantas veces aparecen a,b y c
