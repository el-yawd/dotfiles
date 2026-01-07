{
  description = "my nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      # home-manager should track the same nixpkgs as the system
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }:
    let
      shared = [
        ./modules/alacritty
        ./modules/brave
        ./modules/cli.nix
        ./modules/dev.nix
        ./modules/git.nix
        ./modules/nushell
        ./modules/rust.nix
        ./modules/sway
        ./modules/waybar
        ./modules/zed.nix

        # Make home-manager use system pkgs
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
      ];
    in
    {
      nixosConfigurations = {
        melchior = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = shared ++ [
            ./hosts/melchior/configuration.nix
            ./hosts/melchior/hardware-configuration.nix
          ];
        };
      };
    };
}
