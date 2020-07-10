set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "subdued"

let g:color_dict = {}
let g:color_dict.none = ["NONE", ""]

let g:color_dict.bg            = [0, "#1c1b1d"]
let g:color_dict.off_bg        = [235, "#282729"]
let g:color_dict.highlight     = [236, "#403a3a"]
let g:color_dict.dark_gray     = [1, "#928c92"]
let g:color_dict.light_gray    = [7, "#ccc9cc"]
let g:color_dict.fg            = [15, "#fff8fc"]

let g:color_dict.light_red     = [1, "#eec8a8"]
let g:color_dict.light_green   = [2, "#b4dba5"]
let g:color_dict.light_yellow  = [3, "#e3e999"]
let g:color_dict.light_blue    = [4, "#a5cde0"]
let g:color_dict.light_magenta = [5, "#f9adb4"]
let g:color_dict.light_cyan    = [6, "#92dfc3"]

let g:color_dict.dark_red      = [7,  "#a75757"]
let g:color_dict.dark_green    = [8,  "#70a757"]
let g:color_dict.dark_yellow   = [9,  "#dfde7d"]
let g:color_dict.dark_blue     = [10, "#89c6d0"]
let g:color_dict.dark_magenta  = [11, "#c26fae"]
let g:color_dict.dark_cyan     = [12, "#86b89e"]

exe 'so ' . fnamemodify(expand('<sfile>'), ':p:h') . '/' . 'scheme.vim'
