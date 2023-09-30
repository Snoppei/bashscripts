#!/bin/bash

# Пример вызова: ./sort_args.sh apple banana cherry

# Получаем аргументы в массив
args=("$@")

# Реализуем сортировку методом пузырька
n=${#args[@]}
for ((i = 0; i < n - 1; i++)); do
  for ((j = 0; j < n - i - 1; j++)); do
    if [[ "${args[j]}" > "${args[j+1]}" ]]; then
      # Меняем элементы местами
      temp="${args[j]}"
      args[j]="${args[j+1]}"
      args[j+1]="$temp"
    fi
  done
done

# Выводим отсортированные аргументы
for arg in "${args[@]}"; do
  echo "$arg"
done
