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
export httphere
export ECLIPSE_HOME=/Applications/eclipse/

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=${PATH}:"/usr/local/share/python/"
export PYTHONPATH=$PYTHONPATH:/Library/Python/2.7/site-packages
#export TOMCAT_HOME=/usr/local/Cellar/tomcat/7.0.39/
alias topdf="phantomjs /usr/local/src/rasterize.js"
alias screenshot="screencapture -s"

##mutt GMAIL
export MUTT_EMAIL_ADDRESS="yishenggudou@gmail.com"
export MUTT_REALNAME="timger"
#export MUTT_SMTP_URL="smtp://yishenggudou@smtp.gmail.com:587/"
alias python='/usr/bin/python'
