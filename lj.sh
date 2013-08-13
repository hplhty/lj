#!/bin/bash
# Peter Hu
# 20130813

declare -a yin
declare -a tu
yin=( a i u e o ka ki ku ke ko sa si/shi su se so ta ti/chi tu/tsu te to na ni nu ne no ha hi hu/fu he ho ma mi mu me mo ya '(i)' yu '(e)' yo ra ri ru re ro wa '(i)' '(u)' '(e)' wo n )
tu=( あ い う え お か き く け こ さ し す せ そ た ち つ て と な に ぬ ね の は ひ ふ へ ほ ま み む め も や '(い)' ゆ '(え)' よ ら り る れ ろ わ '(い)' '(う)' '(え)' を ん )
range=${#tu[@]}
err_path=lj_error.txt

# Arrary
#echo ${yin[@]:0:15}
#echo ${tu[@]0}
#echo ${tu[@]:10:20}

#echo ${#yin[@]}
#echo ${#tu}

print_yin_tu()
{
    local i=0
    echo ""
    echo "================="
    while [ $i -lt $range ]
    do
	echo -n "${yin[$i]} "
	i=`expr $i + 1`
	if [ $(($i % 5)) -eq 0 ]; then
	    echo " "
	    j=$(($i-5))
	    while [ $j -lt $i ]
	    do
		echo -n "${tu[$j]} "
		j=`expr $j + 1`
	    done
	    echo " "
	    echo " "
	fi
    done
    echo -n "${tu[$(($range - 1))]}"
    echo " "
    echo "================="
    echo " "
}

i=0
while [ $i -lt $range ]
do
    #    echo -n "${tu[$i]}"
    i=`expr $i + 1`
    idx=$(($RANDOM%51))
    printf "%2d: " $idx
    echo -n "${tu[$idx]} "
    read x
    if [ -z $x ]; then
	    echo -n "    "
	    echo "${yin[$idx]}"
#	    echo "${yin[$idx]}" | tee $err_path
    elif [ $x = ${yin[$idx]} ]; then
	    echo "Correct!!!"
    elif [ $x = "h" ]; then
	    print_yin_tu
    else
	echo -n "    "
	echo "${yin[$idx]}"
#	echo "${yin[$idx]}" | tee $err_path
    fi
    echo " "
done

# echo "Error review: "
# cat $err_path
