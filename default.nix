{ mkDerivation, base, containers, deepseq, hspec, HUnit, mtl
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
}
