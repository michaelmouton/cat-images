#!/bin/bash

#PROTOCOL=https://
#FQDN=example.com
#IMGSRCDIR=cat-images/

PROTOCOL=
FQDN=
IMGSRCDIR=cat-images/

mkdir -p ./output/html
cp ./cat-images/*.jpg ./output/html
touch ./output/cat-images.conf

cat ./source/apache2_template | sed -e "s%\[IMGSRCDIR\]%$IMGSRCDIR%g" | tee -a ./output/cat-images.conf > /dev/null


for CATIMG in ./cat-images/*.jpg
do
	ERROR_NUM=$(echo $CATIMG | awk -F/ '{print $3}' | awk -F. '{print $1}')

	cat ./source/html_template | sed -e "s%\[ERROR_NUM\]%$ERROR_NUM%g" -e "s%\[PROTOCOL\]%$PROTOCOL%" -e "s%\[FQDN\]%$FQDN%" -e "s%\[IMGSRCDIR\]%$IMGSRCDIR%" | tee ./output/html/$ERROR_NUM.html > /dev/null

	echo "ErrorDocument $ERROR_NUM /$IMGSRCDIR/$ERROR_NUM.html" | tee -a ./output/cat-images.conf > /dev/null
done
