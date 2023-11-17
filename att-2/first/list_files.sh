#!/bin/bash

# Функция для рекурсивного вывода файлов и подкаталогов
function list_files_recursive {
local directory="$1"
local indent="$2"
for file in "$directory"/*; do
	if [ -d "$file" ]; then
		echo "${indent}$(basename "$file")"
		list_files_recursive "$file" " $indent"
	elif [ -f "$file" ]; then
		echo "${indent}$(basename "$file")"
	fi
done
}

# Проверка наличия аргумента командной строки
if [ -z "$1" ]; then
	echo "Укажите путь к каталогу как аргумент командной строки."
	exit 1
fi

# Первоначальный вызов функции с уровнем вложенности 1
list_files_recursive "$1" ""
