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
vim.keymap.set('n', '<leader>fs', '<Cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'Find Current Buffer' })
vim.keymap.set('n', '<leader>ff', '<Cmd>Telescope file_browser<CR>', { desc = 'File Browser' })
vim.keymap.set('n', '<leader>fF', '<Cmd>Telescope find_files<CR>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fc', '<Cmd>Telescope colorscheme<CR>', { desc = 'File Colorsheme' })
vim.keymap.set('n', '<leader>fr', '<Cmd>Telescope frecency<CR>', { desc = 'Frecency' })
vim.keymap.set('n', '<leader>fp', '<Cmd>Telescope project<CR>', { desc = 'Project' })
vim.keymap.set('n', '<leader>fo', '<Cmd>Telescope oldfiles<CR>', { desc = 'Old Files' })
vim.keymap.set('n', '<leader>fw', '<Cmd>Telescope live_grep<CR>', { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fW', '<Cmd>Telescope live_grep_args<CR>', { desc = 'Live Grep Args' })
vim.keymap.set('n', '<leader>fb', '<Cmd>Telescope buffers<CR>', { desc = 'Find Buffers' })

-- mason
vim.keymap.set('n', '<leader>pm', '<Cmd>Mason<CR>', { desc = 'Mason Panel' })

-- hop.nvim
vim.keymap.set('n', '<leader>w', '<Cmd>HopAnywhere<CR>', { desc = 'Hop Anywhere' })
vim.keymap.set('n', '<leader>l', '<Cmd>HopLine<CR>', { desc = 'Hop Line' })

-- lspsaga
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', { desc = 'Hover Document' })
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga peek_definition<CR>', { desc = 'Peek Definition' })
vim.keymap.set('n', 'gD', '<Cmd>Lspsaga goto_definition<CR>', { desc = 'Go to Definition' })
vim.keymap.set('n', 'ga', '<Cmd>Lspsaga code_action<CR>', { desc = 'Code Action' })
vim.keymap.set('n', 'g[', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = 'Jump to previous error' })
vim.keymap.set('n', 'g]', '<Cmd>Lspsaga diagnostic_jump_next<CR>', { desc = 'Jump to next error' })
vim.keymap.set('n', '<leader>lo', '<Cmd>Lspsaga outline<CR>', { desc = 'Code Symbol Outline' })

-- trouble
vim.keymap.set('n', '<leader>pt', '<Cmd>TroubleToggle<CR>', { desc = 'Trouble Window Toggle' })
