{
  pkgs,
  ...
}:
{
  home-manager.users.yawd.programs.brave = {
    enable = true;
    extensions = [
      # BitWarden
      { id = "nngceckbapebfimnlniiiahkandclblb"; }
      # DarkReader
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; }
    ];
  };

  environment.etc."/brave/policies/managed/GroupPolicy.json".source = ./policies.json;
}
