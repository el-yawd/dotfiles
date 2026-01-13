{
  pkgs,
  ...
}:

{
  home-manager.users.yawd.home.packages = with pkgs; [
    gnuplot

    light
    pamixer
    tldr
    pulsemixer
    networkmanager
  ];
}
