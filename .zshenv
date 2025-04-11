# python, pipenv
export PATH=$PATH:$HOME/miniconda3/bin
export PATH="$PATH:$HOME/.local/bin"
export PIPENV_PYPI_MIRROR="https://pypi.tuna.tsinghua.edu.cn/simple"
export WORKON_HOME="$HOME/miniconda3/envs"
export PYTHONPATH=".:$PYTHONPATH"

# llvm & clang & clangd
export LLVM_HOME="/opt/llvm"
export PATH=$LLVM_HOME/bin:$PATH

# JAVA
export JAVA_HOME="/opt/jdk11"
export PATH=$JAVA_HOME/bin:$PATH

# maven
export M2_HOME=/opt/maven
export PATH=$M2_HOME/bin:$PATH

# cmake
export PATH=$HOME/cmake/bin:$PATH

# cmake lsp
export PATH=/opt/neocmakelsp/bin:$PATH

# node
export PATH=$HOME/node/bin:$PATH

# hadoop
export HADOOP_HOME=/opt/hadoop
export PATH=$PATH:$HADOOP_HOME/bin

# protoc
export PATH=/opt/protoc/bin:$PATH

# tree-sitter.so
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# ## emacs
export PATH=/home/peter/emacs-30.1/src:$PATH

# emacs-lsp-booster
export PATH=$PATH:/opt/emacs-lsp-booster/bin

. "$HOME/.cargo/env"
