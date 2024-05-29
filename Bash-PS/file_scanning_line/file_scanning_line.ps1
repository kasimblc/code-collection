# ./skript -R a*.txt 10 
#Alt klasörlere inebiliyor. '-r' veya '-R' kullanıla bilinir. Secılen karakterler ile başlayan dosyaları tarıyor. Verilen satir sayısından yüksek olan dosyaları getiriyor.
clear
if($args.count -eq 3){
if($args[0] -match '-r' -or $args[0] -match '-R'){
$path=Get-Location
$karakter=$args[1]
$dosyalar=get-childitem -Path $path -Recurse -Force $karakter   
foreach($dosya in $dosyalar) { 
$satir= (Get-Content $dosya).count
if($satir -gt $args[2]){
Write-Host "DOSYA ADI : $dosya &&& SATİR SAYİSİ : $satir"
Get-Content $dosya}
}}}

if($args.count -eq 2){
$path=Get-Location
$karakter=$args[0]
$dosyalar=get-childitem -Path $path $karakter   
foreach($dosya in $dosyalar) { 
$satir=(Get-Content $dosya).count 
if($satir -gt $args[1]){
Write-Host "DOSYA ADI : $dosya &&& SATİR SAYİSİ : $satir"
Get-Content $dosya} 
}}