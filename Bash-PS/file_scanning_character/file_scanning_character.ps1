# ./skript -R a*.txt 10 

if($args.count -eq 3){
if($args[0] -match '-r' -or $args[0] -match '-R'){
$path=Get-Location
$character=$args[1]
$files=get-childitem -Path $path -Recurse $character   
foreach($file in $files) { 
$lencharacter= (Get-Content  $file | Measure-Object -Character).Characters
if($lencharacter -gt $args[2]){
Write-Host "DOSYA ADI : $file --- KARAKTER SAYİSİ : $lencharacter"
Get-Content $file}
}}}

if($args.count -eq 2){
$path=Get-Location
$character=$args[0]
$files=get-childitem -Path $path $character   
foreach($file in $files) { 
$lencharacter= (Get-Content  $file | Measure-Object -Character).Characters
if($lencharacter -gt $args[1]){
Write-Host "DOSYA ADI : $file --- KARAKTER SAYİSİ : $lencharacter"
Get-Content $file} 
}}