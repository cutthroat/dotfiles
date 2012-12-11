# 40_cdls.zsh

list_dir() {
    emulate -LR zsh
    ls
}
chpwd_functions+=(list_dir)
