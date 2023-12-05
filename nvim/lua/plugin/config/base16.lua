return function()
  require('base16-colorscheme').with_config({
    telescope = true,
    indentblankline = true,
    notify = true,
    ts_rainbow = true,
    cmp = true,
    illuminate = true,
  })
  vim.api.nvim_command('colorscheme base16-default-dark')
end
