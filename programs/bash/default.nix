{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      "ga" = "git add";
      "gb" = "git branch";
      "gc" = "git commit";
      "gch" = "git checkout";
      "gd" = "git diff";
      "gi" = "git init";
      "gl" = "git log";
      "gp" = "git push";
      "gpl" = "git pull";
      "gs" = "git status";
      "gsh" = "git show";
      "ssh" = "TERM=xterm-256color ssh";
    };
  };
}
