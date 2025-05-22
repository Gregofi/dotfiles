{ config, pkgs, ... }:
{
  home.username = "gregofi";
  home.homeDirectory = "/home/gregofi";

  home.packages = with pkgs; [
    # browsers
    google-chrome
    firefox

    # archives
    zip
    xz
    unzip

    # utils
    ripgrep
    jq
    eza
    tldr
    tig

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
    xfce.thunar
    redshift

    # fonts
    nerdfonts

    docker-compose

    # toolchains
    rustup
    nodejs_23
    lua
    pnpm
    bun

    zlib
    qpdf # zlib-flate

    gimp

    vscode-fhs
    obsidian
  ];

  home.file = {
    ".config/i3/config".source = ./i3/config;
    # consider doing this guy via home manager
    # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.i3status-rust.enable
    ".config/i3status-rust/config.toml".source = ./i3status-rs/config.toml;
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-config/nvim";
    ".config/alacritty" = {
      source = ./alacritty;
      recursive = true;
    };
  };

  xsession = {
    enable = true;
    initExtra = "xset r rate 200 50";
  };


  programs.git = {
    enable = true;
    userName = "Filip Gregor";
    userEmail = "filip.gregor98@gmail.com";
  };

  programs.zsh = {
    enable = true;
    autocd = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      ".." = "cd ..";
      "update" = "nixos-rebuild switch --flake .";
      # this bit of magic allows aliases to be used with sudo
      sudo="sudo ";
      d = "docker";
      p = "pnpm";
      n = "nvim";

      # we could specify aliases in programs.git, but
      # then they would require git prefix, like `git co`.
      gco = "git checkout";
      "gcn!" = "git commit --amend --no-edit";
      gpsup = "git push";
      gpsupf = "git push --force-with-lease";
      gav = "git add -v";
      grhh = "git reset --hard";
    };
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "sudo"
        "kubectl"
        "rust"
        "docker"
        "docker-compose"
      ];
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      ripgrep
      luajit

      # langservers
      lua-language-server
      nil
      nixd
      biome
      typescript-language-server
      rust-analyzer
      llvmPackages_19.clang-tools
      svelte-language-server
    ];
  };

  home.sessionVariables.NIX_NEOVIM = 1;

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
