set background=light
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "solarized-light"

let g:color_dict = {
      \ "none"          : ["NONE", "NONE"],
      \ "bg"            : [0,   "#ffffe2"],
      \ "off_bg"        : [235, "#feffe8"],
      \ "highlight"     : [236, "#d7d7af"],
      \ "dark_gray"     : [1,   "#8a8a8a"],
      \ "light_gray"    : [7,   "#8a8a8a"],
      \ "fg"            : [15,  "#808080"],
      \
      \ "light_red"     : [1,   "#af8700"],
      \ "light_green"   : [2,   "#5f8700"],
      \ "light_yellow"  : [3,   "#af0000"],
      \ "light_blue"    : [4,   "#5f5faf"],
      \ "light_magenta" : [5,   "#af005f"],
      \ "light_cyan"    : [6,   "#00afaf"],
      \
      \ "dark_red"      : [7,   "#d75f00"],
      \ "dark_green"    : [8,   "#4f7700"],
      \ "dark_yellow"   : [9,   "#9f7700"],
      \ "dark_blue"     : [10,  "#0087ff"],
      \ "dark_magenta"  : [11,  "#bf207f"],
      \ "dark_cyan"     : [12,  "#00afaf"],
      \ }

exe 'so ' . fnamemodify(expand('<sfile>'), ':p:h') . '/' . 'scheme.vim'
