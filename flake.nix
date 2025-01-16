{
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.5.0";
  };

  outputs = { self, nixpkgs, nix-flatpak }: {

    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        ./configuration.nix
      ];
    };
  };
}

