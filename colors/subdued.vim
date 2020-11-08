set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "subdued"

let g:color_dict = {
      \ "none"          : ["NONE", "NONE"],
      \ "bg"            : [0,   "#1c1b1d"],
      \ "off_bg"        : [235, "#212022"],
      \ "highlight"     : [236, "#262527"],
      \ "dark_gray"     : [1,   "#827c85"],
      \ "light_gray"    : [7,   "#ccc9cf"],
      \ "fg"            : [15,  "#fff8ff"],
      \                                  
      \ "light_red"     : [1,   "#eec8a8"],
      \ "light_green"   : [2,   "#b4dba5"],
      \ "light_yellow"  : [3,   "#e3e999"],
      \ "light_blue"    : [4,   "#a5cde0"],
      \ "light_magenta" : [5,   "#f9adb4"],
      \ "light_cyan"    : [6,   "#92dfc3"],
      \                                  
      \ "dark_red"      : [7,   "#a75757"],
      \ "dark_green"    : [8,   "#70a757"],
      \ "dark_yellow"   : [9,   "#dfde7d"],
      \ "dark_blue"     : [10,  "#89c6d0"],
      \ "dark_magenta"  : [11,  "#c26fae"],
      \ "dark_cyan"     : [12,  "#86b89e"],
      \ }

exe 'so ' . fnamemodify(expand('<sfile>'), ':p:h') . '/' . 'scheme.vim'

let g:niji_subdued_colours = g:niji_bolorscheme_colours
