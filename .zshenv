# WSL config
export DISPLAY=:0
export NO_AT_BRIDGE=1

export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

# python, pipenv
export PATH=$HOME/miniconda3/bin:$PATH
export PATH="$PATH:$HOME/.local/bin"
export PIPENV_PYPI_MIRROR="https://pypi.tuna.tsinghua.edu.cn/simple"
export WORKON_HOME="$HOME/.virtualenvs"

# JAVA 
export JAVA_HOME=$HOME/java/jdk1.8.0_221
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH

# maven
export M2_HOME=$HOME/maven
export PATH=$M2_HOME/bin:$PATH

# sbt
export SBT_HOME=$HOME/sbt
export PATH=$SBT_HOME/bin:$PATH

# scala language server for emacs
export PATH=$HOME/metals:$PATH

# Golang
# enable go module
export GO111MODULE=on
# use go.proxy
export GOPROXY=https://goproxy.io,direct

export GOROOT=$HOME/go
export GOPATH=$HOME/go_path
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOBIN

