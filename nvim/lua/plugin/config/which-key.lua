local icon = {
  ui = require('plugin.util.icon').get('ui'),
  misc = require('plugin.util.icon').get('misc'),
}

return function()
  require('which-key').setup({
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
    icons = {
      breadcrumb = icon.ui.Separator,
      separator = icon.misc.Vbar,
      group = icon.misc.Add,
    },
    window = {
      border = 'rounded',
      position = 'bottom',
      margin = { 1, 0, 1, 0 },
      padding = { 1, 1, 1, 1 },
      winblend = 0,
    },
  })
end
