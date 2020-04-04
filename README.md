BolorScheme
===========

This is half a practical way to quickly set up a colorscheme and half a way to quickly test a colorscheme with the intent to tweak it and fine tune it later.

The guts of this are in `./colors/scheme.vim`, this is where all the highlight groups are set. `scheme.vim` takes it's colors from a global dictionary, `g:color_dict` which is in the format:

```json
{
  "none"          : ["NONE", ""],
  "bg"            : [256, "#RRGGBB"],
  "off_bg"        : [256, "#RRGGBB"],
  "highlight"     : [256, "#RRGGBB"],
  "dark_gray"     : [256, "#RRGGBB"],
  "light_gray"    : [256, "#RRGGBB"],
  "fg"            : [256, "#RRGGBB"],
  "light_red"     : [256, "#RRGGBB"],
  "light_green"   : [256, "#RRGGBB"],
  "light_yellow"  : [256, "#RRGGBB"],
  "light_blue"    : [256, "#RRGGBB"],
  "light_magenta" : [256, "#RRGGBB"],
  "light_cyan"    : [256, "#RRGGBB"],
  "dark_red"      : [256, "#RRGGBB"],
  "dark_green"    : [256, "#RRGGBB"],
  "dark_yellow"   : [256, "#RRGGBB"],
  "dark_blue"     : [256, "#RRGGBB"],
  "dark_magenta"  : [256, "#RRGGBB"],
  "dark_cyan"     : [256, "#RRGGBB"]
}
```

You can set this in your config file and then call `colo bolorscheme` to set the theme. So "bolorscheme" isn't a scheme in it's own right, more a mapping of the above colors to highlight groups.

There are a few built into this repo which make use of the both the object above and `scheme.vim`; these serve to show how just setting the colors you like as above can set the whole theme:

- [Unicorn](./colors/unicorn.vim), which is purple-ish, pink-ish
- [Subdued](./colors/subdued.vim), which is a fairly standard color palette but slightly softened
- [Plint](./colors/plint.vim), which is a low contrast minty scheme


__Note__: None of the above are thoroughly planned out schemes, just examples.
