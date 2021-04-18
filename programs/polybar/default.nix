{ config, pkgs, ... }:

let
  mypolybar = pkgs.polybar.override {
    alsaSupport = true;
    githubSupport = true;
    pulseSupport = true;
  };

  mprisScript = pkgs.callPackage ./scripts/mpris.nix {};
  mpris = ''
    [module/mpris]
    type = custom/script
    exec = ${mprisScript}/bin/mpris
    tail = true
    label-maxlen = 60
    interval = 2
    format =   <label>
  '';
in
{
  services.polybar = {
    enable = true;
    package = mypolybar;
    config = ./config.ini;
    extraConfig = mpris;
    script = ''
      polybar top & disown
    '';
  };
}
