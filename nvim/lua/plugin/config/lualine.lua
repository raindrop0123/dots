return function()
  require('lualine').setup({
    options = {
      icons_enabled = true,
      disabled_filetypes = {
        statusline = {
          'alpha',
          'NvimTree',
          'sagaoutline',
        }
      },
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = '' },
    },
  })
end
