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
      # Todo: Temporary
      python = "python3.14";
    };

    initContent = ''
      eval "$(direnv-instant hook zsh)"
    '';

    envExtra = ''
        export PATH="/home/yawd/.local/bin:$PATH"
      '';

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
