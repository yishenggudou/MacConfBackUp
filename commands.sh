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
    branch=`git branch|grep '\*'|head -1|awk '{print $2}'`
    echo "push branch ${branch}"
    git push origin ${branch}
}

pull_auto_branch() {
    branch=`git branch|grep '\*'|head -1|awk '{print $2}'`
    echo ${branch}
    echo "git pull origin ${branch}"
    git pull origin ${branch}
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

cordova_rebuild_ios(){
    cordova platform rm ios
    cordova platform add ios
    cordova build ios
}

cordova_rebuild_android(){
    cordova platform rm android
    cordova platform add android
    cordova build android
}


cordova_publish_android(){
    project_name=$1
    apk_path="platforms/android/bin/${project_name}-release-unsigned.apk"
    cordova plugin add ~/GitHub/PhoneGapPlugins/cordova-plugin-device
    cordova plugin add ~/GitHub/PhoneGapPlugins/cordova-plugin-admob
    #cordova plugin add  org.apache.cordova.device-motion
    cordova plugin add ~/GitHub/PhoneGapPlugins/cordova-plugin-inappbrowser
    ##cordova plugin add org.apache.cordova.console
    cordova plugin add ~/GitHub/PhoneGapPlugins/cordova-plugin-console
    cordova platforms rm android
    cordova plugin rm org.apache.cordova.console
    cordova platforms add android
    sed -i '' "s%debuggable=\"true\"%debuggable=\"false\"%g" platforms/android/AndroidManifest.xml
    cordova build --release android
    echo keytool -genkey -v -keystore ~/my-release-key.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000
    jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore ~/my-release-key.keystore ${apk_path} alias_name
    release_app_dir="/Volumes/TIMGER/release_app/${project_name}/android"
    mkdir -p ${release_app_dir}
    zipalign -v 4 ${apk_path} ${release_app_dir}/${project_name}.apk
    mkdir -p "${release_app_dir}/Screenshots/"
    for size in 512px*512px 1024px*500px  180px*120px 173px*335px 480px*800px
    do
        phantomjs ~/.phantomjs/rasterize.js www/index.html "${release_app_dir}/Screenshots/Screenshot_${size}.png" ${size}
    done
    phantomjs ~/.phantomjs/rasterize.js www/index.html "${release_app_dir}/Screenshots/Screenshot_base.png" 
}

cordova_sphine_theme(){
    cat ~/sphinx_theme.conf
}


cordova_init_doc_project(){
    echo "create project $1"
    project_dir="build/$1"
    id="com.timger.$1"
    cordova create ${project_dir} ${id} $1
    cd ${project_dir}
    echo "add admob plugin..........."
    cordova plugin add ~/GitHub/PhoneGapPlugins/cordova-plugin-device
    cordova plugin add ~/GitHub/PhoneGapPlugins/cordova-plugin-admob
    #cordova plugin add  org.apache.cordova.device-motion
    cordova plugin add ~/GitHub/PhoneGapPlugins/cordova-plugin-inappbrowser
    ##cordova plugin add org.apache.cordova.console
    cordova plugin add ~/GitHub/PhoneGapPlugins/cordova-plugin-console
}

sphinx2cordova(){
    echo "create project $1"
    project_dir="build/$1"
    echo ">>>${project_dir}"
    id="com.timger.$1"
    rm -vfr build/html
    mkdir build
    cordova create ${project_dir} ${id} $1
    echo "change Makefile ........"
    sed -i ''  "s%)/html%)/$1/www%g" Makefile
    sed -i ''  "s%build/html%build/$1%g" Makefile
    make html 
    echo "replace analysis code....."
    sed -i ''  "s%UA-6139100-3%UA-29124639-1%g" ${project_dir}/www/index.html
    cp -rv build/html/* ${project_dir}/www/
    cd ${project_dir}
    echo "add admob plugin..........."
    cordova plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-device.git
    cordova plugin add https://github.com/aliokan/cordova-plugin-admob
    #cordova plugin add  org.apache.cordova.device-motion
    cordova plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-inappbrowser.git
    ##cordova plugin add org.apache.cordova.console
    cordova plugin add https://git-wip-us.apache.org/repos/asf/cordova-plugin-console.git
    cordova platform add ios
    cordova platform add android
    #cordova build 
    cd ../..
}
