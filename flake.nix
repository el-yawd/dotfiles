{
  description = "my nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      # home-manager should track the same nixpkgs as the system
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Zen isn't on nixpkgs yet
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    direnv-instant.url = "github:Mic92/direnv-instant";
    lazyvim-nix = {
      url = "github:pfassina/lazyvim-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      zen-browser,
      nur,
      direnv-instant,

      lazyvim-nix,
      ...
    }:
    let
      shared = [

        ./modules/alacritty
        ./modules/cli.nix
        ./modules/vesktop.nix
        ./modules/dev.nix
        ./modules/i3
        ./modules/steam.nix
        ./modules/git.nix
        ./modules/obsidian
        ./modules/rust.nix
        ./modules/direnv.nix
        ./modules/polybar
        ./modules/theme.nix
        ./modules/zed.nix
        ./modules/zsh.nix
        ./modules/neovim.nix
        ./modules/zen-browser.nix
        ./modules/nur.nix

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
            inherit
              zen-browser
              direnv-instant
              nur
              lazyvim-nix
              ;
          };
          modules = shared ++ [
            ./hosts/melchior/configuration.nix
            ./hosts/melchior/hardware-configuration.nix
          ];
        };
      };
    };
}
