local wezterm = require "wezterm"

function scheme_for_appearance(appearance)
  if appearance:find 'Light' then
    return 'Alabaster'
  else
    return 'Horizon Dark (base16)'
  end
end

function query_appearance_gnome()
  local success, stdout = wezterm.run_child_process {
    'gsettings',
    'get',
    'org.gnome.desktop.interface',
    'gtk-theme',
  }
  if stdout:find 'dark' then
    return 'Dark'
  end
  return 'Light'
end

wezterm.on('window-config-reloaded', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = query_appearance_gnome()
  local scheme = scheme_for_appearance(appearance)
  if overrides.color_scheme ~= scheme then
    overrides.color_scheme = scheme
    window:set_config_overrides(overrides)
  end
end)

return {
  enable_tab_bar = false,
  window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
  },
  default_prog = { "/usr/bin/zsh" },
  scrollback_lines = 1000,
  check_for_updates = false,

  font = wezterm.font 'Fira Code',
  font_size = 12.0,

  default_cursor_style = 'BlinkingBlock',
  cursor_blink_ease_in = 'Constant',
  cursor_blink_rate = 700,
  cursor_blink_ease_out = 'Constant',
  window_close_confirmation = "NeverPrompt",

  unix_domains = {
    {
        name = "unix",
    },
  },
  keys = {
    {
      key = "p",
      mods = "SUPER",
      action = wezterm.action.ActivateCommandPalette,
    },
    {
      key = 'L',
      mods = 'CTRL',
      action = wezterm.action.ShowDebugOverlay
    },
    -- create pane
    {
      key = "LeftArrow",
      mods = "ALT|CTRL",
      action = wezterm.action.SplitPane({
          top_level = true,
          direction = "Left",
          size = { Percent = 50 },
      }),
    },
    {
      key = "RightArrow",
      mods = "ALT|CTRL",
      action = wezterm.action.SplitPane({
          top_level = true,
          direction = "Right",
          size = { Percent = 50 },
      }),
    },
    {
      key = "UpArrow",
      mods = "ALT|CTRL",
      action = wezterm.action.SplitPane({
          top_level = true,
          direction = "Up",
          size = { Percent = 50 },
      }),
    },
    {
      key = "DownArrow",
      mods = "ALT|CTRL",
      action = wezterm.action.SplitPane({
          top_level = true,
          direction = "Down",
          size = { Percent = 50 },
      }),
    },
    -- switch between panes
    {
      key = "LeftArrow",
      mods = "ALT",
      action = wezterm.action({ ActivatePaneDirection = "Left" }),
    },
    {
      key = "RightArrow",
      mods = "ALT",
      action = wezterm.action({ ActivatePaneDirection = "Right" }),
    },
    {
      key = "UpArrow",
      mods = "ALT",
      action = wezterm.action({ ActivatePaneDirection = "Up" }),
    },
    {
      key = "DownArrow",
      mods = "ALT",
      action = wezterm.action({ ActivatePaneDirection = "Down" }),
    },
  }
}
