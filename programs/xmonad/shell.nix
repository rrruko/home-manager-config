{ pkgs ? import <nixpkgs> {} }:
let
  myghc = pkgs.haskellPackages.ghcWithPackages (p:
    [ p.xmonad p.xmonad-contrib p.containers ]);
in
  pkgs.mkShell {
    nativeBuildInputs = [ pkgs.ghcid myghc ];
  }
