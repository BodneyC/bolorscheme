if not __BOLORSCHEME_CONFIG then
  print('Bolorscheme config not set')
  return {}
end
local theme = __BOLORSCHEME_CONFIG.theme
local colors = __BOLORSCHEME_CONFIG.colors

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

function M.generateAlacritty()
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

function M.generateKitty()
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

function M.generateThemeFromWal(name)
  local fn = os.getenv('HOME') .. '/.cache/wal/colors'
  if not file_exists(fn) then
    print('Couldn\'t find wal file (' .. fn .. ')')
    return
  end
  local f = io.open(fn, 'r')
  local colors = {}
  for l in f:lines() do
    table.insert(colors, l)
  end
  f:close()
  local cfg = [[return {
  none           = 'NONE',
  comment        = ']] .. colors[8] .. [[',

  bg             = ']] .. colors[0] .. [[',
  bg_dark        = ']] .. colors[0] .. [[',
  bg_highlight   = ']] .. colors[0] .. [[',

  fg             = ']] .. colors[7] .. [[',
  fg_dark        = ']] .. colors[7] .. [[',
  fg_highlight   = ']] .. colors[7] .. [[',

  terminal_black = ']] .. colors[0] .. [[',
  highlight      = ']] .. colors[7] .. [[',

  light          = {
    red          = ']] .. colors[1] .. [[',
    green        = ']] .. colors[2] .. [[',
    yellow       = ']] .. colors[3] .. [[',
    blue         = ']] .. colors[4] .. [[',
    magenta      = ']] .. colors[5] .. [[',
    cyan         = ']] .. colors[6] .. [[',
    gray         = ']] .. colors[8] .. [[',
    teal         = ']] .. colors[4] .. [[',
  },

  dark           = {
    red          = ']] .. colors[9] .. [[',
    green        = ']] .. colors[10] .. [[',
    yellow       = ']] .. colors[11] .. [[',
    blue         = ']] .. colors[12] .. [[',
    magenta      = ']] .. colors[13] .. [[',
    cyan         = ']] .. colors[14] .. [[',
    gray         = ']] .. colors[15] .. [[',
    teal         = ']] .. colors[12] .. [[',
  },

  git            = {
    change       = ']] .. colors[1] .. [[',
    add          = ']] .. colors[2] .. [[',
    delete       = ']] .. colors[3] .. [[',
    conflict     = ']] .. colors[4] .. [[',
    text         = ']] .. colors[5] .. [[',
  },
}]]
    write_to_tmp(cfg, 'wal', 'lua')
end

return M
