local config = require('bolorscheme.config')
local colors = require('bolorscheme.colors')
local scheme = require('bolorscheme.scheme')
local util = require('bolorscheme.util')

-- Can't think of another way to do this...
__BOLORSCHEME_CONFIG = nil

local M = {}

local colors_name = nil

function M.setup(conf)
  config.setup(conf)
  if not config.loaded then
    print 'Loading failed'
    return
  end
  util.set_bg(config.opts.light)
  colors_name = config.opts.theme
  colors.process(config.opts)
  scheme.create(config.opts)
  util.load(config.opts)
  __BOLORSCHEME_CONFIG = config.opts
end

function M.print_config()
  if not __BOLORSCHEME_CONFIG then
    print 'Bolorscheme config not set'
    return
  end
  print(vim.inspect(__BOLORSCHEME_CONFIG))
end

function M.generate(prg)
  local generator = require 'bolorscheme.generator'
  if prg:lower() == 'alacritty' then
    generator.generateAlacritty()
  elseif prg:lower() == 'kitty' then
    generator.generateKitty()
  elseif prg:lower() == 'wal' then
    generator.generateThemeFromWal()
  else
    print('Invalid prg (' .. prg .. ')')
  end
end

return M
