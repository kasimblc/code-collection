clc;
clear;
close all;

load fisheriris;%Ýris veri seti

%meas(4 boyut) ve species(virginica,versicolor,setosa) vardýr.

hedef=[]
for i=1:size(species,1)
    if(strcmp(species{i,1},'setosa')==1)
        hedef=[hedef;1];%1 ekle
    end
    if(strcmp(species{i,1},'versicolor')==1)
        hedef=[hedef;2];
    end
    if(strcmp(species{i,1},'virginica')==1)
        hedef=[hedef;3];
    end
    
end


net=feedforwardnet([5,3]);%Network türü ileri besleme geri yayýlým 5 3=nöron sayýsý 2 katman olcak katman sayýsý
net.divideParam.trainRatio=1;%Network de eðitim sýrasýnda eðitimde verinin yüzde kaçý train seti olsun
net.divideParam.valRatio=0;
net.divideParam.testRatio=0;
[net,tr,Y,E]=train(net,meas',hedef');
view(net);


figure()
plot(hedef','linewidth',2)
hold on
plot(Y','r--')%Modelin ürettiði çýktýlar
grid on
legend('Hedef Çýktýlar','Network Çýktýlarý','location','best')


p=[5.6 4.7 1.6 0.8]
y=int16(net(p'))





