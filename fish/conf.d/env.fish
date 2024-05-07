if ! status --is-login
    exit 0
end

set -gx XDG_DATA_HOME   "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_STATE_HOME  "$HOME/.local/state"
set -gx XDG_CACHE_HOME  "$HOME/.cache"

set -gx EDITOR "nvim"
set -gx VISUAL "nvim"

set -gx CARGO_HOME  "$XDG_DATA_HOME/cargo"
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -gx GOPATH      "$XDG_DATA_HOME/go"

