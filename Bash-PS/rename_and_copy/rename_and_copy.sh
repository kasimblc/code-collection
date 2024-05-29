#!/bin/bash

a=1
kaynak=$2
sonu=$3
for dosya in $kaynak/*$sonu; do
yeniadi=$4
uzanti="${dosya##*.}"

yenidosyadi=$(printf "$yeniadi"_"$a"."$uzanti")
  cp -R -- "$dosya" "$yenidosyadi"


let a=a+1

done