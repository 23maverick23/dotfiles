

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

# Utilities
function c        ; pygmentize -O style=monokai -f console256 -g $argv ; end
function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end



# mv, rm, cp
alias mv 'command gmv --interactive --verbose'
alias rm 'command grm --interactive --verbose'
alias cp 'command gcp --interactive --verbose'


alias cask='brew cask' # i <3 u cask
alias where=which # sometimes i forget
alias brwe=brew  #typos

alias hosts='sudo $EDITOR /etc/hosts'   # yes I occasionally 127.0.0.1 twitter.com ;)
alias raspi='ssh pi@10.0.1.99'

alias projects "cd ~/Projects"
alias venvs "cd ~/.virtualenvs"
alias sites 'cd ~/Sites'
alias chrome "open -a \"Google Chrome\""
alias h "history"

alias editbash 'subl --wait ~/.bash_profile'
alias editvim 'subl --wait ~/.vimrc'
alias editfish 'subl --wait ~/.config/fish/config.fish'
alias editaliases 'subl --wait ~/.config/fish/aliases.fish'

# `shellswitch [bash|zsh|fish]`
function shellswitch
	chsh -s (brew --prefix)/bin/$argv
end



# `cat` with beautiful colors. requires Pygments installed.
# 							   sudo easy_install -U Pygments
alias c='pygmentize -O style=monokai -f console256 -g'



# Networking. IP address, dig, DNS
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip "ipconfig getifaddr en0"
alias dig="dig +nocmd any +multiline +noall +answer"

# Recursively delete `.DS_Store` files
alias cleanup_dsstore="find . -name '*.DS_Store' -type f -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash "sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Show/hide hidden files in Finder
alias show "defaults write com.apple.finder AppleShowAllFiles -bool true; and killall Finder"
alias hide "defaults write com.apple.finder AppleShowAllFiles -bool false; and killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop "defaults write com.apple.finder CreateDesktop -bool false; and killall Finder"
alias showdesktop "defaults write com.apple.finder CreateDesktop -bool true; and killall Finder"

# URL-encode strings
alias urlencode 'python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'


# Shortcuts
alias g="git"
alias v="vim"
alias ungz="gunzip -k"

# File size
alias fs="stat -f \"%z bytes\""

# Empty the Trash on all mounted volumes and the main HDD. then clear the useless sleepimage
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash; sudo rm /private/var/vm/sleepimage"

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias update 'sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'
alias brew_update="brew -v update; brew -v upgrade --all; brew cleanup; brew cask cleanup; brew prune; brew doctor"
alias update_brew_npm_gem='brew_update; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update --no-rdoc --no-ri'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1;
    set colorflag "--color"
else # OS X `ls`
    set colorflag "-G"
end

# List all files colorized in long format
alias l "ls -lF $colorflag"

# List all files colorized in long format, including dot files
alias la "ls -laF $colorflag"

# List only directories
alias lsd "ls -lF $colorflag | grep --color=never '^d'"

# Always use color output for `ls`
alias ls "command ls $colorflag"
set LS_COLORS -g 'no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'


# Enable aliases to be sudo’ed
alias sudo 'sudo '

# Get week number
alias week 'date +%V'

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill "ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Reload the shell (i.e. invoke as a login shell)
alias reload "exec fish"
