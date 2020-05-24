let s:idx = &t_Co > 2 || has("gui_running")

let s:p = { 'normal': {}, 'inactive': {}, 'insert': {},
      \ 'replace': {}, 'visual': {}, 'tabline': {} }

let s:p.normal.left = [
      \ [ g:color_dict.bg[s:idx], g:color_dict.light_green[s:idx] ],
      \ [ g:color_dict.bg[s:idx], g:color_dict.light_magenta[s:idx] ],
      \ [ g:color_dict.bg[s:idx], g:color_dict.highlight[s:idx] ]]
let s:p.normal.right = s:p.normal.left
let s:p.normal.middle = [
      \ [ g:color_dict.off_bg[s:idx], g:color_dict.off_bg[s:idx] ]]
let s:p.normal.error = [
      \ [ g:color_dict.off_bg[s:idx], g:color_dict.light_red[s:idx] ]]
let s:p.normal.warning = [
      \ [ g:color_dict.off_bg[s:idx], g:color_dict.light_green[s:idx] ]]

let s:p.inactive.left = [
      \ [ g:color_dict.bg[s:idx], g:color_dict.light_gray[s:idx] ],
      \ [ g:color_dict.bg[s:idx], g:color_dict.light_gray[s:idx] ]]
let s:p.inactive.right = s:p.inactive.left
let s:p.inactive.middle = [
      \ [ g:color_dict.dark_gray[s:idx], g:color_dict.dark_gray[s:idx] ]]

let s:p.insert.left = [
      \ [ g:color_dict.bg[s:idx], g:color_dict.light_blue[s:idx] ],
      \ [ g:color_dict.bg[s:idx], g:color_dict.light_magenta[s:idx] ],
      \ [ g:color_dict.bg[s:idx], g:color_dict.highlight[s:idx] ]]
let s:p.insert.right = s:p.insert.left

let s:p.replace.left = [
      \ [ g:color_dict.bg[s:idx], g:color_dict.dark_red[s:idx] ],
      \ [ g:color_dict.bg[s:idx], g:color_dict.light_magenta[s:idx] ],
      \ [ g:color_dict.bg[s:idx], g:color_dict.highlight[s:idx] ]]
let s:p.replace.right = s:p.replace.left

let s:p.visual.left = [
      \ [ g:color_dict.bg[s:idx], g:color_dict.dark_magenta[s:idx] ],
      \ [ g:color_dict.bg[s:idx], g:color_dict.light_magenta[s:idx] ],
      \ [ g:color_dict.bg[s:idx], g:color_dict.highlight[s:idx] ]]
let s:p.visual.right = s:p.visual.left

let s:p.tabline.left = [
      \ [ g:color_dict.bg[s:idx], g:color_dict.light_magenta[s:idx] ]]
let s:p.tabline.tabsel = [
      \ [ g:color_dict.fg[s:idx], g:color_dict.off_bg[s:idx] ]]
let s:p.tabline.middle = [[
      \ g:color_dict.light_magenta[s:idx],
      \ g:color_dict.light_magenta[s:idx] ]]
let s:p.tabline.right = s:p.normal.right

let g:lightline#colorscheme#bolorscheme#palette =
      \ lightline#colorscheme#fill(s:p)
