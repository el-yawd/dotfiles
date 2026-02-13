{
  pkgs,
  ...
}:

{

  # TODO: Learn how to setup project specific dependencies
  home-manager.users.yawd.home.packages = with pkgs; [
    btop
    llvm
    clang
    tree
    claude-code
    curl
    emacs
    bat
    fd
    jq
    just
    nil
    nixd
    gnumake
    fastfetch
    perf
    direnv
    tmux
    uv
  ];
}
