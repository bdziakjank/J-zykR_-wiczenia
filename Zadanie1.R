#Zadanie 1
# commit wysłany

# Zadanie 2
#Pociąg z Lublina do Warszawy przejechał połowę drogi ze średnią prędkością 120 km/h.
#Drugą połowę przejechał ze średnią prędkością 90 km/h.
#Jaka była średnia prędkość pociągu.

# Wyprowadzenie wzoru
# Definicja prędkości średniej 
# V_sr = (całkowita droga s)/(całkowity_czas t)

# z zadania wynika 1/2 s = 120 km/h * t_1
# stąd t_1 = 0.5 s/(120 km/h) =0.5s/v_1
# analogicznie druga połowa drogi 1/2 s= 90 km/h * t_2
# stąd t_2 = 0.5 s/(90 km/h)=0.5s/v_2

#v_sr= s/(t_1 + t_2)
# = s/(0.5s/v_1 +0.5 s/v2)= s/(0.5s(1/v_1 +1/v_2))
#=2/((v_1+v_2)/v_1*v_2)=2*v_1*v_2/(v_1+v_2)

v_1<-120.
v_2<-90.

v_sr= 2.*v_1*v_2/(v_1+v_2)
print(v_sr)

# Zadanie 3
#3. Utwórz funkcję obliczającą współczynnik korelacji r Pearsona dla 2 wektorów o tej samej długości.
#sWczytaj dane plik dane.csv i oblicz współczynnik dla wagi i wzrostu. W komentarzu napisz co oznacza wynik.

funkcja_corr<-function(x1,x2){
  wspolcz_paers=cor(x1,y1)
  return(wspolcz_paers)
}


daneDF<-read.csv("dane.csv",sep=";")
#mean(daneDF$wiek)
mean(daneDF$wzrost)
mean(daneDF$waga)
x1<-daneDF$wzrost
y1<-daneDF$waga
print(funkcja_corr(x1,y1))
# Wartość 0.9793459 współczynnika korelacji Paersona
#między wzrostem i wagą oznacza, że jest to bardzo silna korelacja



#Zadanie 4
#4. Napisz funkcję zwracającą ramke danych z danych podanych przez użytkownika
#stworzDataFrame <- function(ile=1)
#W pierwszym wierszu użytkownik podaje nazwy kolumn. 
#w kolejnych wierszach zawartość wierszy ramki danych 
#( tyle wierszy ile podaliśmy w argumencie ile. 
#ile=1 oznacza, że gdy użytkownik nie poda żadnej wartości jako parametr, 
#domyślna wartością będzie 1)

stworzDataFrame <- function(ile=1, sep=","){
  line<-readline(prompt= paste0("Podaj nazwy kolumn oddzielone",sep," , "))
    
  podzielone<-strsplit(line, sep)
  l_kolumn<-length(podzielone[[1]])
  tytul<-podzielone[[1]][1]
  if(l_kolumn>1)
    for (i in 2:l_kolumn-1)
      tytul<-cbind(tytul,podzielone[[1]][i+1])
#  wiersz<-data.frame(podzielone)
#  print(l_kolumn)
#  print(podzielone[[1]] [2])
#      print(tytul)
  
  liczbawierszy<-ile
  if(ile>1)
    for(i in 1:liczbawierszy){
#      print(i)
      line_dane<-readline(prompt= paste0("Podaj ",i, " wiersz danych oddzielonych",sep))
      podziel_dane<-strsplit(line_dane, sep)
      wiersz<-podziel_dane[[1]][1]
      for (j in 2:l_kolumn-1){
        wiersz<-cbind(wiersz,podziel_dane[[1]][j+1])
#      df1row=data.frame(numer=4,imie="michal", plec="m")
#      mojaRamkaDanych <- rbind(mojaRamkaDanych,df1row) 
      }
      tytul<-rbind(tytul,wiersz)
    }
  return(data.frame(tytul))
}


stworzDataFrame(4)
