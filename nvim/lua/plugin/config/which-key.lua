local icon = {
  ui = require('plugin.util.icon').get('ui'),
  misc = require('plugin.util.icon').get('misc'),
}

local config = {
  icons = {
    breadcrumb = icon.ui.Separator,
    separator = icon.misc.Vbar,
    group = icon.misc.Add,
  },
  plugins = {
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = true,
      g = true,
    },
  },
  window = {
    border = 'single',
    position = 'bottom',
    margin = { 0, 0, 0, 0 },
    padding = { 0, 0, 0, 0 },
    winblend = 0,
  },
}

return function()
  require('which-key').setup(config)
end
