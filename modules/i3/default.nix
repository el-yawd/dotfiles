{
  pkgs,
  ...
}:

{
  services.xserver = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status
        betterlockscreen
        rofi
        dunst
        picom
        maim
        xclip
        xss-lock
        autotiling
        arandr         # GUI for monitor configuration
        autorandr      # Auto-detect and apply display profiles
        playerctl      # Media controls
        networkmanagerapplet  # nm-applet for tray
      ];
    };
  };

  # Display manager - lightdm with i3 as default
  services.displayManager = {
    defaultSession = "none+i3";
  };
  services.xserver.displayManager.lightdm = {
    enable = true;
    greeters.slick.enable = true;
  };

  # Swap Caps Lock to Escape (X11)
  services.xserver.xkb.options = "caps:escape";

  # Auto-detect and apply display profiles
  services.autorandr.enable = true;

  # Redshift for night light
  services.redshift = {
    enable = true;
    temperature = {
      day = 6500;
      night = 3500;
    };
  };
  location = {
    provider = "manual";
    latitude = -23.5;   # Approximate for Brazil
    longitude = -46.6;
  };

  home-manager.users.yawd.home.file.".config/i3/config".source = ./config;
  home-manager.users.yawd.home.file.".config/dunst/dunstrc".source = ./dunstrc;
  home-manager.users.yawd.home.file.".config/rofi/config.rasi".text = ''
    @theme "~/.config/rofi/theme.rasi"
  '';
  home-manager.users.yawd.home.file.".config/rofi/theme.rasi".source = ./rofi.rasi;
}
