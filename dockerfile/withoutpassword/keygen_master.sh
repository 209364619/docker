#!/bin/bash
ssh-keygen -t rsa -P '' -f /root/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
