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

%Y �Dev diyabetlileri k�meye ay�r. Hangi diyabetlini hangi k�mede olaca��n�
%g�ster hangi diyabetli hangi k�mede hangi eleman hangi k�mede

dimension=[10 10] %100 n�ron;
coverSteps=100; %Giri� alan�n�n ilk kez kaplanmas� i�in egzersiz ad�m� say�s� (varsay�lan = 100)�N ��LEME
initNeighbor=4;
topologyFcn='hextop'; %Hexoganal(Alt�gen) topoloji
distanceFcn='dist'; %N�ron mesafe fonksiyonu (varsay�lan = 'linkdist') �klid i�in dist

net2=selforgmap(dimension,coverSteps,initNeighbor,topologyFcn,distanceFcn);

%train
[net2,Y]=train(net2,P); %net1 i train et

% %giri� verisini ve SOM a��rl�k ba�lant�s�n� g�r�nt�le
% plotsompos(net1,P)
% grid on
% 
% %Kom�uluk uzakl�klar�
% plotsomnd(net1)
% 
% %her bir n�ronun giri� vekt�r�yle ba�lant�s�
% figure
% plotsomhits(net1,P)

