{ pkgs, direnv-instant, ... }:

{
  imports = [
    direnv-instant.nixosModules.direnv-instant
    ./hardware-configuration.nix
  ];
  programs.direnv-instant.enable = true;

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
      "video"
      "input"
    ];
  };

  # Backlight control without sudo
  programs.light.enable = true;
  hardware.brillo.enable = true;

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

  # TLP for battery optimization
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      START_CHARGE_THRESH_BAT0 = 40;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };
  services.power-profiles-daemon.enable = false; # Conflicts with TLP

  boot.kernel.sysctl = {
    "kernel.io_uring_group" = 100;
  };

  system.stateVersion = "25.11";
  home-manager.users.yawd.home.stateVersion = "25.11";
}
