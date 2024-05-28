if ! status --is-interactive
    exit 0
end

alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias rm="trash --trash-dir $XDG_EXT_TRASH_HOME"
alias cd="z"
alias cdi="zi"
alias cat="bat"

