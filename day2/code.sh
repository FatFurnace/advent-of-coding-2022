#!/bin/bash

file="/Users/gbeck/Projects/AdventofCode2022/day2/input.txt"
total1=0
total2=0

score() {
# A X Rock
# B Y Paper
# C Z Scissors
  if [[ $1 == "A" ]]; then
    if [[ $2 == "X" ]]; then
      total1=$(expr $total1 + 1 + 3 )
    elif [[ $2 == "Y" ]]; then
      total1=$(expr $total1 + 2 + 6 )
    elif [[ $2 == "Z" ]]; then
      total1=$(expr $total1 + 3 )
    else
      echo "Something REALLY went wrong"
    fi
  elif [[ $1 == "B" ]]; then
    if [[ $2 == "X" ]]; then
      total1=$(expr $total1 + 1 )
    elif [[ $2 == "Y" ]]; then
      total1=$(expr $total1 + 2 + 3 )
    elif [[ $2 == "Z" ]]; then
      total1=$(expr $total1 + 3 + 6 )
    else
      echo "Something REALLY went wrong"
    fi
  elif [[ $1 == "C" ]]; then
    if [[ $2 == "X" ]]; then
      total1=$(expr $total1 + 1 + 6 )
    elif [[ $2 == "Y" ]]; then
      total1=$(expr $total1 + 2 )
    elif [[ $2 == "Z" ]]; then
      total1=$(expr $total1 + 3 + 3 )
    else
      echo "Something REALLY went wrong"
    fi
  else
    echo "Something went wrong"
  fi
}

score2() {
# A X Rock/Lose
# B Y Paper/Draw
# C Z Scissors/Win
  if [[ $1 == "A" ]]; then
    if [[ $2 == "X" ]]; then
      total2=$(expr $total2 + 3 )
    elif [[ $2 == "Y" ]]; then
      total2=$(expr $total2 + 3 + 1 )
    elif [[ $2 == "Z" ]]; then
      total2=$(expr $total2 + 6 + 2 )
    else
      echo "Something REALLY went wrong"
    fi
  elif [[ $1 == "B" ]]; then
    if [[ $2 == "X" ]]; then
      total2=$(expr $total2 + 1 )
    elif [[ $2 == "Y" ]]; then
      total2=$(expr $total2 + 3 + 2 )
    elif [[ $2 == "Z" ]]; then
      total2=$(expr $total2 + 6 + 3 )
    else
      echo "Something REALLY went wrong"
    fi
  elif [[ $1 == "C" ]]; then
    if [[ $2 == "X" ]]; then
      total2=$(expr $total2 + 2 )
    elif [[ $2 == "Y" ]]; then
      total2=$(expr $total2 + 3 + 3 )
    elif [[ $2 == "Z" ]]; then
      total2=$(expr $total2 + 6 + 1 )
    else
      echo "Something REALLY went wrong"
    fi
  else
    echo "Something went wrong"
  fi
}

while read -r line; do
  playone=$(echo "$line" | awk '{print $1}')
  playtwo=$(echo "$line" | awk '{print $2}')
  if [[ -n "$line" ]]; then
    score "$playone" "$playtwo"
    score2 "$playone" "$playtwo"
  fi
done < "$file"

echo "Score Part 1: ${total1}"
echo "Score Part 2: ${total2}"
unset total1 total2
