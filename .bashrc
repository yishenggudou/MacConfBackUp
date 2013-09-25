#!/bin/sh
# Mac Version
# notic: ^M^L = Ctrl+v Ctrl+Enter Ctrl+v Ctrl+l
ts(){                                                                       
result=`curl -s \
        "http://dict.cn/ws.php?utf8=true&q=$1" `;

echo $result | sed -E -n 's/.*<def>([^<]+)<\/def>.*/\1/p'; 

#examples
echo $result \
    | sed -E -n 's/.*def> (<sent><orig>.*<\/sent>).*/\1/p' \
    | sed 's/&lt;em&gt;//g' \
    | sed 's/&lt;\/em&gt;//g' \
    | sed 's/<trans>/^M^L/g' \
    | sed 's/<orig>/^M^L/g' \
    | sed 's/<[^<>]*>//g' ;

return 0;

}
export PATH=${PATH}:/usr/local/bin:/usr/local/sbin
alias httphere="python -m SimpleHTTPServer"
alias blog="cd /Volumes/MACEXT/Gitwork/yishenggudou.github.com/ && vim /Volumes/MACEXT/Gitwork/yishenggudou.github.com/blog/source/"
export httphere
export ECLIPSE_HOME=/Applications/eclipse/

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH:/Users/timger/scripts/"
export PATH=${PATH}:"/usr/local/share/python/"
export PYTHONPATH=$PYTHONPATH:/Library/Python/2.7/site-packages
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
#export TOMCAT_HOME=/usr/local/Cellar/tomcat/7.0.39/
alias topdf="phantomjs /usr/local/src/rasterize.js"
alias screenshot="screencapture -s"

##mutt GMAIL
export MUTT_EMAIL_ADDRESS="yishenggudou@gmail.com"
export MUTT_REALNAME="timger"
#export MUTT_SMTP_URL="smtp://yishenggudou@smtp.gmail.com:587/"
alias python='/usr/bin/python'
alias loglifeng='cd /Users/timger/Downloads && ssh -i magicmirror.pem ubuntu@54.250.223.236'
alias bae="cd /Volumes/MACEXT/bae"
export ANDROIDSDK="/Volumes/MACEXT/libs/android-sdk-linux/"
export ANDROIDNDK="/Volumes/MACEXT/libs/android-ndk-r8c/"
export ANDROIDNDKVER=r8c
export ANDROIDAPI=14
export PATH=$ANDROIDNDK:$ANDROIDSDK/platform-tools:$ANDROIDSDK/tools:$PATH
alias linode='ssh root@106.186.117.23'
