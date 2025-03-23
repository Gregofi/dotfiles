{ config, pkgs, ... }:
{
  home.username = "gregofi";
  home.homeDirectory = "/home/gregofi";

  home.packages = with pkgs; [
    # browsers
    google-chrome

    # archives
    zip
    xz
    unzip

    # utils
    ripgrep
    jq
    eza

    # networking
    dnsutils # dig, nslookup
    mtr
    nmap
    socat

    btop
    iotop
    iftop

    strace
    ltrace
    lsof

    # graphical env
    i3status-rust

    # fonts
    nerdfonts
  ];

  home.file = {
    ".config/i3/config".source = ./i3/config;
    # consider doing this guy via home manager
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.i3status-rust.enable
    ".config/i3status-rust/config.toml".source = ./i3status-rs/config.toml;
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
    ".config/alacritty" = {
      source = ./alacritty;
      recursive = true;
    };
  };

  xsession = {
    enable = true;
    initExtra = "xset r rate 250 50";
  };


  programs.git = {
    enable = true;
    userName = "Filip Gregor";
    userEmail = "filip.gregor98@gmail.com";
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    # history = {
    #   findNoDups = true;
    # };
    historySubstringSearch = {
      enable = true;
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
