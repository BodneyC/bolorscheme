" Normally, I would check for RGB support in Vim. However these configs need
"   the RRGGBB format regardless, so it's just one.
let s:idx = 1

function! bolorscheme#generate#generic(cfg, ft)
  enew
  exec 'set ft=' . a:ft
  set buftype=nofile
  put! =a:cfg
endfunction

function! <SID>hash_replace(val)
  return substitute(a:val, '#', '0x', '')
endfunction

function! bolorscheme#generate#alacritty()
  let l:config = [
        \ "colors:",
        \ "  primary:",
        \ "    background: '" . <SID>hash_replace(g:color_dict.bg[s:idx]) . "'",
        \ "    foreground: '" . <SID>hash_replace(g:color_dict.fg[s:idx]) . "'",
        \ "  normal:",
        \ "    black:      '" . <SID>hash_replace(g:color_dict.dark_gray[s:idx])     . "'",
        \ "    red:        '" . <SID>hash_replace(g:color_dict.light_red[s:idx])     . "'",
        \ "    green:      '" . <SID>hash_replace(g:color_dict.light_green[s:idx])   . "'",
        \ "    yellow:     '" . <SID>hash_replace(g:color_dict.light_yellow[s:idx])  . "'",
        \ "    blue:       '" . <SID>hash_replace(g:color_dict.light_blue[s:idx])    . "'",
        \ "    magenta:    '" . <SID>hash_replace(g:color_dict.light_magenta[s:idx]) . "'",
        \ "    cyan:       '" . <SID>hash_replace(g:color_dict.light_cyan[s:idx])    . "'",
        \ "    white:      '" . <SID>hash_replace(g:color_dict.light_gray[s:idx])    . "'",
        \ "  bright:",
        \ "    black:      '" . <SID>hash_replace(g:color_dict.dark_gray[s:idx])    . "'",
        \ "    red:        '" . <SID>hash_replace(g:color_dict.dark_red[s:idx])     . "'",
        \ "    green:      '" . <SID>hash_replace(g:color_dict.dark_green[s:idx])   . "'",
        \ "    yellow:     '" . <SID>hash_replace(g:color_dict.dark_yellow[s:idx])  . "'",
        \ "    blue:       '" . <SID>hash_replace(g:color_dict.dark_blue[s:idx])    . "'",
        \ "    magenta:    '" . <SID>hash_replace(g:color_dict.dark_magenta[s:idx]) . "'",
        \ "    cyan:       '" . <SID>hash_replace(g:color_dict.dark_cyan[s:idx])    . "'",
        \ "    white:      '" . <SID>hash_replace(g:color_dict.light_gray[s:idx])   . "'"
        \]
  call bolorscheme#generate#generic(l:config, 'yaml')
endfunction

function! bolorscheme#generate#kitty() 
  let l:config = [
        \ "foreground " . g:color_dict.fg[s:idx],
        \ "background " . g:color_dict.bg[s:idx],
        \ "color0     " . g:color_dict.dark_gray[s:idx],
        \ "color1     " . g:color_dict.light_red[s:idx],
        \ "color2     " . g:color_dict.light_green[s:idx],
        \ "color3     " . g:color_dict.light_yellow[s:idx],
        \ "color4     " . g:color_dict.light_blue[s:idx],
        \ "color5     " . g:color_dict.light_magenta[s:idx],
        \ "color6     " . g:color_dict.light_cyan[s:idx],
        \ "color7     " . g:color_dict.light_gray[s:idx],
        \ "color8     " . g:color_dict.dark_gray[s:idx],
        \ "color9     " . g:color_dict.dark_red[s:idx],
        \ "color10    " . g:color_dict.dark_green[s:idx],
        \ "color11    " . g:color_dict.dark_yellow[s:idx],
        \ "color12    " . g:color_dict.dark_blue[s:idx],
        \ "color13    " . g:color_dict.dark_magenta[s:idx],
        \ "color14    " . g:color_dict.dark_cyan[s:idx],
        \ "color15    " . g:color_dict.light_gray[s:idx]
        \]
  call bolorscheme#generate#generic(l:config, 'config')
endfunction

function! bolorscheme#generate#color_dict_from_wal(...)
  let l:fn = expand('$HOME/.cache/wal/colors')
  if len(a:000)
    let l:fn = a:1
  endif
  if ! filereadable(l:fn)
    echoe "BolorScheme: [" . l:fn . "] not readable"
    return
  endif
  let l:colors = readfile(l:fn)
  let g:color_dict = {
        \ "none"          : ["NONE", ""],
        \ "bg"            : [0,  l:colors[0 ]],
        \ "off_bg"        : [0,  l:colors[0 ]],
        \ "highlight"     : [0,  l:colors[0 ]],
        \ "fg"            : [0,  l:colors[0 ]],
        \
        \ "dark_gray"     : [0,  l:colors[0 ]],
        \ "light_gray"    : [7,  l:colors[7 ]],
        \ "light_red"     : [1,  l:colors[1 ]],
        \ "light_green"   : [2,  l:colors[2 ]],
        \ "light_yellow"  : [3,  l:colors[3 ]],
        \ "light_blue"    : [4,  l:colors[4 ]],
        \ "light_magenta" : [5,  l:colors[5 ]],
        \ "light_cyan"    : [6,  l:colors[6 ]],
        \
        \ "dark_red"      : [9,  l:colors[9 ]],
        \ "dark_green"    : [10, l:colors[10]],
        \ "dark_yellow"   : [11, l:colors[11]],
        \ "dark_blue"     : [12, l:colors[12]],
        \ "dark_magenta"  : [13, l:colors[13]],
        \ "dark_cyan"     : [14, l:colors[14]]
        \ }

  let l:cfg = [ "let g:color_dict = {" ]
  for [k, v] in items(g:color_dict)
    call add(l:cfg, "      \\ \"" . k . "\": [" . v[0] . ", \"" . v[1] . "\"],")
  endfor
  call add(l:cfg, "      \\}")

  call bolorscheme#generate#generic(l:cfg, 'vim')
endfunction


