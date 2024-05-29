# -*- coding: utf-8 -*-
"""
Created on Sun Apr 21 16:42:02 2019

@author: momo
"""

import numpy as np # Matematiksel işlemler için numpy kütüphanesi
import matplotlib.pyplot as plt # Çizim yapmak için matplotlib kütüphanesine.
import seaborn as sns 
sns.set_style("darkgrid")
import pandas as pd  
from sklearn.model_selection import train_test_split 
from sklearn.linear_model import LinearRegression
from sklearn import metrics


def log_funca(x):   # Bu fonksiyon ile 0 ve 1 olarak değerleri tutucaz.
     a=[] 
     b=[] 
     i=0
     while i < 10 :
         i+=1
     if x=='1':
       a.append('1')
     elif x=='0':
       b.append('0')      
     return (a,b)

def log_func(x):   # Bu fonksiyon ile 0 ve 1 olarak değerlerine array tanımlıyoruz
     a=np.ones((veri_bl == '1').sum())
     b=np.zeros((veri_bl == '0').sum())
     return (a,b)

def bool_func(x):   # Bu fonksiyon ile stun ismini alıyoruz ve verileri 0 yada 1 ile değiştiriyoruz.
    boolarray=veri[x].replace(to_replace = ['Evet', 'Hayır'],value = ['1','0'])
    return (boolarray)
 
veri = pd.read_csv('C:\\Users\\momo\\Desktop\\Derrs\\Piton\\data.csv')

### Replace kullanımı
#veri.replace(to_replace='Evet', value='1') # veri tabanında istediğimiz veri değerlerini değiştirmemize yarıycak.
#veri.replace(to_replace='Hayır',value='0')
#print(veri['soru1'])
#print(veri.replace(to_replace='Evet', value='1'))
###

veri_bl=veri['soru3'].replace(to_replace = ['Evet', 'Hayır'],value = ['1','0']) # Stundaki verilerin ismini değiştirdik.Bunu bir fonksiyon şeklinde yazacağız. 

#bool_func fonksiyonuna stundaki verileri yolladık fonksiyon içerisindeki replace fonksiyonu ile de verileri, 0 ve 1 e çevirdik. 
veri_bl=bool_func('soru1')
print(veri_bl)
x=5
g= 1 / (1 + np.exp(-x)) # e sayısı ile hesaplama fonksiyonu. Araştırılacak.
plt.figure()
