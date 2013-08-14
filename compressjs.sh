#!/bin/bash
#Author: timger <yishenggudou@gmail.com>
#weibo <http://t.sina.com/zhanghaibo>
#@yishenggudou http://twitter.com/yishenggudou

if [ -e "/usr/local/bin/compiler.jar" ];then
    echo "compiler.jar has installed"
else
    echo "need install compiler.jar"
    echo "see https://developers.google.com/closure/compiler/docs/gettingstarted_app"
    echo "load http://closure-compiler.googlecode.com/files/compiler-latest.zip "
    echo "and to /usr/local/bin/"
fi

NEED_COMPLIED_FILE=$1
if [ -e ${NEED_COMPLIED_FILE} ];then
    java -jar "/usr/local/bin/compiler.jar" --js ${NEED_COMPLIED_FILE} --js_output_file ${NEED_COMPLIED_FILE}.min.js
else
    echo "need give a to compile file or check your file exist"
fi
