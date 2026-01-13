{
  pkgs,
  ...
}:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
    enableCompletion = true;

    shellAliases = {
      cat = "bat";
    };

    ohMyZsh = {
      enable = true;
      plugins = [
        "history-substring-search"
        "z"
      ];
      theme = "robbyrussell";
    };
  };
}
