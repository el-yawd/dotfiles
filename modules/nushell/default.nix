{
  pkgs,
  ...
}:

{
  home-manager.users.yawd.home.packages = with pkgs; [
    nushell
  ];

  home-manager.users.yawd.home.file.".config/nushell/config.nu".source = ./config.nu;
}
