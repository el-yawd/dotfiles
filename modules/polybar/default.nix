{
  pkgs,
  ...
}:

{
  home-manager.users.yawd = {
    services.polybar = {
      enable = true;
      package = pkgs.polybar.override {
        i3Support = true;
        pulseSupport = true;
      };
      script = ""; # We use our own launch script via i3
    };

    home.file.".config/polybar/config.ini".source = ./config.ini;
    home.file.".config/polybar/launch.sh" = {
      source = ./launch.sh;
      executable = true;
    };
  };
}
