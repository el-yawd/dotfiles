{
  pkgs,
  ...
}:

{
  # TODO: Make cargo config, and common rusty tools (flamegraph, wild, binstall) reproducible
  home-manager.users.yawd.home.packages = with pkgs; [
    rustup
  ];
}
