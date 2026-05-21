# Readme

## Thanks to

- [@josean-dev] for the most of the tools recommendation [@joseandev](https://github.com/josean-dev)
  - https://www.josean.com/posts/7-amazing-cli-tools
- [@woioeow] for the hyprland shortcut and configuration and wallpaper [@woioeow](https://github.com/woioeow)
  - https://github.com/woioeow/hyprland-dotfiles/
- [@JarkDerksen] for his tmux configuration [@JackDerksen](https://github.com/JackDerksen/)
  - [tmux.config](https://github.com/JackDerksen/tmux/blob/main/tmux.conf)

## Unifying My Workflow: The Ultimate Cross-Platform Terminal Setup with WezTerm, Powerlevel10k, Neovim, Tmux

Navigating between macOS, Windows, and Linux at home or in the office, can present unique challenges when trying to maintain a consistent and efficient workflow.

After extensive selection, I discovered wezterm excels in both compatibility and productivity.

## Why I Chose WezTerm as My Terminal

Cross-platform support is essential for developers who shift between different operating systems. While evaluating several popular terminals, three stood out:
•	WezTerm: Reliable, feature-rich, and supports Windows, macOS, and Linux seamlessly.
•	Kitty: Excellent performance, but support is restricted to Linux.
•	Ghostty: Fast and lightweight, available for Linux and macOS only.

WezTerm emerged as my preferred choice due to its robust feature set, active development, and the support for all OSes.

## Requirement

- kitty / wezterm (linux hyprland/plasma work best with kitty, wezterm for windows, mac, linux plasma with wayland disabled, cosmic work out of the box)
- zsh
- oh-my-zsh
- powerlevel10k
- ripgrep
- fzf
- zoxide
- eza / lsd
- batcat
- xclip
- neovim
- pay-respects (faster) / thef*ck (slow)
- tealdeer (rust, faster) / tldr (slow)
- git-delta
- neovim
- waybar ( hyprland only )
- rofi (hyprland only)
- oh-my-posh ( alternative to powerlevel10k)
- redshift (shifting the color in shell)
- mako
- sddm (linux only)
- hyprpaper, hypridle (hyprland only)
- fd
- librewolf (changed from firefox)
- snappy-switch ( install using paru -S snappy-switcher)

## files

- windows : C:/Users/Username/.config/wezterm
- Linux : ~/.config/
- MacOS : ~/.config/

## Hyprland

- deadkeys enabled (wezterm : `config.use_dead_keys = true` , hyprland `kb_variant = intl`)
- `HDMI-A-2` and `DP-4`, sometimes it changed  to `HDMI-A-1`, `DP-1`

## Non Standard Shorcut in Wezterm

- Ctrl + Alt + Shift + 5 => Split Vertical (kitty & wezterm) => due to deadkeys keyboard
- Ctrl + Alt + Shift + 4 => Split Horizontal (kitty & wezterm) => due to deadkeys keyboard
- Ctrl + Shift + PageUp/PageDown => Scroll Up & Down
- Ctrl + Shift + w => Close Pane
- Ctrl + Shift + Space => Quick Select
- Ctrl + Shift + F => Search
- Ctrl + Shift + P => activate command palette
- Ctrl + 8 => Activate Select Pane (a,s,d)
- Ctrl + 9 => Activate Select pane (1,2,3)
- Ctrl + 0 => Swap with active Pane

## Shortcut in neovim


Non Standard Shortcut

Leader set to `Space`
- vim.g.mapleader = " " ( activate neo-tree, Leader + e)

Set Shortcut for moving inside nvim-tree with Ctrl-j and Ctrl-k to switch between open files
- vim.keymap.set("n", "<C-j>", ":bprev<CR>", { noremap = true, silent = true })
- vim.keymap.set("n", "<C-k>", ":bnext<CR>", { noremap = true, silent = true })

Standard Shortcut

- Ctrl+^ or Ctrl+6 is to cycle between files for :bnext :bprev
- Ctrl-w h — Move to the pane on the left (often Neo-tree)
- Ctrl-w l — Move to the pane on the right
- Ctrl-w j — Move down
- Ctrl-w k — Move up
- Ctrl-w w — Cycle through all open panes (splits)
- Ctrl-w p — Switch to the previous pane
- Ctrl-p, Up, Select the autocomplete up
- Ctrl-n, Down, Select the autocomplete down
- Ctrl-e, Ignore the autocomplete
- Ctrl-y, Accept the autocomplete
