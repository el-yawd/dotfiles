{
  pkgs,
  ...
}:

{
  home-manager.users.yawd.home.packages = with pkgs; [
    gnuplot

    bluetuith
    light
    pamixer
    tldr
    pulsemixer
    networkmanager
  ];
}
