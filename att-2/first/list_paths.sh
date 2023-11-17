#!/bin/bash

#Разделение PATH по :

IFS=":" read -ra path_array <<< "$PATH"

# Используем цикл для вывода путей по одному на каждой строке

for path in "${path_array[@]}"; do
	echo "$path"
done
