#!/bin/bash
masterip=`head -n 1 $1 |cut -d ' ' -f 1`
masterpasswd=`head -n 1 $1 |cut -d ' ' -f 2`
./clean_master.sh
./keygen_master.sh
last=`cat $1|wc -l`
for((i=2;i<=$last;i++))
do
	slaveip=`head -n $i $1 |tail -n 1|cut -d ' ' -f 1`
	slavepasswd=`head -n $i $1 |tail -n 1|cut -d ' ' -f 2`
	./clean_slave.sh $slaveip $slavepasswd
	./scp.sh $slaveip $slavepasswd
	./signforkeygen.sh $slaveip $slavepasswd
	./signforcpid.sh $slaveip $slavepasswd $masterip $masterpasswd
done
for((i=2;i<=$last;i++))
do
	slaveip=`head -n $i $1 |tail -n 1|cut -d ' ' -f 1`
	slavepasswd=`head -n $i $1 |tail -n 1|cut -d ' ' -f 2`
	./scpid.sh $slaveip $slavepasswd
done
