
[[ -s "/Users/timger/.rvm/scripts/rvm" ]] && source "/Users/timger/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#setting utf-8 encode for ssh 
echo ">>> PYTHONPATH:"
echo $PYTHONPATH
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
#add path
PATH=/usr/local/bin:$PATH:/usr/local/sbin
export PATH
export SVN_EDITOR=vim
export EDITOR=vim
##
# Your previous /Users/timger/.bash_profile file was backed up as /Users/timger/.bash_profile.macports-saved_2012-07-23_at_22:57:26
##

# MacPorts Installer addition on 2012-07-23_at_22:57:26: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
#:/Applications/Kivy.app/Contents/MacOS:/Applications/Kivy.app/Contents/Resources/kivy:/Library/Python/2.7/site-packages
export PATH=${PATH}

if [ -z "$PYTHONPATH" ]
then
    export PYTHONPATH=/Library/Python/2.7/site-packages/:/usr/local/lib/python2.7/site-packages/
else
    export PYTHONPATH=$PYTHONPATH:/Library/Python/2.7/site-packages/:/usr/local/lib/python2.7/site-packages/
fi

export HDF5_DIR=/usr/local/Cellar/hdf5/1.8.9 
# Finished adapting your PATH environment variable for use with MacPorts.
for jlib in `ls /Users/timger/javalibs/`
do
    export CLASSPATH=${CLASSPATH}:/Users/timger/javalibs/${jlib}
done
export GITHUB_USER=yishenggudou
export GITHUB_PASSWORD=11259375

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


alias httpserver="python -m SimpleHTTPServer"
export PATH=/Users/timger/gae/google_appengine:$PATH
echo "hello @timger"
echo "------------"
source ~/.bashrc
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome &"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
