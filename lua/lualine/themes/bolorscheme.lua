if not __BOLORSCHEME_CONFIG then
  print('Bolorscheme config not set')
  return {}
end

local util = require('bolorscheme.util')
local colors = __BOLORSCHEME_CONFIG.colors

local bolorscheme = {}

bolorscheme.normal = {
  a = {bg = colors.dark.blue, fg = colors.black},
  b = {bg = colors.fg_highlight, fg = colors.dark.blue},
  c = {bg = colors.bg_statusline, fg = colors.fg_sidebar},
}

bolorscheme.insert = {
  a = {bg = colors.light.green, fg = colors.black},
  b = {bg = colors.fg_highlight, fg = colors.light.green},
}

bolorscheme.command = {
  a = {bg = colors.dark.yellow, fg = colors.black},
  b = {bg = colors.fg_highlight, fg = colors.dark.yellow},
}

bolorscheme.visual = {
  a = {bg = colors.dark.magenta, fg = colors.black},
  b = {bg = colors.fg_highlight, fg = colors.dark.magenta},
}

bolorscheme.replace = {
  a = {bg = colors.dark.red, fg = colors.black},
  b = {bg = colors.fg_highlight, fg = colors.dark.red},
}

bolorscheme.inactive = {
  a = {bg = colors.bg_statusline, fg = colors.dark.blue},
  b = {bg = colors.bg_statusline, fg = colors.fg_highlight, gui = 'bold'},
  c = {bg = colors.bg_statusline, fg = colors.fg_highlight},
}

if vim.o.background == 'light' then
  for _, mode in pairs(bolorscheme) do
    for _, section in pairs(mode) do
      if section.bg then section.bg = util.getColor(section.bg) end
      if section.fg then section.fg = util.getColor(section.fg) end
    end
  end
end

return bolorscheme
