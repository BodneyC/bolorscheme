set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let $TERMTHEME = "light"
let g:colors_name = "plint-light"

let g:color_dict = {
      \ "none"          : ["NONE", "NONE"],
      \ "off_bg"        : ["NONE", "#f5ffff"],
      \ "highlight"     : ["NONE", "#99bbbb"],
      \ "bg"            : [0,      "#efffff"],
      \ "fg"            : [7,      "#000000"],
      \
      \ "light_red"     : [1,      "#881111"],
      \ "light_green"   : [2,      "#118811"],
      \ "light_yellow"  : [3,      "#888811"],
      \ "light_blue"    : [4,      "#111188"],
      \ "light_magenta" : [8,      "#881188"],
      \ "light_cyan"    : [6,      "#118888"],
      \ "light_gray"    : [7,      "#888888"],
      \
      \ "dark_red"      : [6,      "#661111"],
      \ "dark_green"    : [10,     "#116611"],
      \ "dark_yellow"   : [11,     "#666611"],
      \ "dark_blue"     : [11,     "#111166"],
      \ "dark_magenta"  : [16,     "#661166"],
      \ "dark_cyan"     : [14,     "#116666"],
      \ "dark_gray"     : [16,     "#7f7f7f"],
      \ }

exe 'so ' . fnamemodify(expand('<sfile>'), ':p:h') . '/' . 'scheme.vim'
