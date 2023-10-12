local wezterm = require('wezterm')

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Theme
config.color_scheme = 'Catppuccin Mocha'

-- Font
config.font_size = 12.0
config.font = wezterm.font('Noto Sans Mono', { italic = false })

-- Do not show confirm message when closing window
config.window_close_confirmation = 'AlwaysPrompt'

-- and finally, return the configuration to wezterm
return config
