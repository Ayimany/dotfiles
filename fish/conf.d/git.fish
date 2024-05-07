if ! status --is-interactive
    exit 0
end

set -x __fish_git_prompt_showdirtystate true
set -x __fish_git_prompt_showcolorhints true

