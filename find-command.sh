#!/bin/bash

# get command
find_command(){
  # get list folder
  for fd in $(ls);do
    # read about command
    if [ -f $fd ] && [[ $fd == $1 ]];then
      baca=$fd; locf=$(pwd); return
    fi
    # check directory
    if [ -d $fd ] && [ -x $fd ];then cd $fd; find_command $1; cd ..; fi
  done
}

# get input
read -p "[?] found a command : " inp
inputs="$inp.txt"
find_command $inputs baca locf
command="$locf/$baca"

# read about command
if [ -f $command ];then
  less $command
else
  echo "[!] command about <$inputs> not found"
fi
