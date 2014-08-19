#!/bin/sh
# Mac Version
# notic: ^M^L = Ctrl+v Ctrl+Enter Ctrl+v Ctrl+l
export PATH=${PATH}:/usr/local/bin:/usr/local/sbin
alias httphere="python -m SimpleHTTPServer"
alias blog="cd ~/yishenggudou.github.com/ && vim ~/yishenggudou.github.com/blog/source/"
export httphere
export ECLIPSE_HOME=/Applications/eclipse/

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH:/Users/timger/scripts/"
export PATH=${PATH}:"/usr/local/share/python/"
export PYTHONPATH="${PYTHONPATH}:/Library/Python/2.7/site-packages"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:${PYTHONPATH}"
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
#export ANDROIDSDK="/Volumes/MACEXT/libs/android-sdk-linux/"
#export ANDROIDNDK="/Volumes/MACEXT/libs/android-ndk-r8c/"
#export ANDROIDNDKVER=r8c
#export ANDROIDAPI=14
#export PATH=$ANDROIDNDK:$ANDROIDSDK/platform-tools:$ANDROIDSDK/tools:$PATH
alias linode='ssh root@106.186.117.23'
export PATH=${PATH}:/Volumes/TIMGER/apps/adt-bundle-mac-x86_64-20131030/sdk/platform-tools:/Volumes/TIMGER/apps/adt-bundle-mac-x86_64-20131030/sdk/tools


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
