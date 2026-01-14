{
  pkgs,
  ...
}:
{
  programs.zsh.enable = true;

  home-manager.users.yawd.programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;

    shellAliases = {
      cat = "bat";
      ndev = "nix develop -c $SHELL";
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "history-substring-search"
        "z"
      ];
      theme = "robbyrussell";
    };
  };
}
