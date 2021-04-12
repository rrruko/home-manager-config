{ pkgs, ... }:

let
  bunnypic = ./bunny.jpg;
in
{
  xsession = {
    enable = true;
    initExtra = ''
      ${pkgs.feh}/bin/feh --bg-scale ${bunnypic}
    '';
  };
}
