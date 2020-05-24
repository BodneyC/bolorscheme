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
