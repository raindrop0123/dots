return function()
  require('bigfile').setup({
    filesize = 1,
    pattern = { '*' },
    features = {
      'indent_blankline',
      'lsp',
      'illuminate',
      'treesitter',
      'syntax',
      'vimopts',
    },
  })
end
