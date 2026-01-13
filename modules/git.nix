{
  ...
}:
{
  home-manager.users.yawd = {
    programs.git = {
      enable = true;
      settings = {
        user = {
          name = "Diego Reis";
          email = "reisdiego144@gmail.com";
        };
        init.defaultBranch = "main";
        core = {
          editor = "vim";
        };
      };
    };
  };
}
