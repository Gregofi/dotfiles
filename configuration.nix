{ config, pkgs, inputs, lib, ... }:

let
  user = "gregofi";
in
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Prague";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "cs_CZ.UTF-8";
    LC_IDENTIFICATION = "cs_CZ.UTF-8";
    LC_MEASUREMENT = "cs_CZ.UTF-8";
    LC_MONETARY = "cs_CZ.UTF-8";
    LC_NAME = "cs_CZ.UTF-8";
    LC_NUMERIC = "cs_CZ.UTF-8";
    LC_PAPER = "cs_CZ.UTF-8";
    LC_TELEPHONE = "cs_CZ.UTF-8";
    LC_TIME = "cs_CZ.UTF-8";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  services.xserver = {
    enable = true;

    displayManager = {
      defaultSession = "none+i3";
      lightdm = {
        enable = true;
      };

      autoLogin = {
        enable = true;
	user = user;
      };
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi
	i3status
      ];
    };
  };

  programs.zsh.enable = true;

  users.users.gregofi = {
    isNormalUser = true;
    description = "gregofi";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    # editors
    vim
    neovim

    zsh

    # network
    curl
    wget

    git
    alacritty

    # for clipboard nvim to work
    xclip

    # toolchains
    gnumake
    gcc14
    clang_multi
  ];
  environment.variables.EDITOR = "nvim";

  system.stateVersion = "24.11";

}
