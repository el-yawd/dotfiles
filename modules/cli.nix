{
  pkgs,
  ...
}:

{
  home-manager.users.yawd.home.packages = with pkgs; [
    gnuplot

    pamixer
    pulsemixer
    networkmanager
  ];
}
