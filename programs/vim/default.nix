{ pkgs, ... }:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [ sonokai ];
    extraConfig = ''
      " Need to call packadd! to silence startup error messages here, see:
      " https://github.com/sainnhe/sonokai/blob/
      " 81e19fc3db1af37ec5acf2d7cb11b97ae48c34b6/doc/sonokai.txt#L409a
      " > You'll need to add `packadd! sonokai` before applying this
      " > color scheme.
      " > Check [sainnhe/gruvbox-material#60]
      " > (https://github.com/sainnhe/gruvbox-material/issues/60)
      packadd! sonokai

      if has('termguicolors')
        set termguicolors
      endif
      let g:sonokai_style = 'andromeda'
      let g:sonokai_enable_italic = 1
      colorscheme sonokai

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
