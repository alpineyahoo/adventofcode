#!/usr/bin/env zsh

right=$(awk '{print $2}' input)

left-func(){
    awk '{print $1}' input |
    sort -n |
    uniq -c;
}

right-func(){
    for i in $(left-func | awk '{print $2}')
    do
    grep -c $i <(echo $right)
    done |
    sponge;
}

paste <(left-func) <(right-func) |
awk '$3!=0 {print $0}' |
awk '{print $1*$2*$3}' |
awk '{sum+=$1} END{print sum;}'
