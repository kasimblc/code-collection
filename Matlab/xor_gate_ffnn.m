
clc;
clear;

giris=[1 1 0 0;0 1 0 1];
cikis=[1 0 0 1];

net=newff([0 1;0 1],[4 1],{'logsig','logsig'});

net.trainParam.epochs=25;
net.trainParam.lr=0.5;
net=train(net,giris,cikis)

girisgizliW=net.IW{1,1}%8
gizlicikisW=net.LW{2,1}%4
sonuc=uint8(sim(net,giris))
