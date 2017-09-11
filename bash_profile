 
#Change editing mode
#set -o vi
#set -o emacs


############################################################
#                       TIPS
#
#   1. Use command to override an alias e.g "$command ls" this will execute bash command instead alias of same name


if [ -f "/Users/`whoami`/configfiles/aliases_std" ]; then
    source "/Users/`whoami`/configfiles/aliases_std"
fi

#Increase bash history default history size is 500 commands.
HISTFILESIZE=10000000
 
  
define () {
         curl dict://dict.org/d:"${1}"
}

def (){
    curl -s -A 'Mozilla/4.0'  'http://www.google.com/search?q=define%3A+'${1} | html2text -ascii -nobs -style compact -width 500 | grep "*"
}

# Colors for man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'


# make bash tab completion case insensitive. 
set completion-ignore-case on
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"


# smiley for command status :)

#export LESS_TERMCAP_mb=$'\E[01;31m'
#RESET="\[\017\]"
#NORMAL="\[\033[0m\]"
#RED="\[\033[31;1m\]"
#YELLOW="\[\033[33;1m\]"
#WHITE="\[\033[37;1m\]"
#SMILEY="${WHITE}:)${NORMAL}"
#FROWNY="${RED}:(${NORMAL}"
#SELECT="if [ \$? = 0 ]; then echo \"${SMILEY}\"; else echo \"${FROWNY}\"; fi"

# Throw it all together 
#PS1="${RESET}${YELLOW}\h${NORMAL} \`${SELECT}\` ${YELLOW}>${NORMAL} "
 
 
 

#   extract any type of archieve 
#   extract [archive file]
 
extract() { 
    if [ -f $1 ] ; then 
        case $1 in 
            *.tar.bz2)   tar xjf $1     ;; 
            *.tar.gz)    tar xzf $1     ;; 
            *.bz2)       bunzip2 $1     ;; 
            *.rar)       unrar e $1     ;; 
            *.gz)        gunzip $1      ;; 
            *.tar)       tar xf $1      ;; 
            *.tbz2)      tar xjf $1     ;; 
            *.tgz)       tar xzf $1     ;; 
            *.zip)       unzip $1       ;; 
            *.Z)         uncompress $1  ;; 
            *.7z)        7z x $1        ;; 
            *)     echo "'$1' cannot be extracted via extract()" ;; 
        esac 
    else 
        echo "'$1' is not a valid file" 
    fi 
}



# extend bash regular expression capabalities by default.
shopt -s extglob

#  set all the enviroment variables. 
export BASH_PROFILE=/Users/tahseen/.bash_profile
export VIMRC=/Users/tahseen/.vimrc
export php_executable_path=/usr/bin/php-cgi


# enable git bash-completion from file
source "/Users/`whoami`/configfiles/git-completion.bash"
source "/Users/`whoami`/configfiles/git-prompt.sh"
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\w$(__git_ps1 " (%s)")\$ '

# The next line updates  
# PATH for the Google Cloud SDK.
if [ -f /Users/tahseen/Downloads/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/tahseen/Downloads/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/tahseen/Downloads/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/tahseen/Downloads/google-cloud-sdk/completion.bash.inc'
fi

