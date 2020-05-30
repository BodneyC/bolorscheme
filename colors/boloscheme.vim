set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "bolorscheme"

" This is the color_dict variable you will need to define

" let g:color_dict = {
"       \ "none"          : ["NONE", ""],
"       \ "bg"            : [256, "#RRGGBB"],
"       \ "off_bg"        : [256, "#RRGGBB"],
"       \ "highlight"     : [256, "#RRGGBB"],
"       \ "dark_gray"     : [256, "#RRGGBB"],
"       \ "light_gray"    : [256, "#RRGGBB"],
"       \ "fg"            : [256, "#RRGGBB"],
"       \ "light_red"     : [256, "#RRGGBB"],
"       \ "light_green"   : [256, "#RRGGBB"],
"       \ "light_yellow"  : [256, "#RRGGBB"],
"       \ "light_blue"    : [256, "#RRGGBB"],
"       \ "light_magenta" : [256, "#RRGGBB"],
"       \ "light_cyan"    : [256, "#RRGGBB"],
"       \ "dark_red"      : [256, "#RRGGBB"],
"       \ "dark_green"    : [256, "#RRGGBB"],
"       \ "dark_yellow"   : [256, "#RRGGBB"],
"       \ "dark_blue"     : [256, "#RRGGBB"],
"       \ "dark_magenta"  : [256, "#RRGGBB"],
"       \ "dark_cyan"     : [256, "#RRGGBB"]
"       \ }

exe 'so ' . fnamemodify(expand('<sfile>'), ':p:h') . '/' . 'scheme.vim'
