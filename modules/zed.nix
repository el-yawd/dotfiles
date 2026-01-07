{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.custom.zed;
in
{
  options.custom.zed = {
    fontSize = lib.mkOption {
      type = lib.types.int;
      default = 15;
      description = "Font size for Zed editor (both UI and buffer)";
    };
  };

  config = {
    home-manager.users.yawd.home.packages = with pkgs; [
      zed-editor
    ];

    home-manager.users.yawd.home.file.".config/zed/settings.json".text = builtins.toJSON {
      ui_font_size = cfg.fontSize;
      buffer_font_size = cfg.fontSize;
      theme = {
        mode = "dark";
        light = "One Light";
        dark = "Catppuccin Mocha";
      };
      project_panel = {
        auto_fold_dirs = false;
      };
      terminal = {
        shell = {
          program = "nu";
        };
      };
      buffer_font_family = ".ZedMono";
      ui_font_family = ".ZedMono";
      vim_mode = true;
      autosave = "on_focus_change";
    };
  };
}
