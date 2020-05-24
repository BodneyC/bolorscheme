function <SID>yes_or_no(msg)
  while 1
    echo a:msg
    let c = inputlist(['1. Yes', '2. No'])
    if c > -1 && c < 3
      return c == 1
    endif
    echo c . ' invalid'
    echo
  endwhile
endfunction

function! <SID>symlink(from, to) abort
  if ! filereadable(a:from)
    echoe 'Bolorscheme: file [' . a:from . '] does not exist'
    return
  endif
  if len(glob(a:to, 0, 0, 1)) != 0
    if <SID>yes_or_no(a:to . ' exists, delete?')
      call system('/bin/rm ' . a:to)
    else
      echo 'BolorScheme: returning'
      return
    endif
  endif
  echo system('ln -s ' . a:from . ' ' . a:to)
endfunction

function! bolorscheme#symlink#generic(plugin, theme_path) abort
  let l:plugin = a:plugin
  if len(finddir(l:plugin, g:plug_home)) == 0
    echoe 'BolorScheme: [' . l:plugin . '] not found in [g:plug_home], ' . l:plugin . 'may not be installed'
    return
  endif
  let l:from = expand('<sfile>:p:h') . '/misc/' . l:plugin . '/bolorscheme.vim'
  let l:to = g:plug_home . '/' . l:plugin . '/' . a:theme_path . '/bolorscheme.vim'
  call <SID>symlink(l:from, l:to)
endfunction

function! bolorscheme#symlink#airline()
  call bolorscheme#symlink#generic('vim-airline', 'autoload/airline/themes')
endfunction

function! bolorscheme#symlink#lightline()
  call bolorscheme#symlink#generic('lightline.vim', 'autoload/lightline/colorscheme')
endfunction
