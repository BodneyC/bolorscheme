set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "plint"

let g:color_dict = {}
let g:color_dict.none = ["NONE", ""]

let g:color_dict.bg            = [234, "#101211"]
let g:color_dict.off_bg        = [235, "#282729"]
let g:color_dict.highlight     = [236, "#403a3a"]
let g:color_dict.dark_gray     = [246, "#928c92"]
let g:color_dict.light_gray    = [251, "#ccc9cc"]
let g:color_dict.fg            = [231, "#fff8fc"]

let g:color_dict.light_red     = [218, "#E6FEFF"]
let g:color_dict.light_green   = [156, "#CBFCFE"]
let g:color_dict.light_yellow  = [229, "#DEEAE9"]
let g:color_dict.light_blue    = [081, "#F7FFFD"]
let g:color_dict.light_magenta = [231, "#D3EBE3"]
let g:color_dict.light_cyan    = [087, "#EBF0EE"]

let g:color_dict.dark_red      = [131, "#AEC1C2"]
let g:color_dict.dark_green    = [042, "#91A19F"]
let g:color_dict.dark_yellow   = [148, "#99B49F"]
let g:color_dict.dark_blue     = [067, "#B0B5B4"]
let g:color_dict.dark_magenta  = [096, "#91A19C"]
let g:color_dict.dark_cyan     = [036, "#A2A6A4"]

exe 'so ' . fnamemodify(expand('<sfile>'), ':p:h') . '/' . 'scheme.vim'
