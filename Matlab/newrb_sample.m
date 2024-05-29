%Radyal temelli ağ tasarımı

clc;
clear;
close all,clear all;

[num txt raw]=xlsread('diabetliler.xlsx'); 
whos
figure

plot(num','c')

target=num(:,9);

spread=2; %Default=1.0 Radyal temel fonksiyonların yayılması.Yayılma ne kadar büyük olursa, işlev yaklaşımı o kadar düzgün olur. Çok büyük yayılma, hızlı değişen bir işleve uyması için çok sayıda nöronun gerekli olacağı anlamına gelir.  
K=20;	  %Maksimum nöron sayısı
goal=0;   %Hata sıfıra yakın olsun default=0.0 -->Ortalama kare hata hedefine ulaşana kadar radyal temel ağın gizli katmanına nöronlar ekler.
Ki=4;     %default=25 Ekranlar arasına eklenecek nöron sayısı, varsayılan = 25 (df)


net=newrb(num(:,1:8)',target',goal,spread,K,Ki);


view(net);%Simule göster input layer output'u gösterir

Y=net(num(:,1:8)');
figure;
plot(target')
hold on
grid on