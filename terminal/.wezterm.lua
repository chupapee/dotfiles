local wezterm = require "wezterm"

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

  font = wezterm.font 'Fira Code',
  font_size = 12.0,

  default_cursor_style = 'BlinkingBlock',
  cursor_blink_ease_in = 'Constant',
  cursor_blink_rate = 700,
  cursor_blink_ease_out = 'Constant',

  color_scheme = 'Horizon Dark (base16)'
}
