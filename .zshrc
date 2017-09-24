# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Expire duplicate entries first when trimming history.
setopt HIST_EXPIRE_DUPS_FIRST    
# Delete old recorded entry if new entry is a duplicate.
setopt HIST_IGNORE_ALL_DUPS      

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# dircycle C-S-left for popd/pushd
# dirhistory cd opt-left for cd
# git-extras
# Command	Description
# git changelog [-l/--list]	populate changelog file with commits since the previous tag
# git contrib	display author contributions
# git count [--all]	count commits
# git delete-branch	delete local and remote branch
# git delete-submodule	delete submodule
# git delete-tag	delete local and remote tag
# git extras [-v/--version]	# git-extras
# git graft	merge commits from source branch to destination branch
# git squash	merge commits from source branch into the current one as a single commit
# git feature [finish]	create a feature branch
# git refactor [finish]	create a refactor branch
# git bug [finish]	create a bug branch
# git summary	repository summary
# git effort [--above]	display effort statistics
# git repl	read-eval-print-loop
# git commits-since	list commits since a given date
# git release	release commit with the given tag
# git alias	define, search and show aliases
# git ignore	add patterns to .# gitignore
# git info	show info about the repository
# git create-branch	create local and remote branch
# git fresh-branch	create empty local branch
# git undo	remove the latest commit
# git setup	setup a # git repository
# git touch	one step creation of new files
# git obliterate	Completely remove a file from the repository, including past commits and tags
# git local-commits	list unpushed commits on the local branch
#
# wd bookmarks dirs
plugins=(git zsh-syntax-highlighting percol)

source $ZSH/oh-my-zsh.sh

# alias
alias gedit="open -a gedit"
# alias preview="open -a preview"
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias vi="vim"
alias jc="javac"
alias j="java"
alias cd2="cd ../.."
alias cd3="cd ../../.."
alias cd4="cd ../../../.."
alias cd5="cd ../../../../.."

# alias for git
alias gs="git status"
alias gc="git commit"
alias gcm="git commit -m"
alias ga="git add"
alias gl="git log"

# alias for python
alias py="python"

# virualenvwrapper Workon_home
# export WORKON_HOME=~/Envs

# virtualenv
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/virtual_workspace
# source /usr/local/bin/virtualenvwrapper.sh

# octave
# alias octave="/usr/local/octave/3.8.0/bin/octave-3.8.0"

# Local Vim 
alias vim="/usr/local/bin/vim"
export PATH="/usr/local/opt/llvm/bin:$PATH"
