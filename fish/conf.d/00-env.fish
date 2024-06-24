#!/usr/bin/fish

if ! status --is-login
    exit 0
end

# XDG
set -gx XDG_DATA_HOME   	"$HOME/.local/share"
set -gx XDG_CONFIG_HOME 	"$HOME/.config"
set -gx XDG_STATE_HOME  	"$HOME/.local/state"
set -gx XDG_CACHE_HOME  	"$HOME/.cache"

set -gx XDG_DESKTOP_DIR     	"$HOME/Desktop"
set -gx XDG_DOCUMENTS_DIR   	"$HOME/Documents"
set -gx XDG_DOWNLOAD_DIR    	"$HOME/Downloads"
set -gx XDG_MUSIC_DIR       	"$HOME/Music"
set -gx XDG_PICTURES_DIR    	"$HOME/Pictures"
set -gx XDG_PUBLICSHARE_DIR 	"$HOME/Public"
set -gx XDG_TEMPLATES_DIR   	"$HOME/Templates"
set -gx XDG_VIDEOS_DIR      	"$HOME/Videos"

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
set -gx XDG_EXT_PROJECTS_HOME 	"$HOME/Projects"
set -gx XDG_EXT_TRASH_HOME	"$HOME/Trash"
set -gx XDG_EXT_SCREENSHOTS_DIR	"$XDG_PICTURES_DIR/Screenshots"

mkdir -p 				\
	"$XDG_EXT_PROJECTS_HOME"	\
	"$XDG_EXT_TRASH_HOME"		\
	"$XDG_EXT_SCREENSHOTS_DIR"

# COMMON TOOLS
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
set -gx PAGER  "moar"

# COMPILER & INTERPRETER OPTS
set -gx CARGO_HOME      "$XDG_DATA_HOME/cargo"
set -gx RUSTUP_HOME     "$XDG_DATA_HOME/rustup"
set -gx GOPATH          "$XDG_DATA_HOME/go"
set -gx PYTHONSTARTUP   "$XDG_CONFIG_HOME/python/rc.py"
set -gx DOTNET_CLI_HOME "$XDG_DATA_HOME/dotnet"
set -gx _JAVA_OPTIONS   "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"

# DEV TOOLS
set -gx MANROFFOPT "-c"
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx GRADLE_USER_HOME "$XDG_DATA_HOME/gradle"

# THEMING
set -gx GTK2_RC_FILES   "$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
set -gx XCURSOR_PATH    "/usr/share/icons:$XDG_DATA_HOME/icons"

# OTHER TOOLS
set -gx GRIM_DEFAULT_DIR "$XDG_EXT_SCREENSHOTS_DIR"
set -gx MOAR "-quit-if-one-screen"
set -gx BAT_THEME "Catppuccin Mocha"
set -gx BAT_PAGER "$PAGER"

set -gx FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

