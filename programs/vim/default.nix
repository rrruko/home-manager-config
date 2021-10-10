{ pkgs, ... }:
{
  programs.vim = {
    enable = true;
    extraConfig = ''
      set number
      set linebreak
      set textwidth=80
      set showmatch
       
      set hlsearch
      set incsearch
       
      set autoindent
      set expandtab
      set shiftwidth=2
      set smartindent
      set smarttab
      set softtabstop=2
       
      set ruler
       
      set undolevels=1000
      set backspace=indent,eol,start
    '';
  };
}
