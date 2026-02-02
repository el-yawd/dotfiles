{
  pkgs,
  nur,
  ...
}:

{
  nixpkgs.overlays = [ nur.overlays.default ];

  home-manager.users.yawd.home.packages = with pkgs.nur.repos; [
    # unikraft.kraftkit
  ];
}
