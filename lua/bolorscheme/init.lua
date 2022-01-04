local config = require('bolorscheme.config')
local scheme = require('bolorscheme.scheme')
local util = require('bolorscheme.util')

local bolorscheme = {}

function bolorscheme.setup(conf)
  config.setup(conf)
  if not config.loaded then
    print 'Loading failed'
    return
  end
  util.load(scheme.create(config.opts))
end

function bolorscheme.print_config()
  if not config.opts then
    print 'Bolorscheme config not set'
    return
  end
  print(vim.inspect(config.opts))
end

function bolorscheme.generate(prg)
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

return bolorscheme
