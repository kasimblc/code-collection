B=[10 5 9;70 8 7;10 1 3];                       % B adýnda matris tanýmý yaptýk.
save=('C:\Users\Kasým\Desktop\calisma\B.mat')   % B matrisini calisma adlý klasöre kayýt ettik.
clear                                          	% Calýþma alýnýndaki verileri sildik.
load=('C:\Users\Kasým\Desktop\calisma\B.mat') 	% B matrisini kayýt ettiðimiz yerden geri yükledik.
C=B*2                                           % C deðiþkenine B matrisinin 2 ile çarpýmýný atadýk.
C'                                              % C nin tersini aldýk.
C(4,:)=[-9 -99 -999]                           	% C ye 4. satýrý ekliyoruz.
size(C)                                         % C nin boyutunu alýyoruz.
zeros(size(C))                              	% C nin boyutuna denk bir 'sýfýr' matrisi oluþturduk.
% deðiþkene atadýktan sonra 'zeros(deðiþken)' þeklinde yapabilirdik.    