-- stolen from https://github.com/folke/tokyonight.nvim/blob/main/lua/tokyonight/util.lua
local hsluv = require('bolorscheme.hsluv')

local M = {}

M.colorCache = {}

local function hexToRgb(hex_str)
  local hex = '[abcdef0-9][abcdef0-9]'
  local pat = '^#(' .. hex .. ')(' .. hex .. ')(' .. hex .. ')$'
  hex_str = string.lower(hex_str)

  assert(string.find(hex_str, pat) ~= nil,
    'hex_to_rgb: invalid hex_str: ' .. tostring(hex_str))

  local r, g, b = string.match(hex_str, pat)
  return {tonumber(r, 16), tonumber(g, 16), tonumber(b, 16)}
end

function M.blend(fg, bg, alpha)
  bg = hexToRgb(bg)
  fg = hexToRgb(fg)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format('#%02X%02X%02X', blendChannel(1), blendChannel(2),
    blendChannel(3))
end

function M.darken(hex, amount, bg)
  return M.blend(hex, bg or '#000000', math.abs(amount))
end
function M.lighten(hex, amount, fg)
  return M.blend(hex, fg or '#ffffff', math.abs(amount))
end

function M.brighten(color, percentage)
  local hsl = hsluv.hex_to_hsluv(color)
  local larpSpace = 100 - hsl[3]
  if percentage < 0 then
    larpSpace = hsl[3]
  end
  hsl[3] = hsl[3] + larpSpace * percentage
  return hsluv.hsluv_to_hex(hsl)
end

function M.randomColor(color)
  if color ~= 'NONE' then
    local hsl = hsluv.hex_to_hsluv(color)
    hsl[1] = math.random(1, 360)
    return hsluv.hsluv_to_hex(hsl)
  end
  return color
end

function M.invertColor(color)
  if color ~= 'NONE' then
    local hsl = hsluv.hex_to_hsluv(color)
    hsl[3] = 100 - hsl[3]
    if hsl[3] < 40 then
      hsl[3] = hsl[3] + (100 - hsl[3]) * 0.3
    end
    return hsluv.hsluv_to_hex(hsl)
  end
  return color
end

function M.invertIfLight(color)
  if vim.o.background == 'dark' then
    return color
  end
  if not M.colorCache[color] then
    M.colorCache[color] = M.invertColor(color)
  end
  return M.colorCache[color]
end

function M.highlight(group, color)
  if color.link then
    vim.cmd('highlight! link ' .. group .. ' ' .. color.link)
  else
    local style = color.style and 'gui=' .. color.style or 'gui=NONE'
    local fg = color.fg and 'guifg=' .. color.fg or
                 (color.preserve and '' or 'guifg=NONE')
    local bg = color.bg and 'guibg=' .. color.bg or
                 (color.preserve and '' or 'guibg=NONE')
    local sp = color.sp and 'guisp=' .. color.sp or ''

    local hl =
      'highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' ' ..
        sp

    vim.cmd(hl)
  end
end

function M.autocmds(config)
  vim.cmd([[
    augroup Bolorscheme
    autocmd!
  ]])
  for _, sidebar in ipairs(config.sidebars) do
    if sidebar == 'terminal' then
      vim.cmd(
        [[autocmd TermOpen * setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB]])
    else
      vim.cmd([[autocmd FileType ]] .. sidebar ..
                [[ setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB]])
    end
  end
  vim.cmd([[augroup end]])
end

function M.syntax(syntax)
  for group, colors in pairs(syntax) do
    M.highlight(group, colors)
  end
end

function M.terminal(colors)
  -- dark
  vim.g.terminal_color_0 = colors.black
  vim.g.terminal_color_8 = colors.terminal_black

  -- light
  vim.g.terminal_color_7 = colors.fg_dark
  vim.g.terminal_color_15 = colors.fg

  -- colors
  vim.g.terminal_color_1 = colors.light.red
  vim.g.terminal_color_9 = colors.light.red

  vim.g.terminal_color_2 = colors.light.green
  vim.g.terminal_color_10 = colors.light.green

  vim.g.terminal_color_3 = colors.dark.yellow
  vim.g.terminal_color_11 = colors.dark.yellow

  vim.g.terminal_color_4 = colors.dark.blue
  vim.g.terminal_color_12 = colors.dark.blue

  vim.g.terminal_color_5 = colors.light.magenta
  vim.g.terminal_color_13 = colors.light.magenta

  vim.g.terminal_color_6 = colors.dark.cyan
  vim.g.terminal_color_14 = colors.dark.cyan

  if vim.o.background == 'light' then
    for i = 0, 15, 1 do
      vim.g['terminal_color_' .. i] = M.invertIfLight(vim.g['terminal_color_' .. i])
    end
  end
end

function M.light_colors(colors)
  if type(colors) == 'string' then
    return M.invertIfLight(colors)
  end
  local ret = {}
  for key, value in pairs(colors) do
    ret[key] = M.light_colors(value)
  end
  return ret
end

function M.set_bg(light)
  if light then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
end

function M.load(scheme)
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') == 0 then
    vim.cmd('syntax on')
  end

  vim.o.termguicolors = true

  vim.g.colors_name = scheme.config.theme
  M.syntax(scheme.base)

  vim.defer_fn(function()
    M.terminal(scheme.colors)
    M.syntax(scheme.plugins)
    M.autocmds(scheme.config)
  end, 0)
end

return M
