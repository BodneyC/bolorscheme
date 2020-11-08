set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "unicorn"

let g:color_dict = {
      \ "none"          : ["NONE", "NONE"],
      \ "bg"            : [234, "#292429"],
      \ "off_bg"        : [235, "#2f2a2f"],
      \ "highlight"     : [236, "#3e3847"],
      \ "dark_gray"     : [246, "#675f78"],
      \ "light_gray"    : [251, "#bcb9bc"],
      \ "fg"            : [231, "#fff8fc"],
      \                                  
      \ "light_red"     : [218, "#fdbad5"],
      \ "light_green"   : [156, "#c1fffb"],
      \ "light_yellow"  : [229, "#E3FFD1"],
      \ "light_blue"    : [081, "#d0d5fe"],
      \ "light_magenta" : [231, "#dfc2e8"],
      \ "light_cyan"    : [087, "#d2f0ff"],
      \                                  
      \ "dark_red"      : [131, "#bc92a4"],
      \ "dark_green"    : [042, "#a9c8bd"],
      \ "dark_yellow"   : [148, "#bec7a7"],
      \ "dark_blue"     : [067, "#9089b0"],
      \ "dark_magenta"  : [096, "#ab8bb0"],
      \ "dark_cyan"     : [036, "#819790"],
      \ }

exe 'so ' . fnamemodify(expand('<sfile>'), ':p:h') . '/' . 'scheme.vim'

let g:niji_unicorn_colours = g:niji_bolorscheme_colours
