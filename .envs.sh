export DATATMPDIR='/Volumes/TIMGER/DATATMP'
export CLICOLOR=1
export TERM=xterm-color
export LSCOLORS=fxfxcxdxbxegedabagacad
#git config --global color.diff true
#java_home
export JAVA_HOME=`/usr/libexec/java_home -v 1.6`
#setting utf-8 encode for ssh 
#echo ">>> PYTHONPATH:"
#echo $PYTHONPATH
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


# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

export GOROOT=`go env GOROOT`
export PATH=$PATH:$GOROOT/bin
export GOPATH=$GOROOT/pkg/
