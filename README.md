# Dotfiles
Personal linux configuration, highly based on [catppuccin](https://github.com/catppuccin) color scheme. Setup subject to change without any reason depending on how I feel with this configuration. 

Actually the current setup includes:
## I3
- Implemented *catppuccin mocha flavor*;
- Removed keybindgs with arrow keys (I have to be forced to use Vim keybindgs);
- Replaced, from standard configuration, spliting horizontal from $mod+o to $mod+s to replicate the default vim keybinding (<C-w>s).

## Kitty
- Implemented *catppuccin mocha flavor*;

## Starship
- Implemented *catppuccin mocha flavor*;
- Edited prompt to have also the arch symbol;

## Picom 
Standard configuration;

## Polybar
- Implemented *catppuccin mocha flavor*;
- Modular .ini files;
- Currently implemented: Cpu usage, Ram usage, CPU temperature, I3workspace, Network usage, Volume, Battery, Date and time.

## Neovim
Still learning about Nvim, so I tried to comment at best the various files, I hope to get better at those file in the future (maybe some plugins are not configured at best).
All written in **lua** from scratch as a learning path, lazy as plugin manager used mainly without events.

### Current plugins
- CMP;
- LSPConfig;
- LuaLine;
- Telescope;
- Treesitter;
- Trouble;

## Screen
To be loaded due to frequent changes. Still searching for the colorschemes I like :)
