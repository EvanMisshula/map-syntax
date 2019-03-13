{ nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, containers, deepseq, hspec, HUnit, mtl
      , QuickCheck, stdenv, transformers
      }:
      mkDerivation {
        pname = "map-syntax";
        version = "0.3";
        src = ./.;
        libraryHaskellDepends = [ base containers mtl ];
        testHaskellDepends = [
          base containers deepseq hspec HUnit mtl QuickCheck transformers
        ];
        jailbreak = true;
        doCheck = false;
        description = "Syntax sugar for defining maps";
        license = stdenv.lib.licenses.bsd3;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage f {});

in

  if pkgs.lib.inNixShell then drv.env else drv
