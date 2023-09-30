#!/bin/bash

num_outputs=1
timeout=1

while getopts "n:t:" opt; do
  case "$opt" in
    n)
      num_outputs="$OPTARG"
      ;;
    t)
      timeout="$OPTARG"
      ;;
    \?)
      echo "Неверный аргумент: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Сдвигаем аргументы, чтобы получить текст для вывода
shift $((OPTIND - 1))
text_to_display="$@"

# Выводим текст заданное количество раз с заданным интервалом времени
for ((i = 0; i < num_outputs; i++)); do
  echo "$text_to_display"
  sleep "$timeout"
done
