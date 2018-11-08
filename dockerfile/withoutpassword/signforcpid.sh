#!/usr/bin/expect
set ip [lindex $argv 0]
set password [lindex $argv 1]
set desip [lindex $argv 2]
set despassword [lindex $argv 3]
spawn  ssh $ip "/root/cpid.sh $desip $despassword"
expect {
      "(yes/no)?" { send "yes\r"; exp_continue }
      "password:" { send "$password\r" }
}
interact
