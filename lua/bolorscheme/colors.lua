local util = require'bolorscheme.util'

local M = {}

function M.process(opts)
  local colors = opts.colors

  colors.diff = {
    add = util.darken(colors.git.add, 0.15),
    delete = util.darken(colors.git.delete, 0.15),
    change = util.darken(colors.git.change, 0.15),
    text = util.darken(colors.git.text, 0.15),
  }

  colors.gitSigns = {
    add = util.brighten(colors.diff.add, 0.3),
    change = util.brighten(colors.diff.change, 0.3),
    delete = util.brighten(colors.diff.delete, 0.3),
  }

  colors.git.ignore = colors.dark.gray
  colors.black = util.darken(colors.bg, 0.8, '#000000')
  colors.border_highlight = colors.highlight
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  colors.bg_visual = util.darken(colors.highlight, 0.7)
  colors.bg_search = colors.highlight

  colors.fg_sidebar = util.darken(colors.fg, 0.92)
  colors.bg_sidebar = util.darken(colors.bg, 0.92)

  colors.error = colors.dark.red
  colors.warning = colors.dark.yellow
  colors.info = colors.dark.teal
  colors.hint = colors.light.teal

  if opts.light then
    colors = util.light_colors(colors)
  end
end

return M
