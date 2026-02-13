{
  pkgs,
  ...
}:

{
  home-manager.users.yawd.home.packages = with pkgs; [
    gnuplot
    geteduroam
    geteduroam-cli
    lazydocker

    openssl
    usbutils
    pcmanfm
    bluetuith
    brightnessctl
    pamixer
    tldr
    pulsemixer
    networkmanager
  ];
}
