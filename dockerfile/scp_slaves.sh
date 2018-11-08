#!/usr/bin/expect
set ip [lindex $argv 0]
set timeout 3
spawn scp /opt/hadoop/etc/hadoop/slaves $ip:/opt/hadoop/etc/hadoop/
expect{
	"(yes/no)?" {send "yes\r"}
}
interact
