#!/bin/bash

# Инициализация переменных
num_outputs=1
timeout=1

# Обработка аргументов командной строки
while [ $# -gt 0 ]; do
  case "$1" in
    -n)
      num_outputs="$2"
      shift 2
      ;;
    -t)
      timeout="$2"
      shift 2
      ;;
    --)
      shift
      break
      ;;
    *)
      echo "Неверный аргумент: $1"
      exit 1
      ;;
  esac
done

# Получаем текст для вывода из оставшихся аргументов
text_to_display="$@"

# Выводим текст заданное количество раз с заданным интервалом времени
for ((i = 0; i < num_outputs; i++)); do
  echo "$text_to_display"
  sleep "$timeout"
done
