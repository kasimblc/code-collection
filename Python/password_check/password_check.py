chars="!+*-&#^%"
rakam="1234567890"
iptal=0
parola=input("Sifre giriniz:") 
while iptal==0:  
    while iptal==0: 
        if parola[0] in rakam and parola[(len(parola))-1] in rakam :
            print("Şifre rakam ile bitemez veya rakam ile başlayamaz.")
            break
        if len(parola)<8 or len(parola)>12 :
            print("Uzunluk en az 8 ve en fazla 12 karakter içermelidir.")
            print(len(parola))
            break
        if not any(char.isdigit() for char in parola):
            print("Parola en az bir küçük harf içermelidir.")
            break
        if not any(char.isupper() for char in parola):   
            print("Parola en az bir büyük harf içermelidir.")
            break
        for ch in chars:
            if ch in parola:
                print("Gecerli bir şifre tanımladınız :)")
                iptal=1
                break
    if iptal==0 : 
        parola=input("Sifre giriniz:") 