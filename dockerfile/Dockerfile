# 基础镜像
FROM centos
# 作者
MAINTAINER iecas
# 安装 jdk
#RUN yum install install -y java-1.8.0-openjdk
# 安装 vim
RUN yum install -y vim
# 查看 ip 命令
RUN yum install -y net-tools
# 安装 sshd 服务端
RUN yum install -y openssh-server
# 安装 sshd 客户端
RUN yum install -y openssh-clients
RUN yum install -y expect
# 将 root 用户密码改为 123456
RUN echo 'root:123456' |chpasswd
RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N ''
RUN mkdir /var/run/sshd
RUN mkdir -p /hadoop/hdfs
ADD hadoop-2.6.0.tar.gz /opt/
ADD jdk-8u131-linux-x64.tar.gz /opt
RUN mv /opt/hadoop-2.6.0 /opt/hadoop
RUN mv /opt/jdk1.8.0_131 /opt/jdk
ADD core-site.xml  hadoop-env.sh  hdfs-site.xml  slaves /opt/hadoop/etc/hadoop/
ADD profile /etc
ADD withoutpassword/* /root/
ADD list.txt /root/
#ADD start.sh /root/
#ADD host_test /etc/
EXPOSE 22
CMD  ["/usr/sbin/sshd","-D"]
