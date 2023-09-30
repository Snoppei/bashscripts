#!/bin/bash

# Проверяем, что передан хотя бы один аргумент
if [ $# -eq 0 ]; then
  echo "Usage: $0 [arg1] [arg2] ..."
  exit 1
fi

args=("$@")         # Создаем массив из аргументов
arg_count=${#args[@]}  # Получаем количество аргументов

while [ $arg_count -gt 0 ]; do
  index=$((arg_count - 1))
  echo "${args[index]}"
  arg_count=$((arg_count - 1))
done
