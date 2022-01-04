-- local colors = require('bolorscheme.colors')
local util = require('bolorscheme.util')
-- local scheme = require('bolorscheme.scheme')

local config = {}

config.loaded = false

local defaults = {
  theme = 'bolorscheme',
  light = false,
  bg_preserve = false,
  transparent = false,
  sidebars = {},
  styles = {
    commentStyle = 'italic',
    keywordStyle = 'italic',
    functionStyle = 'NONE',
    variableStyle = 'NONE',
  },
}

function config.setup(opts)
  config._opts = opts
  config.opts = vim.tbl_deep_extend('force', {}, defaults, config._opts or {})
  if config.opts.bg_preserve then
    config.opts.light = vim.o.background ~= 'dark'
  end
  util.set_bg(config.opts.light)
  -- print(vim.inspect(config))
  config.loaded = true
end

return config
