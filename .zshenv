# snap
export PATH=/snap/bin:$PATH

# python, pipenv
export PATH=$PATH:$HOME/miniconda3/bin
export PATH="$PATH:$HOME/.local/bin"
export WORKON_HOME="$HOME/miniconda3/envs"

# cmake
export PATH=$HOME/cmake/bin:$PATH

# llvm & clang & clangd
export LLVM_HOME="/opt/llvm"
export PATH=$LLVM_HOME/bin:$PATH

# node
export PATH=$HOME/node/bin:$PATH

# maven
export M2_HOME=/opt/maven
export PATH=$M2_HOME/bin:$PATH

# JAVA
export JAVA_HOME="/opt/jdk11"
export PATH=$JAVA_HOME/bin:$PATH

# protoc
export PATH=/opt/protoc/bin:$PATH

# emacs-lsp-booster
export PATH=$PATH:/opt/emacs-lsp-booster/bin

# ### emacs lsps
# cmake lsp
export PATH=/opt/neocmakelsp/bin:$PATH

# ### emacs formatters
export PATH=/opt/shfmt/bin:$PATH

### rust config
export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup

. "$HOME/.cargo/env"
