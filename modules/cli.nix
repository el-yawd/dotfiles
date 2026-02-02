{
  pkgs,
  ...
}:

{
  home-manager.users.yawd.home.packages = with pkgs; [
    gnuplot
    geteduroam

    bluetuith
    light
    pamixer
    tldr
    pulsemixer
    networkmanager
  ];
}
