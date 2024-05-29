clc
clear
v=[1 3 5 7 9];
v1=v(2)%2.elamanýn deðerini verir.
v2=v(1:3)%vekterün ilk 3 elemaný verir
v3=v(3:end)%vekterün 3.elemanýnndan baþlayýpson elemana kadar deðerleri getirir
v4=v(1:2:end)%1. elemandan baþlayýp son elemana kadar 2þer 2þer deðerleri verir
v5=v(end:-2:1)%son elemandan geriye 2þer 2þer sayýp deðer döndürür
v6=v(:)
msgbox(['elde edilen:' num2str(v1)[],'SONUC'])
if isnumeric(v1)
else
    a=sqrt(v1)
end

