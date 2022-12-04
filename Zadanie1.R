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
  
  liczbawierszy<-ile-1
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
      if(i==1)
        macierz=wiersz
      else
        macierz<-rbind(macierz,wiersz)
    }
  colnames(macierz)=tytul
  return(data.frame(macierz))
}


stworzDataFrame(3)

#5 Napisz funkcję , która pobiera sciezkeKatalogu, nazweKolumny, jakaFunkcje, DlaIluPlikow i liczy: 
#mean, median,min,max 
#w zależności od podanej nazwy funkcji w argumencie, 
#z katologu który podaliśmy i z tylu plików ilu podaliśmy dla wybranej nazwy kolumny. 
# UWAGA: w podanych plikach R pobierając komórki nazwane liczbami R wstawi przed nazwy X. 
#Funkcję przetestuj dla katalogu smogKrakow.zip.  
#Wykonując obliczenia pomiń brakujące wartości.

sciezka<-"./smogKrakow2/"
DlaIluPlikow=2
nazwaKolumny="X142_pressure"
jakaFunkcja="sum"

liczZplikow <- function(sciezka,nazwaKolumny,jakaFunkcja="mean",DlaIluPlikow=1){ 
#  
  
#dttest<-read.csv("./smogKrakow2/0022017.csv")
#View(dttest)  
  lista_plikow<-list.files(sciezka) 
  for (i in 1:DlaIluPlikow){
    dttest<-read.csv(paste(sciezka,lista_plikow[i],sep=""))
    if(i==1)
      dane_z_plikow=dttest
    else
      dane_z_plikow<-rbind(dane_z_plikow,dttest)
    }
#View(dane_z_plikow) 

#nazwaKolumny
  jedna_kolumna<-select(dane_z_plikow, matches(nazwaKolumny))
#View(jedna_kolumna)
  jedna_kolumna_bezNA<-na.omit(jedna_kolumna)
#  print(jedna_kolumna_bezNA)
  if(jakaFunkcja=="mean"){
    print(mean(jedna_kolumna_bezNA[,1]))
#    View(jedna_kolumna_bezNA[,1])
    wynik<-mean(jedna_kolumna_bezNA[,1])
  }
  else if (jakaFunkcja=="sum"){
    wynik<-sum(jedna_kolumna_bezNA[,1])
  }
  else if (jakaFunkcja=="median"){
    wynik<-median(jedna_kolumna_bezNA[,1])
  }
  else if (jakaFunkcja=="min"){
    wynik<-min(jedna_kolumna_bezNA[,1])
  }
  else if (jakaFunkcja=="max"){
    wynik<-max(jedna_kolumna_bezNA[,1])
  }
  else{
    print("Nie ma takiej funkcji")
  }
  return(wynik)
}
# 
# Lista plików w katalogu: 
#   
#   list.files(sciezka)
# 
# Omijanie na : na.omit(myDataFrame[[nazwaKolumny]])
# Do złączania stringów: 
#   
#   paste("string1","string2",sep="TU WSTAW SEPARATOR")
# Gdy mamy, rózne oznaczenia NA w plikach możemy wykorzystać ( w tym wypadku pusty znak i NA:
#                                                                na.strings=c("","NA")

liczZplikow(sciezka,nazwaKolumny,jakaFunkcja,DlaIluPlikow)