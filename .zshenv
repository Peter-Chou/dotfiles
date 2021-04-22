# WSL config
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export LIBGL_ALWAYS_INDIRECT=1

export NO_AT_BRIDGE=1
#
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
#
# # python, pipenv
export PATH=$PATH:$HOME/miniconda3/bin
export PATH="$PATH:$HOME/.local/bin"
export PIPENV_PYPI_MIRROR="https://pypi.tuna.tsinghua.edu.cn/simple"
export WORKON_HOME="$HOME/miniconda3/envs"
#
# # llvm & clang & clangd
export LLVM_HOME="/opt/llvm"
export PATH=$LLVM_HOME/bin:$PATH
export LD_LIBRARY_PATH=$LLVM_HOME/lib:$LD_LIBRARY_PATH
#
# clangd
# export PATH=$HOME/clangd-10/bin:$PATH
# export LD_LIBRARY_PATH=$HOME/clangd-10/lib:$LD_LIBRARY_PATH
#
# # Golang
# # enable go module
export GO111MODULE=on
# # use go.proxy
# export GOPROXY=https://goproxy.io,direct
export PATH=/opt/go/bin:$PATH
export PATH=$PATH:/home/peter/go/bin
#
# # JAVA
# export JAVA_HOME=$HOME/java/jdk1.8.0_221
export JAVA_HOME="/opt/jdk"
export PATH=$JAVA_HOME/bin:$PATH
#
# # maven
export M2_HOME=/opt/maven
export PATH=$M2_HOME/bin:$PATH
#
# # sbt
export SBT_HOME=$HOME/sbt
# # use global repository setting instead of project one
export SBT_OPTS="-Dsbt.override.build.repos=true"
export PATH=$SBT_HOME/bin:$PATH
#
# # scala language server for emacs
export PATH=$HOME/metals:$PATH

# cmake
export PATH=$HOME/cmake/bin:$PATH

# node
export PATH=$HOME/node/bin:$PATH

# network
# export HOST_IP=$(grep -oP '(?<=nameserver\ ).*' /etc/resolv.conf)
# export PORXY_ADDR="http://${HOST_IP}:1080"
# export all_proxy="$PORXY_ADDR"
# export http_proxy="$PORXY_ADDR"
# export https_proxy="$PORXY_ADDR"
# export ALL_PROXY="$PORXY_ADDR"
# export HTTP_PROXY="$PORXY_ADDR"
# export HTTPS_PROXY="$PORXY_ADDR"

# bazel-compdb
# export PATH=$PATH:$HOME/bazel-compilation-database
