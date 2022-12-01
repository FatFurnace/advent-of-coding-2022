#!/bin/bash

file="input.txt"
declare -a bags
cal=0

while read line; do
  if [[ -n "$line" ]]; then
    cal=$(expr "$cal" + "$line")
  elif [[ -z "$line" ]]; then
    bags+=("$cal")
    cal=0
  else
    echo "Something went wrong"
  fi
done < "$file"

greatest=$(printf '%s\n' "${bags[@]}" | sort -n | tail -1)
secondGreatest=$(printf '%s\n' "${bags[@]}" | sort -n | tail -2 | head -1)
thirdGreatest=$(printf '%s\n' "${bags[@]}" | sort -n | tail -3 | head -1)

echo "First: ${greatest}"
echo "Second: ${secondGreatest}"
echo "Third: ${thirdGreatest}"

total=$(expr "$greatest" + "$secondGreatest" + "$thirdGreatest")
echo "$total"
bags=()
