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
    window = {
      border = 'rounded',
      position = 'bottom',
      margin = { 0, 0, 0, 0 },
      padding = { 1, 1, 1, 1 },
      winblend = 0,
    },
  })
end
