-- Pull in the wezterm API
local wezterm = require("wezterm")

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
config.color_scheme = "Wez"
-- config.color_scheme = 'Tango'
config.window_background_opacity = 0.85 -- 0.0 is fully transparent, 1.0 is fully opaque
config.text_background_opacity = 0.85 -- 0.0 is fully transparent, 1.0 is fully opaque
config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.use_fancy_tab_bar = false
-- Detect the OS using wezterm.target_triple
local target = wezterm.target_triple

if target:find("windows") then
  -- Windows: Launch WSL with your desired options
  config.font_size = 13
  config.default_prog = {
    "C:\\WINDOWS\\system32\\wsl.exe",
    "--distribution",
    "archLinux",
    "--cd",
    "~",
  }
elseif target:find("apple") then
  config.font_size = 16
elseif target:find("linux") then
  config.font_size = 14
  config.enable_wayland = false
end

config.scrollback_lines = 10000
config.enable_scroll_bar = true
config.show_tab_index_in_tab_bar = true

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

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local tab_index = tab.tab_index + 1
  local title = string.format("%d: %s", tab_index, tab_title(tab))
  if tab.is_active then
    return {
      { Background = { Color = "#2b2042" } },
      { Foreground = { Color = "#c0c0c0" } },
      { Text = " " .. title .. " " },
    }
  elseif tab.is_last_active then
    -- Green color and append '*' to previously active tab.
    return {
      { Background = { Color = "#1b1032" } },
      { Foreground = { Color = "#808080" } },
      { Text = " " .. title .. "*" },
    }
  end
  return title
end)

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

-- enable kitty image support

config.enable_kitty_graphics = true

config.use_dead_keys = true
config.leader = { key = "a", mods = "CTRL|SHIFT", timeout_milliseconds = 1000 }
config.keys = {
  {
    key = "!",
    mods = "LEADER | SHIFT",
    action = wezterm.action_callback(function(win, pane)
      local tab, window = pane:move_to_new_window()
    end),
  },
  {
    key = "w",
    mods = "CTRL|SHIFT",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  { key = "PageUp", mods = "CTRL|SHIFT", action = act.ScrollByPage(-1) },
  { key = "PageDown", mods = "CTRL|SHIFT", action = act.ScrollByPage(1) },
  {
    key = "$",
    mods = "CTRL|ALT|SHIFT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
}

-- nvim configuration taken from https://github.com/folke/zen-mode.nvim

wezterm.on("user-var-changed", function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
    local incremental = value:find("+")
    local number_value = tonumber(value)
    if incremental ~= nil then
      while number_value > 0 do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end
      overrides.enable_tab_bar = false
    elseif number_value < 0 then
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
      overrides.enable_tab_bar = true
    else
      overrides.font_size = number_value
      overrides.enable_tab_bar = false
    end
  end
  window:set_config_overrides(overrides)
end)

-- Finally, return the configuration to wezterm:
return config
