# WSL config
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
# export LIBGL_ALWAYS_INDIRECT=1
export LIBGL_ALWAYS_SOFTWARE=1

### for emacs 
export LSP_USE_PLISTS=true

export NO_AT_BRIDGE=1

export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

# python, pipenv
export PATH=$PATH:$HOME/miniconda3/bin
export PATH="$PATH:$HOME/.local/bin"
export PIPENV_PYPI_MIRROR="https://pypi.tuna.tsinghua.edu.cn/simple"
export WORKON_HOME="$HOME/miniconda3/envs"

# llvm & clang & clangd
export LLVM_HOME="/opt/llvm"
export PATH=$LLVM_HOME/bin:$PATH
#export LD_LIBRARY_PATH=$LLVM_HOME/lib:$LD_LIBRARY_PATH
#export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/opt/llvm/include/c++/v1
# export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/usr/include/c++/9:/usr/include/c++/9/backward

# clangd
# export PATH=$HOME/clangd-10/bin:$PATH
# export LD_LIBRARY_PATH=$HOME/clangd-10/lib:$LD_LIBRARY_PATH

# Golang
# enable go module
export GO111MODULE=on
# use go.proxy
# export GOPROXY=https://goproxy.io,direct
export PATH=/opt/go/bin:$PATH
export PATH=$PATH:/home/peter/go/bin

# JAVA
# export JAVA_HOME=$HOME/java/jdk1.8.0_221
export JAVA_HOME="/opt/jdk11"
export PATH=$JAVA_HOME/bin:$PATH

# maven
export M2_HOME=/opt/maven
export PATH=$M2_HOME/bin:$PATH

# sbt
export SBT_HOME=/opt/sbt
# use global repository setting instead of project one
export SBT_OPTS="-Dsbt.override.build.repos=true"
export PATH=$SBT_HOME/bin:$PATH

# scala language server for emacs
export PATH=$HOME/metals:$PATH

# cmake
export PATH=$HOME/cmake/bin:$PATH

# node
export PATH=$HOME/node/bin:$PATH

# hadoop
export HADOOP_HOME=/opt/hadoop
export PATH=$PATH:$HADOOP_HOME/bin

# protoc
export PATH=/opt/protoc/bin:$PATH

# ## emacs
export PATH=/home/peter/emacs-28.1/src:$PATH

# nvim
export PATH=$HOME/nvim/bin:$PATH:/mnt/c/neovim/bin

. "$HOME/.cargo/env"

