#!/bin/bash
set -x
set -e

cd $(dirname $0)

if [[ `whoami` != 'root' ]];then
  sudo bash `pwd`/` basename $0`
  exit
fi

date=`date +%y%m%d%H%M%S`
logfile=log.$date

bash run.sh | tee $logfile

curl -F 'data=@'$logfile http://192.168.0.1:8080/

sleep 1
bash osreinstall.sh
