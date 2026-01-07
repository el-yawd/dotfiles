{
  pkgs,
  ...
}:

{
  home-manager.users.yawd.home.packages = with pkgs; [
    vesktop
  ];
}
