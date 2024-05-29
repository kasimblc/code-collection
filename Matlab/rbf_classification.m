clc;
clear;
close all,clear all;

%Çizimler için özel fonksiyonlar yok görselleþtirme yok Sadece vizeden sonraki konular var
%Fonksiyon kullanýmda parametrelirini öðren

%RBF Parametreler = Spread(Varyans),K(Maksimum nöron
%sayýsý),goal(Performans hatasý (mse)),Ki(Gizli katmandaki rbf fonk arasýndaki nöronlar)
%

[num txt raw]=xlsread('diabetliler.xlsx'); 
whos
% num a atadýk diabet verilerini
% txt stun sayýsý raw ýse satýr
target=num(:,9); 
disp(target) % deðiþkenin deðerini görüntüler .

% target num daký butun  satýrlarý ve 9. stunlarý alacak
%  figure
%  plot(num','c')


spread=2;%Default=1.0 Radyal temel fonksiyonlarýn yayýlmasý  
K=20;%Maksimu nöron sayýsý
goal=0;%Hata sýfýra yakýn olsun default=0.0
Ki=4;%default=25 Ekranlar arasýna eklenecek nöron sayýsý, varsayýlan = 25

%net=newrb(num(:,1:8)',target',goal,spread,K,Ki); %RBF Modeli
%newrb --> belirtilen ortalama kare hata hedefine ulaþana kadar radyal temel aðýn gizli katmanýna nöronlar ekler.
net=newrb(num(:,1:8)',target');

%view(net);%Simule göster input layer output'u gösterir

%Tahmin

 Y=net(num(:,1:8)');

% figure;
% plot(target')
% hold on
% grid on
% plot(Y,'r')
% 
% 
% eval=classperf(nominal(int16(target)),nominal(int16(Y))) %Sýnýfýn performansý
% eval.countingmatrix%Confusion Matrix













