{ pkgs, ... }:

{
  xsession = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ./config.hs;
      extraPackages = hp: [
        hp.dbus
        hp.monad-logger
      ];
    };
  };
}
