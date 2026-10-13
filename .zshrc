# Fig pre block. Keep at the top of this file.
# [[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
export ZSH=$HOME/.zsh
export HISTFILE=$ZSH/.zsh_history
export HISTCONTROL=ignoredups
export HISTSIZE=100000
export SAVEHIST=100000
export TERM=xterm-256color
# 自定义变量：显示当前历史命令总数
# history -a  # 实时更新历史记录history_count=$(history | wc -l)
# setopt HIST_IGNORE_ALL_DUPS

source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# fpath=($ZSH/plugins/zsh-completions/src $fpath)
# 历史记录配置
# setopt INC_APPEND_HISTORY   # 实时追加历史
# setopt HIST_IGNORE_SPACE     # 忽略空格开头的命令
# zshaddhistory() { return $? } # 仅记录成功命令

# zsh-autosuggestions 配置
# export ZSH_AUTOSUGGEST_STRATEGY=(completion history)
# export ZSH_AUTOSUGGEST_HISTORY_IGNORE="*error*|*not found*" # 按需修改模式
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=green'
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZSH_AUTOSUGGEST_MAX_SUGGESTIONS=50
export ZSH_AUTOSUGGEST_CURSOR_STYLE='underline,dashed'

# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#555555,bg=cyan,bold,underline"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#777777,bold,underline"

# export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

export GOROOT=$HOME/.g/go
export GOPATH=$HOME/gopath
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/.cargo/bin:/opt/nvim/bin:$HOME/.local/bin
export GOPROXY=https://goproxy.cn,direct
export G_MIRROR=https://golang.google.cn/dl/
# export HELIX_RUNTIME="$HOME/man/helix/runtime"
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/root/si78c/SDL2-2.0.14/_install/lib
# export NODE_OPTIONS=--openssl-legacy-provider
eval "$(fnm env --use-on-cd)"
# export LS_COLOR="di=01;31"
# alias ls="lsd"
# alias ls="ls --color=auto"
alias l="lsd -laht"
alias ls="lsd -t -h"
# alias ls="lsd"
export TIME_STYLE='+%Y-%m-%d %H:%M:%S'
# eval "$(zellij setup --generate-auto-start zsh)"
# alias git="LANG=en_GB git"
alias ll="lsd -Alt"
alias la="lsd -alht"
# alias l="ls -Alh"
# alias grep="rg"
# alias find="fd"
alias cp="xcp"
alias lzd="lazydocker"
alias tldr="tldr"
alias tl="tldr"
alias sudo="sudo-rs"
alias su="su-rs"
alias man="tldr"
# alias cp="advcp -g"
# alias mv="advmv -g"
# alias btm="btm --enable_gpu"
# alias source-file="tmux source-file"
# alias curl=xh
# alias tmux=tmux-rs
# autoload -Uz vcs_info
# precmd() { vcs_info }
# echo $vcs_info_msg_0_

# zstyle ':vcs_info:git:*' formats '%b '
# setopt PROMPT_SUBST

# PROMPT="%(?:%{$fg_bold[green]%}>:%{$fg_bold[red]%}>)"
# PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)%(!.#.$) '

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}x"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# PROMPT='[%F{magenta}$USER%f][%F{green}%D{%Y-%m-%d %H:%M:%S}%f][%F{cyan}%~%f] %F{green}${vcs_info_msg_0_}%f
# %F{green}$%f '

# PROMPT='[%F{green}%D{%Y-%m-%d %H:%M:%S}%f][%F{cyan}%~%f] %F{magenta}${vcs_info_msg_0_}%f
# # '
# pnpm
# export PNPM_HOME="$HOME/.local/share/pnpm"
# case ":$PATH:" in
  # *":$PNPM_HOME:"*) ;;
  # *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# pnpm end
# g shell setup
if [ -f "${HOME}/.g/env" ]; then
    . "${HOME}/.g/env"
fi
# eval "$(starship init zsh)"
# export RUSTUP_DIST_SERVER="https://rsproxy.cn"
# export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
# tput cnorm
# export DOCKER_BUILDKIT=0
# export COMPOSE_DOCKER_CLI_BUILD=0
#export CARGO_TARGET_DIR="~/.cargo/target"

#export RUST_BACKTRACE=1
# export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
# ort FORCE_UNSAFE_CONFIGURE=1
# export BRANCH_ENV=master
# export CBIOPORTAL_URL="${CBIOPORTAL_URL:-https://www.cbioportal.org}"
# export GENOME_NEXUS_URL="${GENOME_NEXUS_URL:-https://www.genomenexus.org}"
# export BACKEND=cbioportal:demo-fix-clinical-table-sortingNODE_ENV development
# if ["$TERM" = "linux" ]; then
    # fbterm byobu
# fi

# Fig post block. Keep at the bottom of this file.
# [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
# LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
# export LS_COLORS
# export LANG=en_US.UTF-8
# locale-gen zh_CN.UTF-8
# if [[ -n "$TMUX" ]]; then
    # bind '"\e[1~":"\eOH"'
    # bind '"\e[4~":"\eOF"'
# fi
# bindkey "\E[1~" beginning-of-line
# bindkey "\E[4~" end-of-line
# [[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
# [[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
# LANG=zh_CN.UTF-8
# LC_CTYPE="zh_CN.UTF-8"
# LC_NUMERIC="zh_CN.UTF-8"
# LC_TIME="zh_CN.UTF-8"
# LC_COLLATE="zh_CN.UTF-8"
# LC_MONETARY="zh_CN.UTF-8"
# LC_MESSAGES="zh_CN.UTF-8"
# LC_PAPER="zh_CN.UTF-8"
# LC_NAME="zh_CN.UTF-8"
# LC_ADDRESS="zh_CN.UTF-8"
# LC_TELEPHONE="zh_CN.UTF-8"
# LC_MEASUREMENT="zh_CN.UTF-8"
# LC_IDENTIFICATION="zh_CN.UTF-8"
# LC_ALL=

export FNM_NODE_DIST_MIRROR=https://npmmirror.com/mirrors/node
eval "$(starship init zsh)"
# eval "$(mcfly init zsh)" 
# source /home/jianghao/.config/broot/launcher/bash/br
# source <(fzf --zsh)

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export OLLAMA_HOST=0.0.0.0
# export OLLAMA_ORIGINS=*
# eval "$(zellij setup --generate-auto-start zsh)"

# bun completions
# [ -s "/home/jianghao/.bun/_bun" ] && source "/home/jianghao/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export GITHUB_ACCESS_TOKEN=""
# source <(fzf --zsh)
#alias breath='zenta now --quick'
#alias breathe='zenta now'
#alias anchor='zenta anchor'
#alias reflect='zenta reflect'

# opencode
# export PATH=/home/jianghao/.opencode/bin:$PATH

# bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"
export ZHIPU_API_KEY=""
