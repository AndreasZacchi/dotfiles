{
  description = "AndreasZacchi's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # Unstable nixpkgs so newest packages are available
    home-manger = {
      url = "github:nix-community/home-manager/master"; # Use the latest home-manager
      inputs.nixpkgs.follows = "nixpkgs"; # Use the same nixpkgs as the flake to avoid conflicts
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      home = nixpkgs.lib.nixosSystem { # My home desktop
        system = "x86_64-linux";
        modules = [
          ./nixos/configuration.nix
          ./hosts/home/home-hardware.nix

          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.andreaszacchi = import ./home-manager/home-desktop.nix;
          }
        ];
      };
      laptop = nixpkgs.lib.nixosSystem { # My ASUS laptop
        system = "x86_64-linux";
        modules = [
          ./nixos/configuration.nix
          ./hosts/laptop/laptop-hardware.nix
          ./hosts/laptop/disable-nvidia-laptop.nix
          ./hosts/laptop/battery.nix
          ./hosts/laptop/suspend-kernel.nix

          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.andreaszacchi = import ./home-manager/home-laptop.nix;
          }
        ];
      };
    };
  };
}
