{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    anemone-theme = {
      url = "github:Speyll/anemone";
      flake = false;
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    let
      theme = inputs.anemone-theme;
      themeName = ((builtins.fromTOML (builtins.readFile "${theme}/theme.toml")).name);
      date = "2024-05-09";
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = ({ self', pkgs, ... }: {
        packages = {
          website = pkgs.stdenv.mkDerivation rec {
            pname = "static-website";
            version = date;
            src = ./.;
            nativeBuildInputs = with pkgs; [ zola ];
            configurePhase = ''
              set -ex
              mkdir -p themes/
              ln -sn "${theme}" "themes/${themeName}"
            '';
            buildPhase = "zola build";
            installPhase = "cp -r public $out";
          };
          cv = pkgs.stdenv.mkDerivation rec {
            pname = "cv-pdf";
            version = date;
            src = ./.;
            nativeBuildInputs = with pkgs; [ python3Packages.weasyprint ];
            dontUnpack = true;
            buildPhase = "weasyprint ${self'.packages.website}/index.html cv.pdf";
            installPhase = "mkdir $out; cp cv.pdf $out";
          };
          defaultPackage = self'.packages.website;
        };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            zola
            python3Packages.weasyprint
          ];
          shellHook = ''
            # TODO: `cd` into git root
            mkdir -p themes
            ln -sn "${theme}" "themes/${themeName}"
          '';
        };
      });
    };
}
