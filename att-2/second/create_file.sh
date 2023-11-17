#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Использование: $0 <имя_файла>"
	exit 1
fi

filename="$1"

if [ -e "$filename" ]; then
	echo "Файл '$filename' уже существует."
	exit 1
fi

# Создание файла
touch "$filename"
if [ $? -ne 0 ]; then
	echo "Ошибка при создании файла."
	exit 1
else
	echo "Файл '$filename' успешно создан."
fi

exit 0
