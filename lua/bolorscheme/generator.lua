local active_scheme = require('bolorscheme.scheme').active_scheme

if not active_scheme then
  print('Bolorscheme config not set')
  return {}
end

local theme = active_scheme.config.theme
local colors = active_scheme.colors

local function file_exists(fn)
  local f = io.open(fn, 'r')
  if f == nil then
    return false
  else
    f:close()
    return true
  end
end

local function write_to_tmp(cfg, prg, ft)
  local fn = theme .. '.' .. prg .. '.' .. ft
  if file_exists(fn) then
    print(fn .. ' already exists')
    return
  end
  local f = io.open(fn, 'w')
  f:write(cfg)
  f:close()
  vim.cmd('e ' .. fn)
end

local function hash_replace(val)
  return val:gsub('#', '0x')
end

local M = {}

function M.alacritty()
  local cfg = theme .. [[ : &]] .. theme .. [[

  primary:
    background: ]] .. hash_replace(colors.bg) .. [[

    foreground: ]] .. hash_replace(colors.fg) .. [[

  normal:

    black:      ]] .. hash_replace(colors.dark.gray) .. [[

    red:        ]] .. hash_replace(colors.light.red) .. [[

    green:      ]] .. hash_replace(colors.light.green) .. [[

    yellow:     ]] .. hash_replace(colors.light.yellow) .. [[

    blue:       ]] .. hash_replace(colors.light.blue) .. [[

    magenta:    ]] .. hash_replace(colors.light.magenta) .. [[

    cyan:       ]] .. hash_replace(colors.light.cyan) .. [[

    white:      ]] .. hash_replace(colors.light.gray) .. [[

  bright:

    black:      ]] .. hash_replace(colors.dark.gray) .. [[

    red:        ]] .. hash_replace(colors.dark.red) .. [[

    green:      ]] .. hash_replace(colors.dark.green) .. [[

    yellow:     ]] .. hash_replace(colors.dark.yellow) .. [[

    blue:       ]] .. hash_replace(colors.dark.blue) .. [[

    magenta:    ]] .. hash_replace(colors.dark.magenta) .. [[

    cyan:       ]] .. hash_replace(colors.dark.cyan) .. [[

    white:      ]] .. hash_replace(colors.light.gray)

  write_to_tmp(cfg, 'alacritty', 'yaml')
end

function M.kitty()
  local cfg = [[
selection_background     ]] .. colors.light.gray .. [[

selection_foreground     ]] .. colors.bg .. [[

active_tab_background    ]] .. colors.light.blue .. [[

active_tab_foreground    ]] .. colors.bg_dark .. [[

inactive_tab_background  ]] .. colors.bg_highlight .. [[

inactive_tab_foreground  ]] .. colors.dark.gray .. [[

foreground ]] .. colors.fg .. [[

background ]] .. colors.bg .. [[

url_color  ]] .. colors.dark.blue .. [[

cursor     ]] .. colors.fg .. [[

color0     ]] .. colors.dark.gray .. [[

color1     ]] .. colors.light.red .. [[

color2     ]] .. colors.light.green .. [[

color3     ]] .. colors.light.yellow .. [[

color4     ]] .. colors.light.blue .. [[

color5     ]] .. colors.light.magenta .. [[

color6     ]] .. colors.light.cyan .. [[

color7     ]] .. colors.light.gray .. [[

color8     ]] .. colors.dark.gray .. [[

color9     ]] .. colors.dark.red .. [[

color10    ]] .. colors.dark.green .. [[

color11    ]] .. colors.dark.yellow .. [[

color12    ]] .. colors.dark.blue .. [[

color13    ]] .. colors.dark.magenta .. [[

color14    ]] .. colors.dark.cyan .. [[

color15    ]] .. colors.light.gray

  write_to_tmp(cfg, 'kitty', 'conf')
end

function M.theme_from_wal()
  local fn = os.getenv('HOME') .. '/.cache/wal/colors'
  if not file_exists(fn) then
    print('Couldn\'t find wal file (' .. fn .. ')')
    return
  end
  local f = io.open(fn, 'r')
  local wal_colors = {}
  for l in f:lines() do
    table.insert(wal_colors, l)
  end
  f:close()
  print(vim.inspect(wal_colors))
  print(#wal_colors)
  local cfg = [[return {
  none           = 'NONE',
  comment        = ']] .. wal_colors[9] .. [[',

  bg             = ']] .. wal_colors[1] .. [[',
  bg_dark        = ']] .. wal_colors[1] .. [[',
  bg_highlight   = ']] .. wal_colors[1] .. [[',

  fg             = ']] .. wal_colors[8] .. [[',
  fg_dark        = ']] .. wal_colors[8] .. [[',
  fg_highlight   = ']] .. wal_colors[8] .. [[',

  terminal_black = ']] .. wal_colors[1] .. [[',
  highlight      = ']] .. wal_colors[8] .. [[',

  light          = {
    red          = ']] .. wal_colors[2] .. [[',
    green        = ']] .. wal_colors[3] .. [[',
    yellow       = ']] .. wal_colors[4] .. [[',
    blue         = ']] .. wal_colors[5] .. [[',
    magenta      = ']] .. wal_colors[6] .. [[',
    cyan         = ']] .. wal_colors[7] .. [[',
    gray         = ']] .. wal_colors[9] .. [[',
    teal         = ']] .. wal_colors[5] .. [[',
  },

  dark           = {
    red          = ']] .. wal_colors[10] .. [[',
    green        = ']] .. wal_colors[11] .. [[',
    yellow       = ']] .. wal_colors[12] .. [[',
    blue         = ']] .. wal_colors[13] .. [[',
    magenta      = ']] .. wal_colors[14] .. [[',
    cyan         = ']] .. wal_colors[15] .. [[',
    gray         = ']] .. wal_colors[16] .. [[',
    teal         = ']] .. wal_colors[13] .. [[',
  },

  git            = {
    change       = ']] .. wal_colors[2] .. [[',
    add          = ']] .. wal_colors[3] .. [[',
    delete       = ']] .. wal_colors[4] .. [[',
    conflict     = ']] .. wal_colors[5] .. [[',
    text         = ']] .. wal_colors[6] .. [[',
  },
}]]
  write_to_tmp(cfg, 'wal', 'lua')
end

return M
