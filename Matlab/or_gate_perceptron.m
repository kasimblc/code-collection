
%  OR Kap�s� Perceptron �devi - 16701005 Kas�m B�l�c�

clc
clear
input_or = [0 0 ; 0 1 ; 1 0 ; 1 1 ] % 'VEYA' de�erlerimiz.
out_val = 4; % 4 sat�rl� bir ��kt�m�z oluca�� i�in her sat�r� bulabilmek i�in 4 de�erini verdik.
%17. satrda kullan�lan for d�ng�s�n� 4 kere d�d�r�cek.
output_or = [0;1;1;1] % 'VEYA' i�in programdan ��renmesini bekledi�imiz de�erler.
w=zeros(2,1); % 2 tane a��rl���m�z var bunlar� dizi i�inde tutuyoruz ilk olarak s�f�r de�erlerine sahipler.
t =20; % Algoritman�n yinelenme say�s�.
bias=0,5; % Bias de�erini 0,5 belirledim.

for i = 1:t
    fprintf('%d . Deneme \n \n',i);
   out = zeros(4,1); % C�kt� de�erlerini tutan dizimiz.
   for j = 1:out_val
      y = input_or(j,1)*w(1,1)+input_or(j,2)*w(2,1)+bias; % y = x1.W1+x2.W2+b Form�l�m�z. 
      %if y>0
      %     out(j,1)=1
      %else
      %    out(j,1)=0
      %end
      out(j,1) = y>0; % �f else yerine k�saca bu kod kullan�labiliniyor.
      % 'out' dizi de�erlerini s�ras�yla her sat�r�n 1 yada 0 olmas�na karar veren ko�ulumuz.                 
      
      w(1,1) =w(1,1)+input_or(j,1)*(output_or(j,1)-out(j,1)); % ?Wi=?*xi(beklenen de�er-ger�ekle�en de�er)
      w(2,1) =w(2,1)+input_or(j,2)*(output_or(j,1)-out(j,1)); % ?Wi=?*xi(output_or-out)
      
      %'Bias' �ste�e g�re sabit yada
      %de�i�ken ayarlanabilinir. Bias de�eri, aktivasyon fonksiyonunu sa�a
      %veya sola �telenmesini (shift) sa�lar. Giri� sinyallerinin toplam� 0
      %oldu�unda ��renme ger�ekle�mez, ��k�� de�erleri hep 1 olan bias
      %n�ronlar�, n�ronlar�n giri� sinyallerinin s�rekli s�f�rdan farkl�
      %olmas�n� sa�lar .
     
      fprintf('%d. verinin de�i�imi',j);
      out   
   end
end
fprintf('Beklenen \n');
output_or
fprintf('Ger�ekle�en \n');
      out   