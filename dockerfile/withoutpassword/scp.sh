#!/usr/bin/expect
set ip [lindex $argv 0]
set password [lindex $argv 1]
spawn  scp keygen_slave.sh cpid.sh $ip:/root
expect {
      "(yes/no)?" { send "yes\r"; exp_continue }
      "password:" { send "$password\r" }
}
interact

