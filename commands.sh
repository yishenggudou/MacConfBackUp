#!/bin/bash
#Author: timger <yishenggudou@gmail.com>
#weibo <http://t.sina.com/zhanghaibo>
#@yishenggudou http://twitter.com/yishenggudou

echo " 
___________ 
< good luck \\>
----------- 
   \   ^__^
    \  (oo)\_______
       (__)\       )\\/\\
           ||----w |
           ||     ||
"

share(){
    echo "Share $1"
    share_dir="/haibo/share/"
    gsutil cp -v -a public-read $1   gs:/${share_dir}
    echo "http://commondatastorage.googleapis.com${share_dir}$1"
}


downloadallsite(){
    domain=$1
    wget \
     --recursive \
     --no-clobber \
     --page-requisites \
     --html-extension \
     --convert-links \
     --restrict-file-names=windows \
     --domains ${domain} \
     #--no-parent \
     #    www.website.org/tutorials/html/

}

push_auto_branch() {
    branch=`git branch|head -1|awk '{print $2}'`
    echo "push branch $branch"
    git push origin $branch
}

pull_auto_branch() {
    branch=`git branch|head -1|awk '{print $2}'`
    echo "git pull origin $branch"
    git pull origin $branch
}

extract () {
  #http://www.quora.com/What-are-some-useful-bash_profile-and-bashrc-tips
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}


