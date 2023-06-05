{ pkgs, ... }:

{
  programs.xmobar = {
    enable = true;
    # A default config copied from the xmobar repo, here:
    # https://codeberg.org/xmobar/xmobar/src/commit/b5e397b1fdb9867b1d4ac599c88ef8b6354b5782/etc/xmobar.config
    extraConfig = ''
      Config
        { font = "DejaVu Sans Mono 9"
        , additionalFonts = ["DejaVu Sans Mono italic 9"]
        , borderColor = "black"
        , border = FullB
        , bgColor = "black"
        , fgColor = "whitesmoke"
        , alpha = 255
        , position = Top
        , textOffset = -1
        , iconOffset = -1
        , lowerOnStart = True
        , pickBroadest = False
        , persistent = False
        , hideOnStart = False
        , iconRoot = "."
        , allDesktops = True
        , overrideRedirect = True
        , textOutputFormat = Ansi
        , commands = [ Run Weather "KSEA" ["-t","<station>: <tempF>F",
                                           "-L","50","-H","80",
                                           "--normal","green",
                                           "--high","red",
                                           "--low","lightblue"] 36000
                     , Run Network "enp5s0" ["-L","0","-H","32",
                                           "--normal","green","--high","red"] 10
                     , Run Cpu ["-L","3","-H","50",
                                "--normal","green","--high","red"] 10
                     , Run Memory ["-t","Mem: <usedratio>%"] 10
                     , Run Swap [] 10
                     , Run Com "uname" ["-s","-r"] "" 36000
                     , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                     ]
        , sepChar = "%"
        , alignSep = "}{"
        , template = "%cpu% | <box>%memory% * %swap%</box> | %enp5s0% }\
                     \{ <fc=#ee9a00><fn=1>%date%</fn></fc>| %KSEA% | %uname%"
        }
    '';
  };
}
