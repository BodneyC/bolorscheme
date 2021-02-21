set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "nordb"

let g:color_dict = {
      \ "none"          : ["NONE", "NONE"],
      \ "bg"            : [234, "#2E3440"],
      \ "off_bg"        : [235, "#343B4A"],
      \ "highlight"     : [236, "#3B4252"],
      \ "dark_gray"     : [246, "#6F788A"],
      \ "light_gray"    : [251, "#636D81"],
      \ "fg"            : [231, "#E5E9F0"],
      \
      \ "light_red"     : [218, "#88C0D0"],
      \ "light_green"   : [156, "#99B680"],
      \ "light_yellow"  : [229, "#B48EAD"],
      \ "light_blue"    : [081, "#ECEFF4"],
      \ "light_magenta" : [231, "#7698B9"],
      \ "light_cyan"    : [087, "#83B3B1"],
      \
      \ "dark_red"      : [131, "#88C0D0"],
      \ "dark_green"    : [042, "#A3BE8C"],
      \ "dark_yellow"   : [148, "#E6C582"],
      \ "dark_blue"     : [067, "#E5E9F0"],
      \ "dark_magenta"  : [096, "#81A1C1"],
      \ "dark_cyan"     : [036, "#83B3B1"],
      \ }

exe 'so ' . fnamemodify(expand('<sfile>'), ':p:h') . '/' . 'scheme.vim'

let g:niji_nordb_colours = g:niji_bolorscheme_colours
