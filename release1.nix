let
  pkgs = import <nixpkgs> { };

in
  {
   map-syntax = pkgs.haskellPackages.callPackage ./default.nix { };
  }
