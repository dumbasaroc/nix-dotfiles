{
  inputs = {
    # This is pointing to an unstable release.
    # If you prefer a stable release instead, you can this to the latest number shown here: https://nixos.org/download
    # i.e. nixos-24.11
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    ## HOME MANAGER AND PLUGINS
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    
    ## PROGRAMS
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "https://flakehub.com/f/Svenum/Solaar-Flake/*.tar.gz"; # For latest stable version
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ## CUSTOM MADE DERIVATIONS
    roc-ags-shell = {
      url = "path:derivs/roc-shell-ags";
    };
  };
  outputs = { self, nixpkgs, home-manager, plasma-manager, nixvim, solaar, ... }@inputs:
  {
    nixpkgs.config.allowUnfree = true;

    # NOTE: 'nixos' is the default hostname
    nixosConfigurations.roc-nixos = nixpkgs.lib.nixosSystem {
      modules = [
        nixvim.nixosModules.nixvim
        solaar.nixosModules.default
        
        {
          networking.hostName = "roc-nixos"; # Define your hostname.
        }
        ./configuration.nix
        ./laptop-hardware-configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
        }
        ./home/roc.nix
        # ./home/tester.nix
        {
          _module.args = { inherit inputs; };
        }
      ];
    };

    nixosConfigurations.roc-desktop-nixos = nixpkgs.lib.nixosSystem {
      modules = [
        nixvim.nixosModules.nixvim
        solaar.nixosModules.default

        {
          networking.hostName = "roc-desktop-nixos"; # Define your hostname.
        }
        ./configuration.nix
        ./desktop-configuration.nix
        ./desktop-hardware-configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.sharedModules = [ plasma-manager.homeModules.plasma-manager ];
        }
        ./home/roc.nix
        # ./home/tester.nix
        {
          _module.args = { inherit inputs; };
        }
      ];
    };

  };
}

