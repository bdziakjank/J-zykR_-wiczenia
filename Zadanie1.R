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