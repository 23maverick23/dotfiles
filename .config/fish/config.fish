# THIS SHOULD GO IN THE config.fish FILE
powerline-daemon -q
# finds the path of the installed package using pip and grep
set -g -x powerline_path (pip show powerline-status | grep -o 'Location: .*' | sed -e s/'Location: '//)
set fish_function_path $fish_function_path "$powerline_path/powerline/bindings/fish"
powerline-setup


set default_user "rymo"
set default_machine "Bessie"


# source ~/.config/fish/path.fish  # need to fix bug with split string
source ~/.config/fish/aliases.fish
# source ~/.config/fish/chpwd.fish  # need to fix bug with ls

# Set default locale
set -g -x LC_CTYPE en_US.UTF-8
set -g -x LC_ALL en_US.UTF-8
set -g -x LANG en_US.UTF-8

# load iterm2 shell integration
# test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# Completions
function make_completion --argument-names alias command
    echo "
    function __alias_completion_$alias
        set -l cmd (commandline -o)
        set -e cmd[1]
        complete -C\"$command \$cmd\"
    end
    " | .
    complete -c $alias -a "(__alias_completion_$alias)"
end

make_completion g 'git'

set -g SUBLIME 'subl'
set -g EDITOR '$SUBLIME --wait'
set -g MYSHELL 'fish'
set -g VISUAL '$EDITOR'
set -g BROWSER open

# Set global variables for key paths
set -g -x VIRTUALENV_HOME $HOME/.virtualenvs
set -g -x PROJECT_HOME $HOME/Projects
# Disable standard virtualenv prompt when using powerline
set -g -x VIRTUAL_ENV_DISABLE_PROMPT "true"


# Readline colors
set -g fish_color_autosuggestion 555 yellow
set -g fish_color_command 5f87d7
set -g fish_color_comment 808080
set -g fish_color_cwd 87af5f
set -g fish_color_cwd_root 5f0000
set -g fish_color_error 870000 --bold
set -g fish_color_escape af5f5f
set -g fish_color_history_current 87afd7
set -g fish_color_host 5f87af
set -g fish_color_match d7d7d7 --background=303030
set -g fish_color_normal normal
set -g fish_color_operator d7d7d7
set -g fish_color_param 5f87af
set -g fish_color_quote d7af5f
set -g fish_color_redirection normal
set -g fish_color_search_match --background=purple
set -g fish_color_status 5f0000
set -g fish_color_user 5f875f
set -g fish_color_valid_path --underline

set -g fish_color_dimmed 555
set -g fish_color_separator 999

# Git prompt status
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showupstream auto


# Status Chars
#set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_dirtystate 'red'

set __fish_git_prompt_color_upstream_ahead ffb90f
set __fish_git_prompt_color_upstream_behind blue

# Local prompt customization
set -e fish_greeting


set -g fish_pager_color_completion normal
set -g fish_pager_color_description 555 yellow
set -g fish_pager_color_prefix cyan
set -g fish_pager_color_progress cyan


# highlighting inside manpages and elsewhere
set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

