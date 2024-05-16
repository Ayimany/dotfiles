if ! status --is-login
    exit 0
end

# XDG
set -gx XDG_DATA_HOME   	"$HOME/.local/share"
set -gx XDG_CONFIG_HOME 	"$HOME/.config"
set -gx XDG_STATE_HOME  	"$HOME/.local/state"
set -gx XDG_CACHE_HOME  	"$HOME/.cache"

set -gx XDG_DESKTOP_DIR     	"$HOME/desktop"
set -gx XDG_DOCUMENTS_DIR   	"$HOME/documents"
set -gx XDG_DOWNLOAD_DIR    	"$HOME/downloads"
set -gx XDG_MUSIC_DIR       	"$HOME/music"
set -gx XDG_PICTURES_DIR    	"$HOME/pictures"
set -gx XDG_PUBLICSHARE_DIR 	"$HOME/public"
set -gx XDG_TEMPLATES_DIR   	"$HOME/templates"
set -gx XDG_VIDEOS_DIR      	"$HOME/videos"

mkdir -p 			\
	"$XDG_DATA_HOME" 	\
	"$XDG_CONFIG_HOME" 	\
	"$XDG_STATE_HOME" 	\
	"$XDG_CACHE_HOME" 	\
				\
	"$XDG_DESKTOP_DIR" 	\
	"$XDG_DOCUMENTS_DIR" 	\
	"$XDG_DOWNLOAD_DIR" 	\
	"$XDG_MUSIC_DIR" 	\
	"$XDG_PICTURES_DIR" 	\
	"$XDG_PUBLICSHARE_DIR" 	\
	"$XDG_TEMPLATES_DIR" 	\
	"$XDG_VIDEOS_DIR"

# XDGEXT
set -gx XDG_EXT_PROJECTS_HOME 	"$HOME/projects"
set -gx XDG_EXT_TRASH_HOME	"$XDG_PICTURES_DIR/trash"
set -gx XDG_EXT_SCREENSHOTS_DIR	"$XDG_PICTURES_DIR/screenshots"

mkdir -p 				\
	"$XDG_EXT_PROJECTS_HOME"	\
	"$XDG_EXT_TRASH_HOME"		\
	"$XDG_EXT_SCREENSHOTS_DIR"

# COMMON TOOLS
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx PAGER  "moar"

# COMPILER & INTERPRETER OPTS
set -gx CARGO_HOME  "$XDG_DATA_HOME/cargo"
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -gx GOPATH      "$XDG_DATA_HOME/go"
set -gx PYTHONSTARTUP "$XDG_CONFIG_HOME/python/rc.py"

# DEV TOOLS
set -gx MANROFFOPT "-c"
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# OTHER TOOLS
set -gx GRIM_DEFAULT_DIR "$XDG_EXT_SCREENSHOTS_DIR"
set -gx MOAR "-quit-if-one-screen"
set -gx BAT_THEME "catppuccin_mocha"
set -gx BAT_PAGER "$PAGER"

