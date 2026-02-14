{
  lazyvim-nix,
  ...
}:
{
  home-manager.users.yawd = {
    imports = [ lazyvim-nix.homeManagerModules.default ];

    programs.lazyvim = {
      enable = true;
      extras = {
        lang.nix.enable = true;
      };
    };
  };
}
