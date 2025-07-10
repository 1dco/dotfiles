-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action
-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 12
-- config.color_scheme = 'Tartan'
config.color_scheme = 'Wez'
-- config.color_scheme = 'Tango'
config.window_background_opacity = 0.85  -- 0.0 is fully transparent, 1.0 is fully opaque
config.font = wezterm.font 'CaskaydiaCove Nerd Font'

-- Detect the OS using wezterm.target_triple
local target = wezterm.target_triple

if target:find("windows") then
  -- Windows: Launch WSL with your desired options
  config.default_prog = {
    'C:\\WINDOWS\\system32\\wsl.exe',
    '--distribution',
    'archLinux',
    '--cd',
    '~'}
end
config.scrollback_lines = 10000
config.enable_scroll_bar = true

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#0b0022'
    local background = '#1b1032'
    local foreground = '#808080'

    if tab.is_active then
      background = '#2b2042'
      foreground = '#c0c0c0'
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    local edge_foreground = background

    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.use_dead_keys = true
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = '!',
    mods = 'LEADER | SHIFT',
    action = wezterm.action_callback(function(win, pane)
      local tab, window = pane:move_to_new_window()
    end),
  },
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  { key = 'PageUp', mods = 'CTRL|SHIFT', action = act.ScrollByPage(-1) },
  { key = 'PageDown', mods = 'CTRL|SHIFT', action = act.ScrollByPage(1) },
}
-- Finally, return the configuration to wezterm:
return config
