B=[10 5 9;70 8 7;10 1 3];                       % B ad�nda matris tan�m� yapt�k.
save=('C:\Users\Kas�m\Desktop\calisma\B.mat')   % B matrisini calisma adl� klas�re kay�t ettik.
clear                                          	% Cal��ma al�n�ndaki verileri sildik.
load=('C:\Users\Kas�m\Desktop\calisma\B.mat') 	% B matrisini kay�t etti�imiz yerden geri y�kledik.
C=B*2                                           % C de�i�kenine B matrisinin 2 ile �arp�m�n� atad�k.
C'                                              % C nin tersini ald�k.
C(4,:)=[-9 -99 -999]                           	% C ye 4. sat�r� ekliyoruz.
size(C)                                         % C nin boyutunu al�yoruz.
zeros(size(C))                              	% C nin boyutuna denk bir 's�f�r' matrisi olu�turduk.
% de�i�kene atad�ktan sonra 'zeros(de�i�ken)' �eklinde yapabilirdik.    