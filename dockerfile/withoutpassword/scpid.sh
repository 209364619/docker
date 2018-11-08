#!/usr/bin/expect
set ip [lindex $argv 0]
set password [lindex $argv 1]
spawn  scp -rq /root/.ssh/authorized_keys root@$ip:/root/.ssh
expect {
      "(yes/no)?" { send "yes\r"; exp_continue }
      "password:" { send "$password\r" }
}
interact
