clc;
clear;
close all;

%Her k�medeki �rnek say�s�
K=200; 

%S�n�flar�n ayr�m�
q=1.1;

%Giri� verisi i�in 4 k�me belirle
P=[rand(1,K)-q rand(1,K)+q rand(1,K)+q rand(1,K)-q;
    rand(1,K)+q rand(1,K)+q rand(1,K)-q rand(1,K)-q];

plot(P(1,:),P(2,:),'r.')
hold on
grid on

%Som parametreleri

dimension=[100]; %Boyut
coverSteps=100; %Giri� alan�n�n ilk kez kaplanmas� i�in egzersiz ad�m� say�s� (varsay�lan = 100)�N ��LEME
initNeighbor=10;% belkiii ilk katamn n�ron
topologyFcn='gridtop'; %Katman topolojisi i�levi (varsay�lan = 'hextop')
distanceFcn='dist'; %N�ron mesafe fonksiyonu (varsay�lan = 'linkdist')

net1=selforgmap(dimension,coverSteps,initNeighbor,topologyFcn,distanceFcn);
%selforgmap --> Kendi kendini d�zenliyen harita yaps�s� 
%train
[net1,Y]=train(net1,P); %net1 i train et


% %giri� verisini ve SOM a��rl�k ba�lant�s�n� g�r�nt�le
% plotsompos(net1,P)
% plotsompos --> Kendi kendini d�zenleyen harita a��rl�k pozisyonlar�n� �izdirir.
% grid on
% 
% %Kom�uluk uzakl�klar�
% plotsomnd(net1)
%   
% %her bir n�ronun giri� vekt�r�yle ba�lant�s�
% figure
% plotsomhits(net1,P)

