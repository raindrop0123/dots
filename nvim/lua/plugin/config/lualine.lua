local config = {
  options = {
    component_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {
        'alpha',
        'NvimTree',
        'sagaoutline',
      },
    },
    section_separators = { left = '', right = '' },
    theme = 'auto',
  },
}

return function()
  require('lualine').setup(config)
end
