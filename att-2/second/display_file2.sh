#!/bin/bash

# Проверка наличия аргумента - имени файла
if [ -z "$1" ]; then
	echo "Укажите имя файла в качестве аргумента."
	exit 1
fi

# Проверка наличия файла и чтение его содержимого
if [ -f "$1" ]; then
# Используем exec и read для чтения и вывода файла
	exec 3< "$1" # Открываем файл для чтения с помощью дескриптора 3

	while IFS= read -r -u 3 line; do
# Выводим строку с сохранением форматирования и экранированием символов '\'
		echo -e "$line"
	done

	exec 3<&- # Закрываем дескриптор файла
else
	echo "Файл '$1' не существует."
	exit 1
fi 
