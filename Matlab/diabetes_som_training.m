clc;
clear;
close all,clear all;

[num txt raw]=xlsread('diabetliler.xlsx');
% 
input=num(:,1:8)
ff = normc(input);
% 
dimension=[5 5] %100 nöron;
coverSteps=100;
initNeighbor=10;
topologyFcn='hextop'; %Hexoganal(Altýgen) topoloji
distanceFcn='linkdist'; %Öklid için dist

net2=selforgmap(dimension,coverSteps,initNeighbor,topologyFcn,distanceFcn);

% net2=selforgmap([8 8]);
net2.trainParam.epochs = 1000;
% 
[net2,Y]=train(net2,ff');

transpoz=ff';

out=net2(transpoz(:,2));




