{
  description = "My workstation configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit self inputs; } {
      systems = [ "x86_64-linux" "x86_64-darwin" ];

      perSystem = { self', config, system, pkgs, lib, ... }: {
        formatter = pkgs.nixpkgs-fmt;

        devShells.default = pkgs.mkShell {
          name = "workstation";

          packages = with pkgs; [
            ansible
            ansible-language-server
            ansible-later
            ansible-lint
            yamlfix
          ];

          shellHook = ''
            export NIX_SHELL_NAME="workstation"
            zsh
            exit 0
          '';
        };
      };

  };
}
