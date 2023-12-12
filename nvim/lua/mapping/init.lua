-- Builtin
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window', remap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window', remap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window', remap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window', remap = true })
vim.keymap.set('n', '<A-[>', '<Cmd>vertical resize -5<CR>', { desc = 'Window Resize -5', remap = true })
vim.keymap.set('n', '<A-]>', '<Cmd>vertical resize +5<CR>', { desc = 'Window Resize +5', remap = true })

-- Lazy
vim.keymap.set('n', '<leader>pl', '<Cmd>Lazy<CR>', { desc = 'Lazy Panel' })

-- NvimTree
vim.keymap.set('n', '<leader>pn', '<Cmd>NvimTreeToggle<CR>', { desc = 'Nvim Tree' })

-- nvim-notify
vim.keymap.set('n', '<leader>pN', '<Cmd>Notifications<CR>', { desc = 'Nvim Notify' })

-- ToggleTerm
vim.keymap.set('t', '<leader>tt', [[<C-\><C-n>]], { desc = 'Back to Normal in Term' })
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { desc = 'Back to Normal in Term' })
vim.keymap.set('n', '<leader>th', '<Cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Horizontal Term' })
vim.keymap.set('n', '<leader>tv', '<Cmd>ToggleTerm direction=vertical<CR>', { desc = 'Vertical Term' })
vim.keymap.set('n', '<leader>tf', '<Cmd>ToggleTerm direction=float<CR>', { desc = 'Float Term' })

-- Telescope
vim.keymap.set('n', '<leader>fs', '<Cmd>Telescope current_buffer_fuzzy_find theme=ivy<CR>', { desc = 'Find Current Buffer' })
vim.keymap.set('n', '<leader>ff', '<Cmd>Telescope file_browser theme=ivy<CR>', { desc = 'File Browser' })
vim.keymap.set('n', '<leader>fF', '<Cmd>Telescope find_files theme=ivy<CR>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fc', '<Cmd>Telescope colorscheme theme=ivy<CR>', { desc = 'File Colorsheme' })
vim.keymap.set('n', '<leader>fr', '<Cmd>Telescope frecency theme=ivy<CR>', { desc = 'Frecency' })
vim.keymap.set('n', '<leader>fp', '<Cmd>Telescope project theme=ivy<CR>', { desc = 'Project' })
vim.keymap.set('n', '<leader>fo', '<Cmd>Telescope oldfiles theme=ivy<CR>', { desc = 'Old Files' })
vim.keymap.set('n', '<leader>fw', '<Cmd>Telescope live_grep theme=ivy<CR>', { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fW', '<Cmd>Telescope live_grep_args theme=ivy<CR>', { desc = 'Live Grep Args' })
vim.keymap.set('n', '<leader>fb', '<Cmd>Telescope buffers theme=ivy<CR>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>fn', '<Cmd>Telescope notify theme=ivy<CR>', { desc = 'Notifications' })
vim.keymap.set('n', '<leader><leader>', '<Cmd>Telescope commands theme=ivy<CR>', { desc = 'Commands' })

-- mason
vim.keymap.set('n', '<leader>pm', '<Cmd>Mason<CR>', { desc = 'Mason Panel' })

-- hop.nvim
vim.keymap.set('n', '<leader>W', '<Cmd>HopAnywhere<CR>', { desc = 'Hop Anywhere' })
vim.keymap.set('n', '<leader>L', '<Cmd>HopLine<CR>', { desc = 'Hop Line' })

-- lspsaga
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', { desc = 'Hover Document' })
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga peek_definition<CR>', { desc = 'Peek Definition' })
vim.keymap.set('n', 'gD', '<Cmd>Lspsaga goto_definition<CR>', { desc = 'Go to Definition' })
vim.keymap.set('n', 'ga', '<Cmd>Lspsaga code_action<CR>', { desc = 'Code Action' })
vim.keymap.set('n', 'g[', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = 'Jump to previous error' })
vim.keymap.set('n', 'g]', '<Cmd>Lspsaga diagnostic_jump_next<CR>', { desc = 'Jump to next error' })
vim.keymap.set('n', '<leader>lo', '<Cmd>Lspsaga outline<CR>', { desc = 'Code Symbol Outline' })
vim.keymap.set('n', '<leader>la', '<Cmd>Lspsaga code_action<CR>', { desc = 'Code Action' })

-- trouble
vim.keymap.set('n', '<leader>pt', '<Cmd>TroubleToggle<CR>', { desc = 'Trouble Window Toggle' })
