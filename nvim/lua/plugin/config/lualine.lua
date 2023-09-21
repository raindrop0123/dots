local config = {
  options = {
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    theme = 'auto',
  },
}

return function()
  require('lualine').setup(config)
end
