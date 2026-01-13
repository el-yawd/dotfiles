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

    interactiveShellInit = ''
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
    '';

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
