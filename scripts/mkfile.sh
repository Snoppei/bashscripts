#!/bin/bash

if [ $# -lt 1 ]; then
  echo "Usage: $0 <name> [<mode>]"
  exit 1
fi

file_name="$1"

if [ -e "$file_name" ]; then
  echo "File '$file_name' already exists."
else
  touch "$file_name"
  echo "File '$file_name' created."
fi

if [ $# -eq 2 ]; then
  chmod "$2" "$file_name"
  echo "File permissions set to '$2'."
fi
