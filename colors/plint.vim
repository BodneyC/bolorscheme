set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let $TERMTHEME = "dark"
let g:colors_name = "plint"

let g:color_dict = {
      \ "none"         : ["NONE", "NONE"],
      \
      \ "bg"           : [234, "#101211"],
      \ "off_bg"       : [235, "#282729"],
      \ "highlight"    : [236, "#403a3a"],
      \ "dark_gray"    : [246, "#928c92"],
      \ "light_gray"   : [251, "#ccc9cc"],
      \ "fg"           : [231, "#fff8fc"],
      \ 
      \ "light_red"    : [218, "#E6FEFF"],
      \ "light_green"  : [156, "#CBFCFE"],
      \ "light_yellow" : [229, "#DEEAE9"],
      \ "light_blue"   : [081, "#F7FFFD"],
      \ "light_magenta": [231, "#D3EBE3"],
      \ "light_cyan"   : [087, "#EBF0EE"],
      \ 
      \ "dark_red"     : [131, "#AEC1C2"],
      \ "dark_green"   : [042, "#91A19F"],
      \ "dark_yellow"  : [148, "#99B49F"],
      \ "dark_blue"    : [067, "#B0B5B4"],
      \ "dark_magenta" : [096, "#91A19C"],
      \ "dark_cyan"    : [036, "#A2A6A4"],
      \ }

exe 'so ' . fnamemodify(expand('<sfile>'), ':p:h') . '/' . 'scheme.vim'
