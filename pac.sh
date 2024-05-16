# Update system
sudo pacman --noconfirm -Syu

# Git & SSH
sudo pacman --noconfirm --needed -S	\
    git					\
    openssh

# Install yay
which yay
LAST_STATUS="$?"

if [[ ! "$LAST_STATUS" -eq 0 ]]; then
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
fi

# Compilers & Interpreters
sudo pacman --noconfirm --needed -S python rustup clang go nodejs ghc julia lua npm

# Install default rust toolchain
if [[ ! -z "$(rustup show | grep 'no active')" ]]; then
    rustup default stable
fi

# Install cli utilities
sudo pacman --noconfirm --needed -S 	\
    pipewire				\
    neovim 				\
    fd					\
    the_silver_searcher			\
    ripgrep				\
    bat					\
    btop				\
    choose				\
    xh					\
    git-delta				\
    jq					\
    duf					\
    dust				\
    mtr					\
    procs				\
    sd					\
    lsd					\
    fzf					\
    hyperfine				\
    gping				\
    tesseract				\
    tesseract-data-eng			\
    yt-dlp				\
    mpv					\
    imagemagick				\
    ffmpeg				\
    libqalculate			\
    man-db				\
    tldr				\
    thefuck				\
    glow				\
    trash-cli				\
    zoxide				\
    renameutils				\
    udiskie 				\
    networkmanager

# Install AUR cli utilities
yay --noconfirm --needed -S	\
    await 			\
    doggo-bin			\
    nnn-nerd			\
    clipboard-bin		\
    moar

# fish
sudo pacman --noconfirm --needed -S fish

# Wayland shit
sudo pacman --noconfirm -S hyprland
yay --noconfirm -S 	\
    hyprshade-git	\
    hyprsome-git 	\
    hyprpicker-git	\
    hyprpaper-git	\
    hypridle-git 	\
    hypridle-git 	\
    hyprlock-git 	\
    hyprshot-git

# Needs graphical
sudo pacman --noconfirm --needed -S 	\
    kitty				\
    firefox				\
    firefox-developer-edition		\
    spotify-launcher			\
    chromium				\
    obsidian				\
    discord				\
    mako				\
    waybar				\
    copyq				\
    wl-clipboard			\
    grim				\
    slurp				\
    scrcpy				\

yay --noconfirm --needed -S	\
    localsend-bin		\
    tofi

sudo chsh ayimany -s /usr/bin/fish
bat cache --build

echo "Remember to: "
echo "- Generate an SSH key"
