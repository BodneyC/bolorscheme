<!-- markdownlint-disable MD013 -->

# BolorScheme

This is half a practical way to quickly set up a colorscheme and half a way to quickly test a colorscheme with the intent to tweak it and fine tune it later.

It is pretty much a template system, you provide an object of colors and Bolorscheme does the rest.

## Install

[Packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  'bodneyc/bolorscheme',
  branch = 'lua', -- This is the default but it's nice to be specific
  config = function()
    require'bolorscheme'.setup {theme = 'bolorscheme'} -- Name of the inbuilt scheme
  end,
}
```

[Vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'bodneyc/bolorscheme'

" Then, as early as possible
lua require'bolorscheme'.setup {theme = 'bolorscheme'}
```

### Config

These are the default configuration options which may be overriden:

```lua
{
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
```

You can either specify the `colors` directly with the same structure as those found in `./lua/bolorscheme/themes/`.

Or if you wish to use an in built theme, leave `colors` as nil (or unspecified) and specify the basename of the file in the `theme` key.

E.g. for the `plint` theme, specify: `{theme = 'plint'}`.

For automatic color inversion and `bg` set to `light`, specify `{light = true}`.

## In-built Themes

There are a few built into this repo which make use of the both the object above and `scheme.lua`; these serve to show how just setting the colors you like as above can set the whole theme:

- [Unicorn](./lua/bolorscheme/themes/unicorn.lua), which is purple-ish, pink-ish
- [Subdued](./lua/bolorscheme/themes/subdued.lua), which is a fairly standard color palette but slightly softened
- [Plint](./lua/bolorscheme/themes/plint.vim), which is a low contrast minty scheme
- [Nord](./lua/bolorscheme/themes/nord.vim), which is a direct ripoff of the classic [Nord](https://github.com/arcticicestudio/nord-vim) theme
- [Tokyonight](./lua/bolorscheme/themes/tokyonight.lua), which is a direct ripoff the [Tokyonight](https://github.com/folke/tokyonight.nvim/) theme (See [Disclaimer](#disclaimer) for more...)

__Note__: None of the above are thoroughly planned out schemes, just examples.

## Lualine

A [lualine](https://github.com/hoob3rt/lualine.nvim) configuration file, taking from the theme/colors you have specified, is provided in `./lua/lualine/themes/bolorscheme.lua`.

Setting the lualine theme option to `bolorscheme` will set an appropriate theme.

## Generators

There are a couple of utilities for taking the color dictionary loaded with Bolorscheme and generating theme configs for other programs.

```lua
require'bolorscheme'.generate('alacritty')
```

Will create a config file for the [Alacritty](https://github.com/alacritty/alacritty) terminal with the name `<theme-name>.alacritty.yaml` in the current directory with the colors from the theme set.

```lua
require'bolorscheme'.generate('kitty')
```

Will create a config for the [Kitty](https://sw.kovidgoyal.net/kitty/) with the name `<theme-name>.kitty.conf` in the current directory with the colors from the theme set.

__Note__: The colors in the theme are more plentiful than the 16 colors permitted for both of the above configs, so I'm using the standard light/dark colors to create the configs.

Finally, there is an options for generating a theme from a [Wal](https://github.com/dylanaraps/pywal) cached file, specifically `$HOME/.cache/wal/colors`.

This will create a config for Bolorscheme with the name `<theme-name>.wal.lua` which can then be used in Bolorscheme.

### The Misc Folder

The files in `./misc` are the use of the [Generators](#generators) to create Kitty and Alacritty theme files for each of the in-built themes.

## Disclaimer

Though the idea for Bolorscheme long pre-dates it, much of the lua code for this branch was stolen directly from the [Tokyonight](https://github.com/folke/tokyonight.nvim/) plugin - seemed pointless to reinvent the wheel but the concepts were different enough and most of the acting parts of the code would be changed enough for a fork not to be the right way to go.
