# Dotfiles
Personal linux configuration, highly based on [catppuccin](https://github.com/catppuccin) color scheme. Setup subject to change without any reason depending on how I feel with this configuration. 

Actually the current setup includes:
## I3
- Implemented *catppuccin mocha flavor*;
- Removed keybindgs with arrow keys (I have to be forced to use Vim keybindgs);
- Light dmenu customization by adding catppuccin yellow color as main color, opening items in vertical;
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

## Dunst
- Implemented *catppuccin mocha flavor*

## Ranger
- Added kitty as display image mode in order to show images within it (python-pillow package is required on your system).

## Neovim
Still learning about Nvim, so I tried to comment at best the various files, I hope to get better at those file in the future (maybe some plugins are not configured at best).
All written in **lua** from scratch as a learning path, lazy as plugin manager used mainly without events.

### Current plugins
- [CMP](https://github.com/hrsh7th/nvim-cmp);
- [LSPConfig](https://github.com/neovim/nvim-lspconfig);
- [LuaLine](https://github.com/nvim-lualine/lualine.nvim);
- [Telescope](https://github.com/nvim-telescope/telescope.nvim);
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter);
- [Trouble](https://github.com/folke/trouble.nvim);

## Screen
![screen](https://github.com/Glareascum/dotfiles/assets/49961900/adab8e64-63f3-4872-a85e-8f33dfcc5eae)
