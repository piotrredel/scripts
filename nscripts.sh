#!/bin/bash
#------------------------------------------
# Author: Piotr Redel 'Redelek' 2008-08-10
# Contact: piotr.redel@gmail.com
# Version: ver 0.4
# MOD: 2014-09-29
# Platform: Linux Debian, Ubuntu
#------------------------------------------
# Application name : Nscript
#------------------------------------------
# How to use:
#    -- download file nscript.sh
#    -- chmod +x nscript.sh
#    -- run file command ./nscript.sh ARG1 ARG2
#    -- sample ./nscript.sh file_name_test.sh ba
#    -- Good luck !! 
#------------------------------------------
WPERL=`whereis perl |cut -f2 -d' '`
WPYTHON=`whereis python |cut -f3 -d' '`
WBASH=`whereis bash |cut -f2 -d' '`
FILE="$1"
LANG="$2"
DT=`date +'%Y-%m-%d'`
KOD="# default shell UTF-8"
MOD="MOD: "
LINE="#------------------------------------------"
AUTHOR="# Author: Piotr Redel 'Redelek' $DT"
CONTACT="# Contact: piotr.redel@gmail.com"
VER="# Version: ver 0.1"
PLATFORM="# Platform: Linux Debian, Ubuntu"
LINE2="#------------------------------------------"
APPNAME="# Aplication name: "
LINE3="#------------------------------------------"
USAGE="# How to use: "
LINE4="#------------------------------------------"


PROG="vim"

if [ $# = 2 ]; then
    if [ -e "$FILE" ]; then
        echo "A file with this name exists !."
        exit 1
    fi
    case $LANG in
    "py") STARTLINE="#!$WPYTHON"
              KOD="-*- coding: utf-8 -*-"
    ;;
    "pe") STARTLINE="#!$WPERL"
    ;;
    "ba") STARTLINE="#!$WBASH"
    ;;
    *) echo "I can not find such a program.
            py->PYTHON
            pe->PERL
            ba->BASH"
        exit 1
    ;;
    esac
    #echo "dokladnie 2 parametry"
    echo -e >> $FILE "${STARTLINE}\n${KOD}\n${LINE}\n${AUTHOR}\n${CONTACT}\n${VER}\n${PLATFORM}\n${LINE2}\n${APPNAME}\n${LINE3}\n${USAGE}\n${LINE4}\n\n"
    chmod +x $FILE
    $PROG $FILE
fi
if [ $# != 2 ]; then
    echo "The script works properly after 2 parameters
        1. File name !!!!
        2. The executable program ( py->PYTHON, pe->PERL, ba->BASH"
    exit 1
fi
