# -*- coding: utf-8 -*-
"""
Created on Sat Apr  6 12:49:08 2019

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
from pathlib import Path

class Pencere(tk.Tk): 
    stun_size = []
    stun_keys = []
    stun='global'
    veri='global'
    stun_size2 = []
    stun_keys2 = []
    global stun2 = []
    islem = []
    veri='global'
    veri_stun2 = []
    ################ FONKSİYON DENEME ################   
    def çıkış(self):                                   ## ÇIKIŞ FONKSİYONUN TANIMI 
        self.lbl['text'] = '...'
        self.btn['text'] = 'Bekleyin...'
        self.btn['state'] = 'disabled'
        self.after(100, self.destroy)
    ################ FONKSİYON DENEME ################ 

    ################ FONKSİYONLAR ################   
    def data(self):   
        global veri
        if self.txt1.get() !="":
             self.lbl['text'] = 'Elveda zalim dünya...'
        else :
             veri = pd.read_csv('C:\\Users\\momo\\Desktop\\Derrs\\Piton\\data.csv')
             print(veri)
             
    def stuns(self):
        self.data()  
        global veri
        global stun
        global stun_keys
        global stun_size
        if self.txt2.get() !="":
             stun=veri.groupby(self.txt2.get())
             stun_keys=stun.groups.keys()
             stun_size=stun.size()
             self.lbl['text'] = stun.groups.keys()
        else :
             stun=veri.groupby('soru1')
             stun_keys=stun.groups.keys()
             stun_size=stun.size()
             self.lbl['text'] = stun.groups.keys() 
             
    def stuns2(self):
        global veri
        global stun2
        global islem
        global stun_keys2
        global stun_size2   
        global veri_stun2
        
        stun2.append(self.txt3.get())
        veri_stun2 = veri.groupby(by = [stun2])[islem]
        stun_keys2 = veri_stun2.groups.keys()
        stun_size2=  veri_stun2.size()
        
        
    def isle(self):
        global stun2
        global islem
        
        if self.txt4.get() !="":
             islem.append(self.txt3.get())
        else :
             islem.append(self.len(stun2)-1)
             
    def grafikciz(self):
        self.stuns()
        global veri
        global stun
        global stun2
        global stun_keys
        global stun_size
        explodestun1 = (0.1,0.1) 
        colorsstun1 = ['#ff9999','#66b3ff']
        plt.pie(stun_size, labels=stun_keys, startangle=90,frame=True, shadow=True,radius=3, autopct='%1.1f%%', pctdistance=0.85)
        
        centre_circle = plt.Circle((0,0),1.5,color='black', fc='white',linewidth=0)
        fig = plt.gcf()
        fig.gca().add_artist(centre_circle)
        plt.axis('equal')
        plt.show()
        print('...')
        print(self.txt2.get())
        self.lbl3['text'] = self.txt2.get()
        stun2.append(self.txt2.get())
        
    def grafikciz2(self):   
        global stun_keys
        global stun_size
        
        global stun_keys2
        global stun_size2
        
        explodestun1 = (0.1,0.1) 
        colorsstun1 = ['#ff9999','#66b3ff']
        colorsstun2 = ['#ff6666', '#ffcc99', '#ff6666', '#ffcc99'] 
        explodestun2 = (0.1,0.2,0.1,0.2)
        
        plt.pie(stun_size, labels=stun_keys, startangle=90,frame=True, shadow=True,radius=3, autopct='%1.1f%%', pctdistance=0.85)
        plt.pie(stun_size2, labels=stun_keys2, startangle=90,          shadow=True,radius=2, autopct='%1.1f%%', pctdistance=0.80)
        
        centre_circle = plt.Circle((0,0),1.5,color='black', fc='white',linewidth=0)
        fig = plt.gcf()
        fig.gca().add_artist(centre_circle)
        plt.axis('equal')
        plt.show()                             #CLASS OLUŞTURDUK TK SINIFINI MİRAS ALDIK FORM OLAYLARI İÇİN
    def __init__(self):                                #PROGRAM ÇALIŞTIĞINDA İLK ÇALIŞICAK KISIM. MAİN
        super().__init__()                             #TK SINIFINI OVERRİDE EDİYOR
        self.protocol('WM_DELETE_WINDOW', self.çıkış)  #X BASTIĞINDA ÇIKIŞ FONKSİYONUNA YÖNLENDİRİYOR
        self.title("VERİ GİRİS")
        self.geometry('800x600')                       #çözünürlük ayarı geometry metodu ile
         
        ################ FORM ELEMAN DENEME ################ 
        ##label
        self.lbl = tk.Label(text='Merhaba Zalim Dünya',font='Jokerman 18 bold')
        self.lbl.pack()                                # labeli görünür kılıyor. Pencere içine yerleştiriyor.
        ##Buton
        self.btn = tk.Button(text='Çık', command=self.çıkış)      # command ile eylemleri belirliyebiliyoruz.
        self.btn.pack()
        ################ FORM ELEMAN DENEME ################
        ################################
        ##label - 1.GRAFİK VERİLERİ
        self.lblbas1 = tk.Label(text='1.GRAFİK',font='ARİAL 18 bold')
        self.lblbas1.pack()    
        ################################ 
        ################
        self.lblbos1 = tk.Label(text='  ',font='ARİAL 5')
        self.lblbos1.pack() 
        ################
        ################################
        ##label - VERİ TABANI YOLU NU AL
        self.lbl1 = tk.Label(text='VERİ TABANI YOLU',font='ARİAL 10')
        self.lbl1.pack() 
        ##Text  
        self.txt1=tk.Entry()
        self.txt1.pack()
        ##Buton
        #self.btn1 = tk.Button(text='YOLU AL', command=self.data)      
        #self.btn1.pack()
        ################################
        ################
        self.lblbos2 = tk.Label(text='  ',font='ARİAL 5')
        self.lblbos2.pack() 
        ################
        ################################
        ##label - STUN İSMİNİ AL 
        self.lbl2 = tk.Label(text='STUN ADI',font='ARİAL 10')
        self.lbl2.pack() 
        ##Text
        self.txt2=tk.Entry()
        self.txt2.pack()
        ##Buton
        self.btn2 = tk.Button(text='STUN İSMİNİ AL', command=self.stuns)      
        self.btn2.pack()
        ################################
        ################
        self.lblbos3 = tk.Label(text='  ',font='ARİAL 5')
        self.lblbos3.pack() 
        ################
        ################################
        ##Buton - GRAFİK ÇİZ
        self.btnciz = tk.Button(text='GRAFİK ÇİZ', command=self.grafikciz)      
        self.btnciz.pack()
        ################################
        ################
        self.lblbos4 = tk.Label(text='  ',font='ARİAL 5')
        self.lblbos4.pack() 
        ################
        ################################
        ##label - 2.GRAFİK VERİLERİ
        self.lblbas2 = tk.Label(text='2.GRAFİK',font='ARİAL 18 bold')
        self.lblbas2.pack()    
        ################################
        ################################
        ##label - STUN İSMİNİ AL 
        self.lbl3 = tk.Label(text='SABİT',font='ARİAL 10')
        self.lbl3.pack() 
        ##Text
        self.txt3=tk.Entry()
        self.txt3.pack()
        ##Buton
        self.btn3 = tk.Button(text='STUN İSİMLERİNİ AL', command=self.stuns2)      
        self.btn3.pack()
        ##Text
        self.txt4=tk.Entry()
        self.txt4.pack()
        ##Buton
        self.btn4 = tk.Button(text='İSLENECEK STUN', command=self.isle)      
        self.btn4.pack()
        ################################
        ################
        self.lblbos5 = tk.Label(text='  ',font='ARİAL 5')
        self.lblbos5.pack() 
        ################
        ################################
        ##Buton - GRAFİK ÇİZ
        self.btnciz2 = tk.Button(text='GRAFİK ÇİZ-2', command=self.grafikciz)      
        self.btnciz2.pack()
        ################################
 
pencere = Pencere() 
pencere.mainloop()