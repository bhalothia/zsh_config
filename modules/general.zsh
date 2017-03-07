autoload +X -U colors && colors

autoload +X -U keeper

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

### MISC
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# defaut editor
export VISUAL='vim'
export EDITOR='vim'
export PAGER='less'

# colorize file system completion
export LSCOLORS="Exfxcxdxbxegedabagacad" # used by ls mac
export LS_COLORS="di=1;34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30" # used by common ls and completion

# support colors in less
LESS_TERMCAP_md=$(printf "${fg_bold[green]}") \
LESS_TERMCAP_us=$(printf "${fg[cyan]}") \
LESS_TERMCAP_ue=$(printf "$reset_color")


### General Keybindings ###
bindkey -e # -e emacs mode -v for vi mode
bindkey '^[^[[D' backward-word # alt + left
bindkey '^[^[[C' forward-word  # alt + rigth

### fzf configuration
export FZF_DEFAULT_OPTS='
  --color fg:-1,bg:-1,hl:5,fg+:3,bg+:-1,hl+:5
  --color info:42,prompt:-1,spinner:42,pointer:51,marker:33
'

### Plugin Config - history-substring-search ###
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=default,fg=magenta,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=default,fg=black,bold'
HISTORY_SUBSTRING_SEARCH_FUZZY_MATCHING='given_order'

bindkey '^[[A' history-substring-search-up     # bind arrow-up
bindkey '^[[B' history-substring-search-down   # bind arrow-down
