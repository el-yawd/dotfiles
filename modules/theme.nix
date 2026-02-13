{
  pkgs,
  ...
}:

{
  # Qt theming
  qt = {
    enable = true;
    platformTheme = "gtk2";
    style = "gtk2";
  };

  # Required for GTK theming
  programs.dconf.enable = true;

  home-manager.users.yawd = {
    # GTK theming
    gtk = {
      enable = true;
      theme = {
        name = "Arc-Dark";
        package = pkgs.arc-theme;
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
      cursorTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        size = 24;
      };
      font = {
        name = "JetBrainsMono Nerd Font";
        size = 10;
      };
      gtk3.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
      gtk4.extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };

    home.pointerCursor = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      size = 24;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
