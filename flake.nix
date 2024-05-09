{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = rec {
          website = pkgs.stdenv.mkDerivation rec {
            pname = "static-website";
            version = "2024-05-09";
            src = ./.;
            nativeBuildInputs = with pkgs; [ zola ];
            buildPhase = "zola build";
            installPhase = "cp -r public $out";
          };
          defaultPackage = website;
        };

        devShell = pkgs.mkShell {
          packages = with pkgs; [
            zola
          ];
        };
      }
    );
}
