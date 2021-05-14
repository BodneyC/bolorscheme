local util = require 'bolorscheme.util'

local M = {}

M.loaded = false

local defaults = {
  theme = 'bolorscheme',
  light = false,
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
  -- if vim.api.nvim_get_vvar('vim_did_enter') == 0 then
  --   vim.cmd([[autocmd VimEnter * ++once lua require'bolorscheme.config'._setup()]])
  -- else
    M._setup()
  -- end
end

function M._setup()
  M.opts = vim.tbl_deep_extend('force', {}, defaults, M._opts or {})
  if M.opts.colors == nil then
    local ok, ret = pcall(require, 'bolorscheme.themes.' .. M.opts.theme)
    if not ok then
      print('Module \'bolorscheme.themes.' .. M.opts.theme .. '\' not required: ' .. ret)
      return
    end
    M.opts.colors = ret
  end
  M.loaded = true
end

return M
