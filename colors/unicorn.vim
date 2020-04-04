set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "unicorn"

let g:color_dict = {}
let g:color_dict.none = ["NONE", ""]

let g:color_dict.bg            = [234, "#292429"]
let g:color_dict.off_bg        = [235, "#3a353a"]
let g:color_dict.highlight     = [236, "#403a3a"]
let g:color_dict.dark_gray     = [246, "#928c92"]
let g:color_dict.light_gray    = [251, "#ccc9cc"]
let g:color_dict.fg            = [231, "#fff8fc"]

let g:color_dict.light_red     = [218, "#fdbad5"]
let g:color_dict.light_green   = [156, "#c1fffb"]
let g:color_dict.light_yellow  = [229, "#E3FFD1"]
let g:color_dict.light_blue    = [081, "#d0d5fe"]
let g:color_dict.light_magenta = [231, "#dfc2e8"]
let g:color_dict.light_cyan    = [087, "#d2f0ff"]

let g:color_dict.dark_red      = [131, "#bc92a4"]
let g:color_dict.dark_green    = [042, "#a9c8bd"]
let g:color_dict.dark_yellow   = [148, "#bec7a7"]
let g:color_dict.dark_blue     = [067, "#9089b0"]
let g:color_dict.dark_magenta  = [096, "#ab8bb0"]
let g:color_dict.dark_cyan     = [036, "#819790"]

exe 'so ' . fnamemodify(expand('<sfile>'), ':p:h') . '/' . 'scheme.vim'
