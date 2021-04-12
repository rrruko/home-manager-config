{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.fira-code;
      name = "Fira Code Regular";
    };
    settings = {
      background_opacity = "0.9";
    };
  };
}
