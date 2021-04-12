{ config, pkgs, ... }:

let
  mypolybar = pkgs.polybar.override {
    alsaSupport = true;
    githubSupport = true;
    pulseSupport = true;
  };

  xmonad = ''
    [module/xmonad]
    type = custom/script
    exec = ${pkgs.xmonad-log}/bin/xmonad-log

    tail = true
  '';
in
{
  services.polybar = {
    enable = true;
    package = mypolybar;
    extraConfig = builtins.readFile ./config.ini;
    script = ''
      polybar top & disown
    '';
  };
}
