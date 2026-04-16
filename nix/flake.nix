{
  description = "chowder devkit";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.chowder-vm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        ./modules/base.nix
        ./modules/vm.nix
        ./modules/users.nix
      ];
    };

    apps.x86_64-linux.vm = {
      type = "app";
      program = toString (nixpkgs.legacyPackages.x86_64-linux.writeShellScript "run-vm" ''
        export NIX_DISK_IMAGE=''${NIX_DISK_IMAGE:-$HOME/.local/share/chowder/chowder.qcow2}
        mkdir -p "$(dirname "$NIX_DISK_IMAGE")"
        exec ${self.nixosConfigurations.chowder-vm.config.system.build.vm}/bin/run-chowder-vm
      '');
    };
  };
}
