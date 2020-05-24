command! -nargs=0 GenerateAlacrittyFromBolorscheme call bolorscheme#generate#alacritty()
command! -nargs=0 GenerateKittyFromBolorscheme     call bolorscheme#generate#kitty()
command! -nargs=? GenerateColorDictFromWal         call bolorscheme#generate#color_dict_from_wal(<f-args>)

command! -nargs=0 SymlinkAirlineFromBolorscheme    call bolorscheme#symlink#airline()
command! -nargs=0 SymlinkLightlineFromBolorscheme  call bolorscheme#symlink#lightline()
