clc;
clear;

load fisheriris
hedef=[]
for i=1:size(species,1)
    if(strcmp(species{i,1},'setosa')==1)
        hedef=[hedef;1];
    end
    if(strcmp(species{i,1},'versicolor')==1)
        hedef=[hedef;2];
    end
    if(strcmp(species{i,1},'virginica')==1)
        hedef=[hedef;3];
    end
    
end

net=newrb(meas',hedef',1.0); %varyans 1.0 yaptık
view(net)
y=sim(net,meas'); %Tahmniler
outputs=y';
performans=classperf(nominal(hedef),nominal(int16(outputs)))
performans.countingmatrix

ytek=[6.1 2.9 4.7 1.4];
ytekTahmin=int16(sim(net,ytek'))





