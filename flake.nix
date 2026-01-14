{
  description = "my nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      # home-manager should track the same nixpkgs as the system
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Zen isn't on nixpkgs yet
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    direnv-instant.url = "github:Mic92/direnv-instant";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      zen-browser,
      direnv-instant,
      ...
    }:
    let
      shared = [

        ./modules/alacritty
        ./modules/cli.nix
        ./modules/vesktop.nix
        ./modules/dev.nix
        ./modules/git.nix
        ./modules/obsidian
        ./modules/rust.nix
        ./modules/sway
        ./modules/direnv.nix
        ./modules/waybar
        ./modules/zed.nix
        ./modules/zsh.nix
        ./modules/neovim.nix
        ./modules/zen-browser.nix

        # Make home-manager use system pkgs
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
        }
      ];
    in
    {
      nixosConfigurations = {
        melchior = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit zen-browser direnv-instant;
          };
          modules = shared ++ [
            ./hosts/melchior/configuration.nix
            ./hosts/melchior/hardware-configuration.nix
          ];
        };
      };
    };
}
