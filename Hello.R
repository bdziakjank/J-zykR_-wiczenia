print("Hello")
print("Hello 2")

install.packages("rtools")
install.packages("httr")
install.packages("jsonlite")

library(httr)
library(jsonlite)

endpoint<- "https://api.openweathermap.org/data/2.5/weather?q=Warszawa&appid=apikey&units=metric"
class(endpoint)
gotWeather<-GET(endpoint)
gotWeather
weatherText<-content(gotWeather,"text")
weatherText
print(weatherText)

dataFromJSON <-fromJSON(weatherText)
dataFromJSON

dataFromJSON2 <- fromJSON(endpoint)
dfFromJSON2<- as.data.frame(dataFromJSON2)
View(dfFromJSON2)

x<-100
l<-""
i<-1
while (i<10){
  if(i==5)
    l=i
  i=i+1
  
}

funkcja1<-function(){
  l=999
}

funkcja2<-function(){
  l<-999
  print(l)
}

funkcja1()
x<-100
class(x)
is.numeric(x)
is.vector(x)

x2<-seq(1:100)
x3<-seq(11:20)

vm<-c(2,4)

x3<-seq(11,20, by = 1)

vm<-c(vm,vm)

x4<-seq(20,10, by=-1)

#pomoc dla vector
?vector
vm<-c(2,4,3,0,-1)
class(vm)

logiczny<-as.logical(vm)
as.integer(logiczny)
znakowy<-c("1","2","3")
c(znakowy,vm)

logiczny

znakLogiczny<-c(znakowy,logiczny)

lista<-list(c("1","2","3"),c(1,2,3),c(TRUE, FALSE))
lista[2]
lista[[2]]
lista[[2]][2]

wektorFlaga<- vm>0
vm[wektorFlaga]

vm[vm>0]
lista[[2]][lista[[2]]>1]

lista[[2]][lista[[2]]>1]

#wektor jako macierz

M<-matrix(data=NA, nrow=1, ncol=1,byrow=FALSE,
                dimnames=NULL)
M<-matrix()
wektor<-1:10
M<-as.matrix(wektor)

matrix(1:10, ncol=5)

wektor2<-11:20
?rbind
?cbind

rbind(wektor,wektor2)
cbind(wektor,wektor2)

m2<-matrix((c(1,2,3,4)),ncol=2)
m<-matrix((c(1,2,3,4,5,6)),ncol=3)
t(m)

m2 %*% m

x<-10
y<-2
x/y

plec<-c("k","m","k","m")
plecFactor<-as.factor(plec)
as.numeric(plecFactor)
unclass(plecFactor)
?factor

plecFactor2<-factor(plec, levels = c("m","k"))
unclass(plecFactor2)


#ramka danych

id<-c(1,2,3)
imie<-c("jan", "kamila", "arek")
plec<-c("m","k","m")

?data.frame

mojaRamkaDanych<-data.frame(id,imie,plec)

mojaRamkaDanych<-data.frame(numer=id,imie,plec)

class(mojaRamkaDanych)


mojaRamkaDanych[,1]

mojaRamkaDanych[2,2]
mojaRamkaDanych[2,"imie"]

summary(mojaRamkaDanych)


mojaRamkaDanych$imie
length(mojaRamkaDanych$numer)

df1row=data.frame(numer=4,imie="michal", plec="m")

mojaRamkaDanych <- rbind(mojaRamkaDanych,df1row)

ncol(mojaRamkaDanych)
liczbawierszy<-nrow(mojaRamkaDanych)
for(i in 1:liczbawierszy){
  print(mojaRamkaDanych[i,])
}

for(i in 1:liczbawierszy){
  if(i>2)
  print(mojaRamkaDanych[i,])
}

for(i in 1:liczbawierszy){
  if(mojaRamkaDanych[i,"imie"]!="arek")
    print(mojaRamkaDanych[i,])
}

# != == < > & |


for(i in 1:liczbawierszy){
  if((mojaRamkaDanych[i,"imie"]!="arek")& (mojaRamkaDanych[i,"imie"]!="michal"))
    print(mojaRamkaDanych[i,])
}

for(i in 1:liczbawierszy){
  if((mojaRamkaDanych[i,"imie"]=="arek") | (mojaRamkaDanych[i,"imie"]=="michal"))
    print(mojaRamkaDanych[i,])
}

rm(i)

i<-1
while(i<=liczbawierszy){
  print(i)
  i=i+1
  
}
i<-1
while(i<=liczbawierszy){
  print(mojaRamkaDanych[i,])
  i=i+1
  
}


podaj<-function(){
    print("Witaj")

}

podaj()


podajImie<-function(a="user"){
  print(paste("Witaj",a,sep=" "))
  
}

podajImie("Beata")


podajImie<-function(a="user"){
  print(paste("Witaj",a,sep=" "))
  
}

podajImie()

podajImie<-function(){
  line<-readline(prompt="Podaj swoje imie:")
  print(line)
}
podajImie<-function(sep=","){
  line<-readline(prompt= paste0("Podaj swoje imie i nazwisko oddzielone przecinkiem:")
  podzielone<-strsplit(line, sep)
  print(paste0("imie", podzielone[[1]][1]))
}

podajImie()
podajImie()

daneDF<-read.csv("dane.csv",sep=";")




