# -*- coding: utf-8 -*-
"""
Created on Thu Mar 21 18:51:26 2019

@author: momo
"""
from tkinter import *
import tkinter as tk
import pandas as pd  
import numpy as np  
import matplotlib.pyplot as plt 
import seaborn as seabornInstance 
from sklearn.model_selection import train_test_split 
from sklearn.linear_model import LinearRegression
from sklearn import metrics

veri = pd.read_csv('C:\\Users\\momo\\Desktop\\Derrs\\Piton\\data.csv')

## Data to plot
veri_soru1=veri.groupby('soru1')
veri_soru1_labels = veri_soru1.groups.keys() 
veri_soru1_size=veri_soru1.size() # Pasta paylarının genişlik değerlerini size metodu ile aldık.
colors = ['#ff9999','#66b3ff'] # Kendi renk seçimlerimizi eklemek için kullnılır.
#
fig1, ax1 = plt.subplots()
#

ax1.pie(veri_soru1_size, colors=colors ,labels=veri_soru1_labels, autopct='%1.1f%%',shadow=True, startangle=90, pctdistance=0.85) 

#draw circle 
centre_circle = plt.Circle ((0,0), 0.70, fc = 'white') 
fig = plt.gcf () 
fig.gca (). add_artist (centre_circle)
#


ax1.axis('equal')  # Eşit görünüş oranı, Pastanın bir daire şeklinde çizilmesini sağlar. Axis ('eşit')
plt.tight_layout() # Pastayı daire şeklinde oranlıyor.Büyüdü
plt.show()

##########################################################################################################

## Data to plot 'SORU_1'
veri_soru1=veri.groupby('soru1') # gruplama işlemi için bir stun seçilmeli // stun ismini al kullanıcı girmeli
veri_soru1_labels = veri_soru1.groups.keys() # gruplama yaptıktan sonra etiket isimleri aldık // otomatik olacak fonksiyon icinde 
veri_soru1_size=veri_soru1.size() # Pasta paylarının genişlik değerlerini size metodu ile aldık. // otomatik olacak fonksiyon icinde
colors_soru1 = ['#ff9999','#66b3ff'] # Kendi renk seçimlerimizi eklemek için kullnılır.
explode_soru1 = (0.1,0.1) 
## Data to plot 'CİNSİYET'
veri_gender = veri.groupby(by = ['soru1', 'Cinsiyet'])['Cinsiyet']
veri_gender_labels = veri_gender.groups.keys()
veri_gender_labels = ['M','W','M','W']
veri_gender_size=veri_gender.size()
colors_gender = ['#ff6666', '#ffcc99', '#ff6666', '#ffcc99'] # Kendi renk seçimlerimizi eklemek için kullnılır. erkek kadın renk sırası
explode_gender = (0.1,0.2,0.1,0.2)
#

## Plot
plt.pie(veri_soru1_size, labels=veri_soru1_labels, colors=colors_soru1, startangle=90,frame=True, shadow=True, explode=explode_soru1 ,radius=3, autopct='%1.1f%%', pctdistance=0.85)
plt.pie(veri_gender_size,labels=veri_gender_labels,colors=colors_gender,startangle=90,            shadow=True, explode=explode_gender,radius=2, autopct='%1.1f%%', pctdistance=0.80)
#
#Draw circle
centre_circle = plt.Circle((0,0),1.5,color='black', fc='white',linewidth=0)
fig = plt.gcf()
fig.gca().add_artist(centre_circle)
#
print(' ')
print('SORU_1 : ÜLKENİN EKONOMİK DURUMU İYİ Mİ ? ')
print('Erkek - Kırmızı')
print('Kadın - Yeşil')
#
plt.axis('equal')
plt.show()