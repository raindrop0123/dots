-- @REF: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require('wezterm')

-- Auto-maximized Window
wezterm.on('gui-startup', function()
  local tab, pane, window = wezterm.mux.spawn_window{}
  window:gui_window():maximize()
end)

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Theme
-- config.color_scheme = 'Default Dark (base16)'

-- Font
config.font_size = 14.0
config.font = wezterm.font('Hack Nerd Font', { italic = false })

-- Do not show confirm message when closing window
config.window_close_confirmation = 'NeverPrompt'

-- and finally, return the configuration to wezterm
return config
