set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "spacegray"

let g:color_dict = {
      \ "none"          : ["NONE", "NONE"],
      \ "bg"            : [234, "#111314"],
      \ "off_bg"        : [235, "#282C30"],
      \ "highlight"     : [236, "#212324"],
      \ "dark_gray"     : [246, "#707273"],
      \ "light_gray"    : [251, "#B3B8C4"],
      \ "fg"            : [231, "#E3E8E3"],
      \
      \ "light_red"     : [218, "#BF6262"],
      \ "light_green"   : [156, "#A2A565"],
      \ "light_yellow"  : [229, "#E9A96F"],
      \ "light_blue"    : [081, "#789BAD"],
      \ "light_magenta" : [231, "#9F7AA5"],
      \ "light_cyan"    : [087, "#638E8A"],
      \                                 
      \ "dark_red"      : [131, "#AF5252"],
      \ "dark_green"    : [042, "#929555"],
      \ "dark_yellow"   : [148, "#D9995F"],
      \ "dark_blue"     : [067, "#688B9D"],
      \ "dark_magenta"  : [096, "#8F6A95"],
      \ "dark_cyan"     : [036, "#537E7A"],
      \ }

exe 'so ' . fnamemodify(expand('<sfile>'), ':p:h') . '/' . 'scheme.vim'

let g:niji_spacegray_colours = g:niji_bolorscheme_colours
