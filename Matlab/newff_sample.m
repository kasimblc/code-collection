giris=[1 1 0 0;
	0 1 0 1]
cikis=[1 0 0 1]
%net adında "newff" ile ileri beslemeli bir ağ modeli oluşturduk.

net=newff([0 1;0 1],[2 1],{'logsig','logsig'});

%#newff Ağın girişi [0 ile 1;0 ile 1] arasındadır. Çünkü iki boyutlu matrisimiz var.
%#[2 1] burada 2 değer olması 2 katman olduğu anlamına gelir.
%#ilk katmanda 2 tane logsig nöronu var, ikinci katmanda ise 1 tane logsig nöronu var.
%#Katman sayısı ve nöron sayıssı belirlenip nöron tipi veriliyor.
%tansig purelin,örnek nöron tipleri.
net.trainParam.epoch=25;
net.trainParam.Ir=0,5; %Öğrenme oranı, bir ağın parametrelerini ne kadar hızlı güncellediğini tanımlar.
net.train(net,giris,cikis) % eğitime başlanıyor.
 	gizligirisw=net.lw{1,1}
	gizlicikisw=net.lw{2,1}
sonuc=uint8(sim(net,giris))

%Epoch --> Bir dönemi temsil eder. 2000 tane veri olsa batches 500 belirlersek 2000 veri 4 iterasyonda tamamlanır ve 1 epoch tamamlanmış olur.
%2000 veri için epoch 25 olursa batches değeri 500 verilirse , iterasyon sayımız 4*25 ten 100 olur.