let g:airline#themes#bolorscheme#palette = {}
let s:dic = g:color_dict
let s:idx = &t_Co > 2 || has("gui_running")

let s:bg = s:dic.bg[s:idx]
let s:fg = s:dic.fg[s:idx]
let s:highlight = s:dic.highlight[s:idx]
let s:light_gray = s:dic.light_gray[s:idx]

" ----- Generic
let s:warning = [ s:bg, s:dic.dark_yellow[s:idx], 85,  234 ]
let s:error = [ s:bg, s:dic.dark_magenta[s:idx], 85,  234 ]

" ----- Insert
let s:a_normal = [ s:bg,                    s:dic.dark_green[s:idx],  17,  190 ]
let s:b_normal = [ s:bg,                    s:dic.light_green[s:idx], 255, 238 ]
let s:c_normal = [ s:dic.light_blue[s:idx], s:highlight,              85,  234 ]


let g:airline#themes#bolorscheme#palette.normal = airline#themes#generate_color_map(s:a_normal, s:b_normal, s:c_normal)
let g:airline#themes#bolorscheme#palette.normal.airline_warning = s:warning
let g:airline#themes#bolorscheme#palette.normal.airline_error = s:error
let g:airline#themes#bolorscheme#palette.normal_modified = g:airline#themes#bolorscheme#palette.normal


" ----- Insert
let s:a_insert = [ s:bg,                    s:dic.dark_blue[s:idx],  17,  45 ]
let s:b_insert = [ s:bg,                    s:dic.light_blue[s:idx], 255, 27 ]
let s:c_insert = [ s:dic.light_blue[s:idx], s:highlight,             15,  17 ]

let g:airline#themes#bolorscheme#palette.insert = airline#themes#generate_color_map(s:a_insert, s:b_insert, s:c_insert)
let g:airline#themes#bolorscheme#palette.insert.airline_warning = s:warning
let g:airline#themes#bolorscheme#palette.insert.airline_error = s:error
let g:airline#themes#bolorscheme#palette.insert_modified = g:airline#themes#bolorscheme#palette.insert
let g:airline#themes#bolorscheme#palette.insert_paste =
      \ { 'airline_a': [ s:a_insert[0], s:dic.dark_cyan[s:idx], s:a_insert[2], 172, '' ] }


" ----- Replace
let s:a_replace = [ s:bg,                    s:dic.dark_red[s:idx],  17,  190 ]
let s:b_replace = [ s:bg,                    s:dic.light_red[s:idx], 255, 238 ]
let s:c_replace = [ s:dic.light_blue[s:idx], s:highlight,            85,  234 ]

let g:airline#themes#bolorscheme#palette.replace = airline#themes#generate_color_map(s:a_replace, s:b_replace, s:c_replace)
let g:airline#themes#bolorscheme#palette.replace.airline_warning = s:warning
let g:airline#themes#bolorscheme#palette.replace.airline_error = s:error
let g:airline#themes#bolorscheme#palette.replace_modified = g:airline#themes#bolorscheme#palette.replace


" ----- Visual
let s:a_visual = [ s:bg,                    s:dic.dark_magenta[s:idx],  232, 214 ]
let s:b_visual = [ s:bg,                    s:dic.light_magenta[s:idx], 232, 202 ]
let s:c_visual = [ s:dic.light_blue[s:idx], s:highlight,                15,  52  ]

let g:airline#themes#bolorscheme#palette.visual = airline#themes#generate_color_map(s:a_visual, s:b_visual, s:c_visual)
let g:airline#themes#bolorscheme#palette.visual.airline_warning = s:warning
let g:airline#themes#bolorscheme#palette.visual.airline_error = s:error
let g:airline#themes#bolorscheme#palette.visual_modified = g:airline#themes#bolorscheme#palette.visual


" ----- Inactive
if &bg == "light"
  let s:a_inactive = [ s:bg, s:dic.dark_gray[s:idx], 239, 234, '' ]
  let s:b_inactive = [ s:bg, s:highlight,            239, 235, '' ]
else
  let s:a_inactive = [ s:bg, s:dic.light_gray[s:idx], 239, 234, '' ]
  let s:b_inactive = [ s:fg, s:highlight,            239, 235, '' ]
endif
let s:c_inactive = [ s:dic.light_blue[s:idx], s:highlight, 239, 236, '' ]

let g:airline#themes#bolorscheme#palette.inactive = airline#themes#generate_color_map(s:a_inactive, s:b_inactive, s:c_inactive)
let g:airline#themes#bolorscheme#palette.inactive_modified = g:airline#themes#bolorscheme#palette.inactive


" ----- Command
let s:a_commandline = [ s:bg,                    s:dic.dark_yellow[s:idx],  17,  40  ]
let s:b_commandline = [ s:bg,                    s:dic.light_yellow[s:idx], 255, 238 ]
let s:c_commandline = [ s:dic.light_blue[s:idx], s:highlight,               85,  234 ]

let g:airline#themes#bolorscheme#palette.commandline = airline#themes#generate_color_map(s:a_commandline, s:b_commandline, s:c_commandline)
let g:airline#themes#bolorscheme#palette.commandline.airline_warning = s:warning
let g:airline#themes#bolorscheme#palette.commandline.airline_error = s:error

" ----- Misc
let g:airline#themes#bolorscheme#palette.accents = { 'red': [ '#ff0000', '', 160, '' ] }

if get(g:, 'loaded_ctrlp', 0)
  let g:airline#themes#bolorscheme#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
        \ [ s:dic.light_cyan[s:idx], s:dic.dark_magenta[s:idx], 189, 55, '' ],
        \ [ s:bg, s:dic.light_magenta[s:idx], 231, 98, '' ],
        \ [ s:dic.dark_magenta[s:idx], s:bg, 55, 231, 'bold' ])
endif
