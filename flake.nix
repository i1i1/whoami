{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";

    terminimal-theme = {
      url = "github:pawroman/zola-theme-terminimal";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, terminimal-theme }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        theme = terminimal-theme;
        themeName = ((builtins.fromTOML (builtins.readFile "${theme}/theme.toml")).name);
      in
      {
        packages = rec {
          website = pkgs.stdenv.mkDerivation rec {
            pname = "static-website";
            version = "2024-05-09";
            src = ./.;
            nativeBuildInputs = with pkgs; [ zola ];
            configurePhase = ''
              mkdir -p "themes/${themeName}"
              cp -r ${theme}/* "themes/${themeName}"
            '';
            buildPhase = "zola build";
            installPhase = "cp -r public $out";
          };
          defaultPackage = website;
        };

        devShell = pkgs.mkShell {
          packages = with pkgs; [
            zola
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
