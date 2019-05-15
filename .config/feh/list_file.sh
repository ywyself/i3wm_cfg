#!/bin/bash
# list all filename in fold

files=$(ls ./wallpaper )

for f in $(ls ~/picture/); do
    echo $f
done

echo $files[0]
