clc;
clear;

x=[0 0;1 1;0 1;1 0];
y=[0;1;0;0];

figure()
plotpv(x',y') %YSA �nda transpoz �art

%perceptron fonkisooyunu
net=perceptron();
net=train(net,x',y');
view(net);

figure(1)
 (net.IW{1},net.b{1}); %IW=A��rl�k b=Bias 1=Tek katman oldu�u i�in 1 a��rl�k

%Test i�lemi
p=[1 1]
y=net(p') %net fonksiyonu test fonksiyonudur.

%Modeli Y�kle
load('andOrnek.mat')
p=[0 1];
yy=net(p')






