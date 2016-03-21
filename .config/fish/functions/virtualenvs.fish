function virtualenvs --description 'Placeholder function: see https://github.com/fish-shell/fish-shell/issues/883'
    set CUR_DIR $PWD
    set magentau "\e[35;4m"
    set bbluet "\e[38;5;27m"
    set reset "\e[0m"

    echo -e "\nThe following virtual environments are available at $magentau$VIRTUALENV_HOME$reset."
    eval cd $VIRTUALENV_HOME; ls -G; cd $CUR_DIR;
    echo -e "\n\tTo create a virtual environment, use$bbluet newvenv$reset [name]."
    echo -e "\tTo activate a virtual environment, use$bbluet workon$reset [name]."
    echo -e "\tTo delete a virtual environment, use$bbluet delvenv$reset [name].\n"
end

function newvenv --description 'Create a new Python virtual environment'
    set greenb "\e[42;37m"
    set greent "\e[32m"
    set magentau "\e[35;4m"
    set bbluet "\e[38;5;27m"
    set reset "\e[0m"

    if [ (count $argv) -lt 1 ]
        echo -e "You need to specify a virtualenv name!"
        return 1
    end

    set -l -x pwdcopy $PWD

    set VIRTUALENV_NAME $argv[1]

    eval cd $VIRTUALENV_HOME; virtualenv $VIRTUALENV_NAME; cd $pwdcopy

    echo -e "\n\t$greent+ Added$reset virtual environment $magentau$VIRTUALENV_NAME$reset.\n"
end

function delvenv --description 'Delete a Python virtual environment'
    set redt "\e[91m"
    set purplet "\e[95m"
    set bbluet "\e[38;5;27m"
    set reset "\e[0m"

    if [ (count $argv) -lt 1 ]
        echo -e "You need to specify a virtualenv name!"
        return 1
    end

    set VIRTUALENV_NAME $argv[1]

    function _read_confirm_prompt
        echo -e "\n\tThis will permanently delete your virtual environment. Are you sure? (Y/n) "
    end

    read -l -p _read_confirm_prompt CONFIRM

    switch $CONFIRM
        case Y y
            eval rm -r "$VIRTUALENV_HOME/$VIRTUALENV_NAME"
            echo -e "\t$redt✘ Deleted$reset virtual environment $purplet$VIRTUALENV_NAME$purplet.\n"
        case '' N n
            echo -e "\tDelete canceled by user.\n"
    end
end

function workon --description 'Activate Python virtual environment'
    set greenb "\e[42;37m"
    set greent "\e[32m"
    set magentau "\e[35;4m"
    set bbluet "\e[38;5;27m"
    set reset "\e[0m"

    if [ (count $argv) -lt 1 ]
        echo -e "You need to specify a virtualenv!"
        eval cd $VIRTUALENV_HOME; ls -d -G */
        return 1
    end

    if not [ -d $VIRTUALENV_HOME/$argv[1] ]
        echo -e "\n\tThe virtualenv $magentau$argv[1]$reset does not exist!"
        echo -e "\tYou can create it with$bbluet newvenv$reset [name].\n"
        return 1
    end

    if set -q VIRTUAL_ENV
        eval deactivate
    end

    set -l -x pwdcopy $PWD

    set -g -x VIRTUAL_ENV $VIRTUALENV_HOME/$argv[1]

    eval cd $VIRTUALENV_HOME/$argv[1]; . bin/activate.fish; cd $pwdcopy

    echo -e "\n\t$greenb ⓔ  activated $reset$greent$reset $magentau$VIRTUAL_ENV$reset"
    echo -e "\tBe sure to$bbluet cd$reset to your project directory before running any commands!\n"
end

function stopworkon --description 'Deactivate current virtual environment'
    set redb "\e[101;37m"
    set redt "\e[91m"
    set magentau "\e[35;4m"
    set reset "\e[0m"

    if set -q VIRTUAL_ENV
        set VIRTUAL_ENV_COPY $VIRTUAL_ENV
        eval deactivate
        set -e VIRTUAL_ENV
        echo -e "\n\t$redt$reset$redb ⓔ  deactivated $reset $magentau$VIRTUAL_ENV_COPY$reset\n"
    else
        echo -e "\tNo active virtual environment."
        return 1
    end
end