#!/bin/bash
source /etc/profile
masterip=`head -n 1 $1|cut -d ' ' -f 1`
lines=`cat $1|wc -l`
echo $lines
echo "copy hostname..."
for((i=2;i<=$lines;i++))
do
ipaddr=`head -n $i $1|tail -n 1|cut -d ' ' -f 1`
name=`head -n $i $1|tail -n 1|cut -d ' ' -f 3`
echo "$ipaddr	$name" >> /etc/hosts
echo  $ipaddr >> /opt/hadoop/etc/hadoop/slaves
done
echo "total starting...."
./total.sh $1
echo "sending slaves..."
for((i=1;i<=$lines;i++))
do
ipaddr=`head -n $i $1|tail -n 1|cut -d ' ' -f 1`
passwd=`head -n $i $1|tail -n 1|cut -d ' ' -f 2`
ssh $ipaddr "source /etc/profile"
scp /opt/hadoop/etc/hadoop/slaves $ipaddr:/opt/hadoop/etc/hadoop/slaves
scp /etc/hosts $ipaddr:/etc/
done
hdfs namenode -format
start-dfs.sh
