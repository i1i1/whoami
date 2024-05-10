{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";

    anemone-theme = {
      url = "github:Speyll/anemone";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, anemone-theme }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        theme = anemone-theme;
        themeName = ((builtins.fromTOML (builtins.readFile "${theme}/theme.toml")).name);
        date = "2024-05-09";
      in
      {
        packages = rec {
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
            buildPhase = "weasyprint ${website}/cv/index.html cv.pdf";
            installPhase = "mkdir $out; cp cv.pdf $out";
          };
          defaultPackage = website;
        };

        devShell = pkgs.mkShell {
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
      }
    );
}
