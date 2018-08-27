This is the readme file for the assessment scripts.

Here there is a list of files and their usage.

	/playbooks/assessment.sh

	# This script uses the "setup" command of Ansible. It connect to the specified group of
	machines, it gathers their information and it write a summary in a csv file


	/playbooks/ansible.cfg
	
	# It specifies ansible settings. Not much to do here actually

	/playbooks/hosts
	
	# The list of hosts should be defined here. Hosts are also tagged by their name: [nameoftheho		stgroups]

	/playbooks/output.csv 
	
	# This is the output (target file)
	
	/playbooks/fetch_hostfile.yml
	
	# This is the Ansible playbook useful for collecting the /etc/host file from every host. It 		has  to be launched by the "ansible-playbook fetch_hostfile.yml" command. The output 		  result is contained in the /tmp/fetched/ folder. Destination hosts are grouped in folders.
