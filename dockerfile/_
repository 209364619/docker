lines=`cat $1|wc -l`
echo $lines
for((i=2;i<=$lines;i++))
do
echo $i
ipaddr=`head -n $i $1|tail -n 1|cut -d ' ' -f 1`
hostname=`head -n $i $1|tail -n 1|cut -d '' -f 3`
#echo "$ipaddr   datanode" >> /etc/hosts
#echo  $ipaddr >> /opt/hadoop/etc/hadoop/slaves
echo $ipaddr
echo "$ipaddr	$hostname" >> b.txt
echo $ipaddr >> b.txt
done

