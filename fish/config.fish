if status is-interactive
set fish_greeting
    # Commands to run in interactive sessions can go here
nvm use default > /dev/null
alias vi "nvim"
alias vim "nvim"
set -x GPG_TTY (tty)
end
