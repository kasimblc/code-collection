clc;
clear;
close all;

load fisheriris;%�ris veri seti

%meas(4 boyut) ve species(virginica,versicolor,setosa) vard�r.

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


net=feedforwardnet([5,3]);%Network t�r� ileri besleme geri yay�l�m 5 3=n�ron say�s� 2 katman olcak katman say�s�
net.divideParam.trainRatio=1;%Network de e�itim s�ras�nda e�itimde verinin y�zde ka�� train seti olsun
net.divideParam.valRatio=0;
net.divideParam.testRatio=0;
[net,tr,Y,E]=train(net,meas',hedef');
view(net);


figure()
plot(hedef','linewidth',2)
hold on
plot(Y','r--')%Modelin �retti�i ��kt�lar
grid on
legend('Hedef ��kt�lar','Network ��kt�lar�','location','best')


p=[5.6 4.7 1.6 0.8]
y=int16(net(p'))





