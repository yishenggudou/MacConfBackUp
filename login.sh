#
host=$1
case "$host" in
189 )
echo "ssh root@10.11.50.189"
ssh root@10.11.50.189
;;
162 )
ssh root@10.11.50.162
;;
aliyun )
#mosh root@hibox.me
ssh root@42.121.99.133
;;
miguo )
ssh root@23.29.69.45
;;
16 )
    ssh root@10.11.50.16
    ;;
38 )
    ssh root@10.15.130.38
    ;;
39 )
    ssh root@10.15.130.39
    ;;
119 )
    ssh root@10.11.50.119
    ;;
187 )
    ssh zhanghaibo@10.11.50.187
    ;;
14 )
    #ssh timger@10.1.5.14
    ssh timger@10.1.4.76
    ;;
vhost )
    ssh root@10.1.30.200 
    ;;
alarm )
    ssh root@10.10.130.111
    ;;
31 )
    ssh root@10.11.51.31
    ;;
liufei )
    ssh root@42.121.29.157
    ;;
9 )
    ssh zhanghaibo@10.11.50.9 -i ~/.ssh/id_rsa_17
    #ssh timger@10.1.5.14 'ssh zhanghaibo@10.11.50.9'
    ;;
aws )
    #ssh -i ~/.ssh/mac-aws.pem ubuntu@ec2-174-129-181-20.compute-1.amazonaws.com
    ssh root@54.235.143.241
    ;;
34 )
    ssh root@10.10.131.34 
    ;;
xunan )
    ssh haibo@42.121.17.193  
    ;;
223 )
    ssh root@10.10.131.223 
    ;;
ubuntu )
    ssh root@10.1.12.197 
    ;;
224 )
    ssh root@10.10.131.224 
    ;;
wangzhanbao )
    echo "97RmCakk25"
    ssh -v timgerus@timger.us.wangzhanbao.com 
    ;;
* )
echo ".."
ssh root@$host
;;
esac
