local config = {
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
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
}

return function()
  require('which-key').setup(config)
end
