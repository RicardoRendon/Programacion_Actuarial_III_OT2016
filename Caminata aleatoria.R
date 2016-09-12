a <- 0
b <- 0
for (i in 1:100){
  x <- vector("numeric")
  z <- 5
  while(z>=3 && z<=10){
    x <- c(x,z)
    moneda <- rbinom(1,1,0.5)
    if(moneda==1){ # Caminata Aleatoria
      z <- z+1
    } else {
      z <- z-1
    }
  }
  print(x)
  if (z==11){
    a <- a+1
  } else{
    b <- b+1
  }
}
a  # total z>10
b  # total z<3