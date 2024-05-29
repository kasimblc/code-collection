clc;
clear;

giris=[1 85 85 0;1 80 90 1;2 83 86 0;3 70 96 0;3 68 80 0;3 65 70 1;2 64 65 1;1 72 95 0;1 69 70 0;3 75 80 0;
    2 72 90 1;1 75 70 1;1 81 75 0;3 71 91 1]
cikis=[0 0 1 1 1 0 1 0 1 1 1 1 1 0];

net=feedforwardnet(100,'trainlm');%tek katman
net.trainParam.epochs=25;
net.trainParam.lr=0.05;
net=train(net,giris',cikis)

sonuc=uint8(sim(net,giris'))

errors=mae(cikis,sonuc)

anew=uint8(sim(net,[2;55;95;1]));




