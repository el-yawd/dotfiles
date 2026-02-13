{
  pkgs,
  ...
}:
{
  programs.zsh.enable = true;

  home-manager.users.yawd = {
    programs.zsh = {
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

      initExtra = ''
        # Hide default prompt before starship loads
        PROMPT=""
        eval "$(direnv-instant hook zsh 2>/dev/null)"
        eval "$(zoxide init zsh 2>/dev/null)"
      '';

      envExtra = ''
        export PATH="/home/yawd/.local/bin:$PATH"
      '';
    };

    programs.starship = {
      enable = true;
      settings = {
        add_newline = false;
        character = {
          success_symbol = "[λ](bold green)";
          error_symbol = "[λ](bold red)";
        };
        directory = {
          truncation_length = 3;
          truncate_to_repo = true;
        };
        git_status = {
          disabled = false;
        };
        nix_shell = {
          symbol = " ";
          format = "via [$symbol$state]($style) ";
        };
      };
    };

    home.packages = with pkgs; [
      zoxide # smarter cd (replaces z plugin)
    ];
  };
}
