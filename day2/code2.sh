#!/bin/bash

file="input.txt"
total1=0
total2=0

while read -r line; do
  if [[ -n "$line" ]]; then
    case "$line" in
      "A X")
        total1=$(( $total1 + 1 + 3 ))
        total2=$(( $total2 + 3 ))       ;;
      "A Y")
        total1=$(( $total1 + 2 + 6 ))
        total2=$(( $total2 + 3 + 1 ))   ;;
      "A Z")
        total1=$(( $total1 + 3 ))
        total2=$(( $total2 + 6 + 2 ))   ;;
      "B X")
        total1=$(( $total1 + 1  ))
        total2=$(( $total2 + 1  ))      ;;
      "B Y")
        total1=$(( $total1 + 2 + 3 ))
        total2=$(( $total2 + 3 + 2 ))   ;;
      "B Z")
        total1=$(( $total1 + 3 + 6 ))
        total2=$(( $total2 + 6 + 3  ))  ;;
      "C X")
        total1=$(( $total1 + 1 + 6 ))
        total2=$(( $total2 + 2 ))       ;;
      "C Y")
        total1=$(( $total1 + 2 ))
        total2=$(( $total2 + 3 + 3  ))  ;;
      "C Z")
        total1=$(( $total1 + 3 + 3 ))
        total2=$(( $total2 + 6 + 1 ))   ;;
    esac
  fi
done < "$file"

echo "Score Part 1: ${total1}"
echo "Score Part 2: ${total2}"
unset total1 total2
