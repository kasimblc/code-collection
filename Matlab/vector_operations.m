clc
clear
v=[1 3 5 7 9];
v1=v(2)%2.elaman�n de�erini verir.
v2=v(1:3)%vekter�n ilk 3 eleman� verir
v3=v(3:end)%vekter�n 3.eleman�nndan ba�lay�pson elemana kadar de�erleri getirir
v4=v(1:2:end)%1. elemandan ba�lay�p son elemana kadar 2�er 2�er de�erleri verir
v5=v(end:-2:1)%son elemandan geriye 2�er 2�er say�p de�er d�nd�r�r
v6=v(:)
msgbox(['elde edilen:' num2str(v1)[],'SONUC'])
if isnumeric(v1)
else
    a=sqrt(v1)
end

