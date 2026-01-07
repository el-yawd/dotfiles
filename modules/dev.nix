{
  pkgs,
  ...
}:

{
  home-manager.users.yawd.home.packages = with pkgs; [
    btop
    clang
    claude-code
    curl
    fd
    jq
    just
    neovim
    nil
    nixd
    gnumake
    fastfetch
    perf
  ];
}
