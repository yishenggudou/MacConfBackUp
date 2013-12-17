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


alias kill_chrome="ps aux|grep Chrome|grep -v grep|awk '{print \$2}'|xargs kill"
alias kill_zoc="ps aux|grep zoc|grep -v grep|awk '{print \$2}'|xargs kill"
alias kill_xcode="ps aux|grep Xcode|awk '{print \$2}'|xargs kill"
alias kill_dict="ps aux|grep YoudaoDict|awk '{print \$2}'|xargs kill"
alias nib2objc="/Users/timger/Stegosaurus/tools/nib2objc.17\ PM/usr/local/bin/nib2objc"

alias django_run="python manage.py  runserver"
alias wget_all_site="wget -r -np -nd "


#python
alias python_mprofile="python –m profile"


#python
alias cms_python="/Volumes/MACEXT/sitecms/bin/python"
alias cms_pip="/Volumes/MACEXT/sitecms/bin/pip"
alias cms_django_admin="/Volumes/MACEXT/sitecms/bin/django-admin.py"


#EMP
export DATATMPDIR='/Volumes/TIMGER/DATATMP'
