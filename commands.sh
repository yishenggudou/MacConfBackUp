#!/bin/bash
#Author: timger <yishenggudou@gmail.com>
#weibo <http://t.sina.com/zhanghaibo>
#@yishenggudou http://twitter.com/yishenggudou

share(){
    echo "Share $1"
    share_dir="/haibo/share/"
    gsutil cp -v -a public-read $1   gs:/${share_dir}
    echo "http://commondatastorage.googleapis.com${share_dir}$1"
}
