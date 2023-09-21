local config = {
  providers = {
    'lsp',
    'treesitter',
    'regex',
  },
  delay = 100,
  filetypes_denylist = {
    'DoomInfo',
    'DressingSelect',
    'NvimTree',
    'Outline',
    'TelescopePrompt',
    'Trouble',
    'alpha',
    'dashboard',
    'dirvish',
    'fugitive',
    'help',
    'lsgsagaoutline',
    'neogitstatus',
    'norg',
    'toggleterm',
  },
  under_cursor = false,
}

return function()
  require('illuminate').configure(config)
end
