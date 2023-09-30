#!/bin/bash

if [ $# -ne 3 ]; then
  echo "Usage: $0 <operand1> <operator> <operand2>"
  exit 1
fi

operand1="$1"
operator="$2"
operand2="$3"

case "$operator" in
  "+")
    result=$(expr "$operand1" + "$operand2")
    ;;
  "-")
    result=$(expr "$operand1" - "$operand2")
    ;;
  "*")
    result=$(expr "$operand1" \* "$operand2")
    ;;
  "/")
    if [ "$operand2" -eq 0 ]; then
      echo "Error: Division by zero."
      exit 1
    fi
    result=$(expr "$operand1" / "$operand2")
    ;;
  *)
    echo "Error: Invalid operator '$operator'. Use +, -, *, /."
    exit 1
    ;;
esac

echo "Result: $result"
