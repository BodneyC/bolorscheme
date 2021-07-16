local util = require 'bolorscheme.util'

local M = {}

M.loaded = false

local defaults = {
  theme = 'bolorscheme',
  light = false,
  bg_preserve = false,
  colors = nil,
  transparent = false,
  sidebars = {},
  scheme = {},
  styles = {
    commentStyle = 'italic',
    keywordStyle = 'italic',
    functionStyle = 'NONE',
    variableStyle = 'NONE',
  },
}

function M.setup(opts)
  M._opts = opts
  M.opts = vim.tbl_deep_extend('force', {}, defaults, M._opts or {})
  if M.opts.bg_preserve then M.opts.light = vim.o.background ~= 'dark' end
  local ok, ret = pcall(require, 'bolorscheme.themes.' .. M.opts.theme)
  if not ok then
    print('Module \'bolorscheme.themes.' .. M.opts.theme .. '\' not required: ' .. ret)
    return
  end
  M.opts.colors = ret
  M.loaded = true
end

return M
