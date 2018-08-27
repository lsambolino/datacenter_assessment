#!/bin/bash

echo {{ansible_hostname}},"ID APP","Applicazione/Progetto","Scope freeze applicazione Parziale","Scope freeze Hostname YN","Scope,Tipologia","Isola applicativa","Riferimento Principale","Struttura","Resp. Struttura","Ambiente","Data Center",{{ansible_distribution_file_search_string}},{{ansible_distribution_release}},"Contenuto file hosts","Ready for Azure" >> log.csv


     # cmd: echo "{{ansible_domain}}","Ruolo Primario","{{ipv4_gateway}}","{{first_nameserver}}","{{second_nameserver}}","{{network_interfaces_number}}","Network 1","Network 2","Network 3","Network 4","SW Primario","SW Secondario","Altro SW","DBMS SiNo","Cluster SiNo","ID Cluster"
#,"LB SiNo","ID Contesto Bil","RTO","RPO",{{ansible_processor_count}},{{average_cpu}},{{max_cpu}}

#{{ansible_memory_mb.real.total}},{{ansible_memory_mb.real.used}},{{disks_number}},{{boot_size}},{{boot_percentage}},{{data_percentage}},{{data_size}},{{data_percentage}},"Tipologia Storage",{{network_share}},{{encryption_presence}},"Livello Backup","Note","Commenti" >> log.csv

