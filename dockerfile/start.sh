#!/bin/bash
source /etc/profile
masterip=`head -n 1 $1|cut -d ' ' -f 1`
lines = `cat $1|wc -l`
for((i=2;i<=$lines;i++))
do
ipaddr=`head -n $i $1|tail -n 1|cut -d ' ' -f 1`
hostname = `head -n $i $1|tail -n 1|cut -d ' ' -f 3`
echo "$ipaddr	$hostname" >> /etc/hosts
echo  $ipaddr >> /opt/hadoop/etc/hadoop/slaves
done
./total.sh
for((i=1;i<=$lines;i++))
do
ipaddr=`head -n $i $1|tail -n 1|cut -d ' ' -f 1`
passwd=`head -n $i $1|tail -n 1|cut -d ' ' -f 2`
ssh $ipaddr "source /etc/profile"
./scp_slaves.sh $ipaddr
done
hdfs namenode -format
start-dfs.sh
