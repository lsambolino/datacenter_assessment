#!/bin/bash

#printf "CPU average (montly): "

let somma=0

NUMBER_OF_DAYS=$(ls -la /var/log/sa/* | grep sa[0-9] | wc -l)

for file in $(ls -la /var/log/sa/* | grep sa[0-9] | awk '{print $9}')
do
        DAY_AVG=$(sar -u -f $file 2>/dev/null | grep Average: | awk -F " " '{sum = (100 - $8) } END { print sum }')

        somma=$(echo $somma $DAY_AVG | awk '{print $1 + $2}')

        #printf "Memory Average: "
        #sar -r -f $file | grep Average | awk -F " " '{ sum = ($3-$5-$6)/($2+$3) * 100   } END { print sum "%" }'

        #printf "\n"
done

AVG=$(echo $somma $NUMBER_OF_DAYS | awk '{print $1 / $2}')

printf $AVG
#printf "\n"
