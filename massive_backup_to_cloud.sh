#! /bin/bash

# this script task in input a name or a list to backup from source (system source) to dest (img for virtualization).
#

# Colors example --> echo -e "${cyan}Please choose the type of device${neutre}"
jaune='\e[1;33m'
bleu_blanc='\e[36;47m'
jaune_blanc='\e[33;47m'
jaune_rouge='\e[33;41m'
blanc_bleu='\e[47;36m'
rose='\e[1;35m'
rouge='\e[1;31m'
vert='\e[1;32m'
cyan='\e[1;36m'
neutre='\e[1;m'

# vars
my_date=$(date +"%d-%m_%H:%M:%S")

######################################################################################################################
# beginning

version=1.0
OPTERR=0

while getopts "hHlo:vV-:" option; do

    if [ "$option" = "-" ]; then
        case $OPTARG in
            list ) option=l
            ;;
            output ) option=o
            ;;
            host ) option=H
            ;;
            help ) option=h
            ;;
            verbose ) option=v
            ;;
            version ) option=V
            ;;
            : ) echo -e "${rouge}Option $OPTARG not set${neutre}"
            ;;
            * ) echo -e "${rouge}Option $OPTARG not known${neutre}"
            ;;
        esac
    fi
    case "$option" in 
        l ) echo -e "option l // select list of server to backup"
        ;;
        o ) echo -e "option o // output logs to a file = $OPTARG"
        ;;
        H ) echo -e "option H // select hostname of workstation to backup"
        ;;
        h ) echo -e "${blanc_bleu}Syntaxe : $(basename $0) [ option... ]${neutre}"
            echo -e "${blanc_bleu}Options : ${neutre}"
            echo -e "${blanc_bleu}-v --version : Print version${neutre}"
            echo -e "${blanc_bleu}-h : Print help Screen${neutre}"
            echo -e "${blanc_bleu}-H [hostname] [dest_path] : select an oly workstation to backup to img${neutre}"
            echo -e "${blanc_bleu}-o [ /full/path ... ] ${neutre}"
            echo -e "${blanc_bleu}-l [/full/path/file.txt] : select a file for input list of workstations (1 per line)${neutre}"
        ;;
        v ) écho -e "mode verbose (logs in the current shell)"
        ;;
        V ) echo -e "${vert}Version : $(basename $0) $version ${neutre}"
        ;;
        ? ) echo -e "${rouge}Option $OPTARG not known ${neutre}"
        ;;
    esac

done
shift $((OPTIND -1))
while [ $# -ne 0 ]; do
    echo "Argument suivant : " $1
    shift
done
