clc;
clear;
close all,clear all;

%�izimler i�in �zel fonksiyonlar yok g�rselle�tirme yok Sadece vizeden sonraki konular var
%Fonksiyon kullan�mda parametrelirini ��ren

%RBF Parametreler = Spread(Varyans),K(Maksimum n�ron
%say�s�),goal(Performans hatas� (mse)),Ki(Gizli katmandaki rbf fonk aras�ndaki n�ronlar)
%

[num txt raw]=xlsread('diabetliler.xlsx'); 
whos
% num a atad�k diabet verilerini
% txt stun say�s� raw �se sat�r
target=num(:,9); 
disp(target) % de�i�kenin de�erini g�r�nt�ler .

% target num dak� butun  sat�rlar� ve 9. stunlar� alacak
%  figure
%  plot(num','c')


spread=2;%Default=1.0 Radyal temel fonksiyonlar�n yay�lmas�  
K=20;%Maksimu n�ron say�s�
goal=0;%Hata s�f�ra yak�n olsun default=0.0
Ki=4;%default=25 Ekranlar aras�na eklenecek n�ron say�s�, varsay�lan = 25

%net=newrb(num(:,1:8)',target',goal,spread,K,Ki); %RBF Modeli
%newrb --> belirtilen ortalama kare hata hedefine ula�ana kadar radyal temel a��n gizli katman�na n�ronlar ekler.
net=newrb(num(:,1:8)',target');

%view(net);%Simule g�ster input layer output'u g�sterir

%Tahmin

 Y=net(num(:,1:8)');

% figure;
% plot(target')
% hold on
% grid on
% plot(Y,'r')
% 
% 
% eval=classperf(nominal(int16(target)),nominal(int16(Y))) %S�n�f�n performans�
% eval.countingmatrix%Confusion Matrix













