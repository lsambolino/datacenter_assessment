#
#!/bin/bash

# Setting the date variable for outputting the file
_now=$(date +"%m_%d_%Y")
_file="/tmp/assessments/output$_now.csv"

# Initializing the prefix variable, this is needed to clean the standard output:
prefix="SUCCESS => {:    "ansible_facts": {: "


#Block of Code which works

# Declaring the specs I need
declare -a specs=("ansible_all_ipv4_addresses" "ansible_all_ipv6_addresses" "ansible_architecture": "x86_64" "ansible_default_ipv4" "ansible_devices" "ansible_distribution" "ansible_distribution_release" "ansible_distribution_version" "ansible_dns" "ansible_nodename" "ansible_processor" "ansible_processor_cores" "ansible_uptime_seconds")




# For cycle which take the specs array and output the result of ansible setup command in a csv
#for i in "${specs[@]}"
#do
#        long_output=$(ansible rhelmachines -m setup -a 'filter='$i'' | tr "\n" ":")
# 	echo "long_output" "$long_output"
#	short_output=${long_output#$prefix}
#	echo "short_output:" "${short_output}"
#	echo "$short_output" >> $_file
#done



ansible -m setup localhost | sed -e 's/^[[:alpha:]].*[|].* [>][>] {$/{/' | jq '[inputs | .ansible_facts as $facts |  $facts.ansible_hostname as $hostname | {($hostname): {    "ipv4_addresses":  $facts.ansible_all_ipv4_addresses, "processor": $facts.ansible_processor[0], "cores": $facts.ansible_processor_cores, "uptime": $facts.ansible_uptime_seconds}}] | add'
