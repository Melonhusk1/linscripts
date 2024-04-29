#! /bin/bash

# backup with rsync

while :
do

my_date=$(date +"%d/%m-%H:%M:%S")

clear
cat << EOMENU 
-----------------------
which backup you need ?
-----------------------
  1 : Full
  2 : Diff
  3 : Inc
  q/Q :Quit
-----------------------
EOMENU

read -n1 -s
case "$REPLY" in
  1) Full                    ;;
  2) Diff                    ;;
  3) Inc                     ;;
  Qq) exit                   ;;
  * ) echo "invalid option"  ;;
esac
sleep 1

Full() {
  read -p "from where to begin backup ( Full path pls )" directory_to_backup
  read -p "which destination ( Full path pls )" destination_of_backup
  rsync 
}

Diff() {
  read -p "from where to begin backup ( Full path pls )" directory_to_backup
  read -p "which destination ( Full path pls )" destination_of_backup
  rsync
}

Inc() {
  read -p "from where to begin backup ( Full path pls )" directory_to_backup
  read -p "which destination ( Full path pls )" destination_of_backup
  rsync
}


done

