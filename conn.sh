#!/bin/bash
#Author: timger <yishenggudou@gmail.com>
#weibo <http://t.sina.com/zhanghaibo>
#@yishenggudou http://twitter.com/yishenggudou
HOST=$1
echo "${HOST}"

if [ "$HOST" = 'qiyi' ]
then
     echo 'this server is tiger web server and password is \n zhanghaibo'
     ssh zhanghaibo@10.1.5.14
elif [ "$HOST" = 'vhost' ]
then
     echo 'this server is my vhost server and password is \n zhanghaibo'
     ssh root@10.1.30.200 
elif [ "$HOST" = 'centos' ]
then
     echo 'this server is my data server and password is \n 11259375'
     ssh  root@192.168.1.109 

elif [ "$HOST" = '9' ]
then
     echo 'this server is my data server use key'
     echo '/data/uestat/'
     ssh zhanghaibo@10.11.50.9 

elif [ "$HOST" = 'aliyun' ]
then
     echo 'this server is my data server use key'
     echo 'c9bf91'
     ssh root@42.120.50.71 

else
    echo 'do need to coon'
fi

