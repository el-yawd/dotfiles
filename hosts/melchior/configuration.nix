{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  virtualisation.docker.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 2d";
  };

  programs.nix-ld.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
  ];

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 7;
  };

  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-14db99c0-5563-4886-8234-86daa4d40c45".device =
    "/dev/disk/by-uuid/14db99c0-5563-4886-8234-86daa4d40c45";
  networking.hostName = "melchior";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  console.keyMap = "br-abnt2";

  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.yawd = {
    isNormalUser = true;
    description = "yawd";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    zsh
    neovim
    wget
    git
  ];
  environment.variables.EDITOR = "nvim";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  system.stateVersion = "25.11";
  home-manager.users.yawd.home.stateVersion = "25.11";
}
