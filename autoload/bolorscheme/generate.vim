" Normally, I would check for RGB support in Vim. However these configs need
"   the RRGGBB format regardless, so it's just one.
let s:idx = 1

function! bolorscheme#generate#generic(cfg, ft)
  enew
  exec 'set ft=' . a:ft
  put! =a:cfg
endfunction

function! bolorscheme#generate#alacritty()
  let l:config = [
        \ "colors:",
        \ "  primary:",
        \ "    background: '" . g:color_dict.bg[s:idx] . "'",
        \ "    foreground: '" . g:color_dict.fg[s:idx] . "'",
        \ "  normal:",
        \ "    black:      '" . g:color_dict.dark_gray[s:idx]     . "'",
        \ "    red:        '" . g:color_dict.light_red[s:idx]     . "'",
        \ "    green:      '" . g:color_dict.light_green[s:idx]   . "'",
        \ "    yellow:     '" . g:color_dict.light_yellow[s:idx]  . "'",
        \ "    blue:       '" . g:color_dict.light_blue[s:idx]    . "'",
        \ "    magenta:    '" . g:color_dict.light_magenta[s:idx] . "'",
        \ "    cyan:       '" . g:color_dict.light_cyan[s:idx]    . "'",
        \ "    white:      '" . g:color_dict.light_gray[s:idx]    . "'",
        \ "  bright:",
        \ "    black:      '" . g:color_dict.dark_gray[s:idx]    . "'",
        \ "    red:        '" . g:color_dict.dark_red[s:idx]     . "'",
        \ "    green:      '" . g:color_dict.dark_green[s:idx]   . "'",
        \ "    yellow:     '" . g:color_dict.dark_yellow[s:idx]  . "'",
        \ "    blue:       '" . g:color_dict.dark_blue[s:idx]    . "'",
        \ "    magenta:    '" . g:color_dict.dark_magenta[s:idx] . "'",
        \ "    cyan:       '" . g:color_dict.dark_cyan[s:idx]    . "'",
        \ "    white:      '" . g:color_dict.light_gray[s:idx]   . "'"
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
