-- Leader & Local Leader Key
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Load configurations
require('core.autocmd')
require('core.disable')
require('core.clipboard')
require('core.option')
require('core.lazy')
require('core.mapping')

-- Set background & colorscheme
vim.api.nvim_command('set background=dark')
-- vim.api.nvim_command('colorscheme desert')
