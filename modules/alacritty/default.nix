{
  pkgs,
  ...
}:

{
  home-manager.users.yawd.home.packages = with pkgs; [
    alacritty
  ];

  home-manager.users.yawd.home.file.".config/alacritty/alacritty.toml".source = ./config.toml;
}
