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

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ flake-parts, ... }:
    let
      theme = inputs.anemone-theme;
      themeName = (builtins.fromTOML (builtins.readFile "${theme}/theme.toml")).name;
      date = "2024-05-09";
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      imports = [
        inputs.treefmt-nix.flakeModule
      ];

      perSystem = { self', pkgs, ... }: {
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
            nodePackages.cspell
            python3Packages.weasyprint
          ];
          shellHook = ''
            # TODO: `cd` into git root
            mkdir -p themes
            ln -sn "${theme}" "themes/${themeName}"
          '';
        };

        checks.cspell = pkgs.stdenv.mkDerivation {
          name = "cspell-check";
          src = ./.;
          nativeBuildInputs = [ pkgs.nodePackages.cspell ];
          installPhase = ''
            cspell **.md
            touch $out
          '';
        };

        treefmt.config = {
          projectRootFile = "flake.nix";
          flakeFormatter = true;
          flakeCheck = true;
          programs = {
            deadnix.enable = true;
            nixpkgs-fmt.enable = true;
            statix.enable = true;

            mdformat.enable = true;

            # TODO: enable once https://github.com/numtide/treefmt-nix/pull/146 merged
            # actionlint.enable = true;
          };
        };
      };
    };
}
