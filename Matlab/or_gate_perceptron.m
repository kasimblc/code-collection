
%  OR Kapýsý Perceptron Ödevi - 16701005 Kasým Bölücü

clc
clear
input_or = [0 0 ; 0 1 ; 1 0 ; 1 1 ] % 'VEYA' deðerlerimiz.
out_val = 4; % 4 satýrlý bir çýktýmýz olucaðý için her satýrý bulabilmek için 4 deðerini verdik.
%17. satrda kullanýlan for döngüsünü 4 kere dödürücek.
output_or = [0;1;1;1] % 'VEYA' için programdan öðrenmesini beklediðimiz deðerler.
w=zeros(2,1); % 2 tane aðýrlýðýmýz var bunlarý dizi içinde tutuyoruz ilk olarak sýfýr deðerlerine sahipler.
t =20; % Algoritmanýn yinelenme sayýsý.
bias=0,5; % Bias deðerini 0,5 belirledim.

for i = 1:t
    fprintf('%d . Deneme \n \n',i);
   out = zeros(4,1); % Cýktý deðerlerini tutan dizimiz.
   for j = 1:out_val
      y = input_or(j,1)*w(1,1)+input_or(j,2)*w(2,1)+bias; % y = x1.W1+x2.W2+b Formülümüz. 
      %if y>0
      %     out(j,1)=1
      %else
      %    out(j,1)=0
      %end
      out(j,1) = y>0; % Ýf else yerine kýsaca bu kod kullanýlabiliniyor.
      % 'out' dizi deðerlerini sýrasýyla her satýrýn 1 yada 0 olmasýna karar veren koþulumuz.                 
      
      w(1,1) =w(1,1)+input_or(j,1)*(output_or(j,1)-out(j,1)); % ?Wi=?*xi(beklenen deðer-gerçekleþen deðer)
      w(2,1) =w(2,1)+input_or(j,2)*(output_or(j,1)-out(j,1)); % ?Wi=?*xi(output_or-out)
      
      %'Bias' Ýsteðe göre sabit yada
      %deðiþken ayarlanabilinir. Bias deðeri, aktivasyon fonksiyonunu saða
      %veya sola ötelenmesini (shift) saðlar. Giriþ sinyallerinin toplamý 0
      %olduðunda öðrenme gerçekleþmez, Çýkýþ deðerleri hep 1 olan bias
      %nöronlarý, nöronlarýn giriþ sinyallerinin sürekli sýfýrdan farklý
      %olmasýný saðlar .
     
      fprintf('%d. verinin deðiþimi',j);
      out   
   end
end
fprintf('Beklenen \n');
output_or
fprintf('Gerçekleþen \n');
      out   