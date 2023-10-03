local config = {
  char = '│',
  context_char = '┃',
  show_first_indent_level = true,
  filetype_exclude = {
    '', -- for all buffers without a file type
    'alpha',
    'dashboard',
    'fugitive',
    'git',
    'gitcommit',
    'help',
    'NvimTree',
    'TelescopePrompt',
    'undotree',
  },
  buftype_exclude = { 'terminal', 'nofile' },
  show_current_context = true,
  space_char_blankline = ' ',
}

return function()
  require('ibl').setup(config)
end
