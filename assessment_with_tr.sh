#
#!/bin/bash

# Setting the date variable for outputting the file
_now=$(date +"%m_%d_%Y")
_file="/tmp/assessments/output$_now.csv"

# Initializing the prefix variable, this is needed to clean the standard output:
prefix='SUCCESS'
midfix='ansible_facts'
changed='changed'
suffix='false'

#Block of Code which works

# Declaring the specs I need
declare -a specs=("ansible_nodename" "ansible_all_ipv4_addresses" "ansible_all_ipv6_addresses" "ansible_architecture" "ansible_distribution" "ansible_distribution_release" "ansible_distribution_version" "ansible_dns" "ansible_memtotal_mb" )

# For cycle which take the specs array and output the result of ansible setup command in a csv
#for i in "${specs[@]}"
#do
#       long_output=$(ansible pov -m setup -a 'filter='$i'' | tr "\n" ":")
# 	echo "long_output" "$long_output"
#	short_output=${long_output#$prefix}
#	echo "short_output:" "${short_output}"
#	echo "$short_output" >> $_file
#done

#For Cycle testing more substitution
for i in "${specs[@]}"
do
        long_output=$(ansible pov -m setup -a 'filter='$i'' | sed -e "s/$prefix//" -e "s/$midfix//" -e "s/$suffix//" -e "s/$changed//" | tr -d [:blank:] | tr "\n" ":" )
	echo "$long_output"
	echo "$long_output" >> $_file
done	
