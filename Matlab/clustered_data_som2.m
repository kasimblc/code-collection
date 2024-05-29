clc;
clear;
close all;

%Her kümedeki örnek sayýsý
K=200; 

%Sýnýflarýn ayrýmý
q=1.1;

%Giriþ verisi için 4 küme belirle
P=[rand(1,K)-q rand(1,K)+q rand(1,K)+q rand(1,K)-q;
    rand(1,K)+q rand(1,K)+q rand(1,K)-q rand(1,K)-q];

plot(P(1,:),P(2,:),'r.')
hold on
grid on

%Som parametreleri

%Y ÖDev diyabetlileri kümeye ayýr. Hangi diyabetlini hangi kümede olacaðýný
%göster hangi diyabetli hangi kümede hangi eleman hangi kümede

dimension=[10 10] %100 nöron;
coverSteps=100; %Giriþ alanýnýn ilk kez kaplanmasý için egzersiz adýmý sayýsý (varsayýlan = 100)ÖN ÝÞLEME
initNeighbor=4;
topologyFcn='hextop'; %Hexoganal(Altýgen) topoloji
distanceFcn='dist'; %Nöron mesafe fonksiyonu (varsayýlan = 'linkdist') Öklid için dist

net2=selforgmap(dimension,coverSteps,initNeighbor,topologyFcn,distanceFcn);

%train
[net2,Y]=train(net2,P); %net1 i train et

% %giriþ verisini ve SOM aðýrlýk baðlantýsýný görüntüle
% plotsompos(net1,P)
% grid on
% 
% %Komþuluk uzaklýklarý
% plotsomnd(net1)
% 
% %her bir nöronun giriþ vektörüyle baðlantýsý
% figure
% plotsomhits(net1,P)

