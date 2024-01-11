return function()
  require('illuminate').configure({
    providers = {
      'regex',
      'treesitter',
      'lsp',
    },
    delay = 500,
    filetypes_denylist = {
      'DoomInfo',
      'DressingSelect',
      'NvimTree',
      'TelescopePrompt',
      'Trouble',
      'aerial',
      'alpha',
      'dashboard',
      'dirvish',
      'fugitive',
      'help',
      'neogitstatus',
      'norg',
      'toggleterm',
    },
    under_cursor = false,
  })
end
