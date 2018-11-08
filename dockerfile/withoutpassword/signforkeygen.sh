#!/usr/bin/expect
set ip [lindex $argv 0]
set password [lindex $argv 1]
spawn  ssh $ip "/root/keygen_slave.sh"
expect {
      "(yes/no)?" { send "yes\r"; exp_continue }
      "password:" { send "$password\r" }
}
interact
