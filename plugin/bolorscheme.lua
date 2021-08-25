if vim.g.loaded_bolorscheme then
  return
end
vim.g.loaded_bolorscheme = true

vim.cmd [[command! BolorGenKitty lua require('bolorscheme.generator').kitty()]]
vim.cmd [[command! BolorGenAlacritty lua require('bolorscheme.generator').alacritty()]]
vim.cmd [[command! BolorGenFromWal lua require('bolorscheme.generator').theme_from_wal()]]
