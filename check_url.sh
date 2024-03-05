#!/bin/bash

#source ./url.txt

for url in $(cat url.txt | grep -v "^#")
do
echo "===${url}==="
rm -rf /tmp/orgURL.txt
time curl -s "${url}" -o /tmp/orgURL.txt
md5sum /tmp/orgURL.txt
echo
echo "========NEXT========="
echo
done
