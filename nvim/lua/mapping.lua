-- {{{ Builtin }}}
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window', remap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window', remap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window', remap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window', remap = true })
vim.keymap.set('n', '<A-[>', '<Cmd>vertical resize -5<CR>', { desc = 'Window Resize -5', remap = true })
vim.keymap.set('n', '<A-]>', '<Cmd>vertical resize +5<CR>', { desc = 'Window Resize +5', remap = true })

-- {{{ lazy.nvim }}}
vim.keymap.set('n', '<leader>tl', '<Cmd>Lazy<CR>', { desc = 'Toggle: Lazy' })

-- {{{ nvim-tree.lua }}}
vim.keymap.set('n', '<leader>tn', '<Cmd>NvimTreeToggle<CR>', { desc = 'Toggle: Nvim-Tree' })

-- {{{ fzf-lua }}}
vim.keymap.set('n', '<C-p>', '<Cmd>FzfLua<CR>', { desc = 'FzfLua' })
vim.keymap.set('n', '<leader><leader>', '<Cmd>FzfLua commands<CR>', { desc = 'Find: commands' })
vim.keymap.set('n', '<leader>fs', '<Cmd>FzfLua lines<CR>', { desc = 'Find: lines' })
vim.keymap.set('n', '<leader>ff', '<Cmd>FzfLua files<CR>', { desc = 'Find: files' })
vim.keymap.set('n', '<leader>fc', '<Cmd>FzfLua colorschemes<CR>', { desc = 'Find: colorsheme' })
vim.keymap.set('n', '<leader>fw', '<Cmd>FzfLua live_grep<CR>', { desc = 'Find: Live Grep' })

-- {{{ toggleterm.nvim }}}
vim.keymap.set('t', '<leader>tt', [[<C-\><C-n>]], { desc = 'Back to Normal in Term' })
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { desc = 'Back to Normal in Term' })
vim.keymap.set('n', '<leader>th', '<Cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Toggle: Horizontal Term' })
vim.keymap.set('n', '<leader>tv', '<Cmd>ToggleTerm direction=vertical<CR>', { desc = 'Toggle: Vertical Term' })
vim.keymap.set('n', '<leader>tf', '<Cmd>ToggleTerm direction=float<CR>', { desc = 'Toggle: Float Term' })

-- {{{ flash.nvim }}}
vim.keymap.set('n', 's', function() require("flash").jump() end, { desc = 'Flash' })
vim.keymap.set('n', 'S', function() require("flash").remote() end, { desc = 'Flash' })

-- {{{ todo-comments.nvim }}}
vim.keymap.set('n', '<leader>tc', '<Cmd>TodoTrouble<CR>', { desc = 'Toggle: TodoTrouble' })

-- {{{ mason.nvim }}}
vim.keymap.set('n', '<leader>tm', '<Cmd>Mason<CR>', { desc = 'Toggle: Mason' })

-- {{{ trouble.nvim }}}
vim.keymap.set('n', '<leader>tT', '<Cmd>TroubleToggle<CR>', { desc = 'Toggle: Trouble' })

-- {{{ lspsaga.nvim }}}
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', { desc = 'LSP: Hover Document' })
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga peek_definition<CR>', { desc = 'LSP: Peek Definition' })
vim.keymap.set('n', 'gD', '<Cmd>Lspsaga goto_definition<CR>', { desc = 'LSP: Go to Definition' })
vim.keymap.set('n', 'ga', '<Cmd>Lspsaga code_action<CR>', { desc = 'LSP: Code Action' })
vim.keymap.set('n', 'g[', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = 'LSP: Jump to previous error' })
vim.keymap.set('n', 'g]', '<Cmd>Lspsaga diagnostic_jump_next<CR>', { desc = 'LSP: Jump to next error' })
vim.keymap.set('n', '<leader>lo', '<Cmd>Lspsaga outline<CR>', { desc = 'LSP: Code Symbol Outline' })
vim.keymap.set('n', '<leader>la', '<Cmd>Lspsaga code_action<CR>', { desc = 'LSP: Code Action' })

-- {{{ DAP }}}
vim.keymap.set('n', '<F5>', [[<Cmd>lua require('dapui').toggle()<CR>]], { desc = 'Debug: DAP UI' })
vim.keymap.set('n', '<leader>db', [[<Cmd>lua require('dap').toggle_breakpoint()<CR>]], { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dc', [[<Cmd>lua require('dap').continue()<CR>]], { desc = 'Debug: Run/Continue' })
vim.keymap.set('n', '<leader>dt', [[<Cmd>lua require('dap').terminate()<CR>]], { desc = 'Debug: Terminate' })
vim.keymap.set('n', '<leader>dr', [[<Cmd>lua require('dap').run_to_cursor()<CR>]], { desc = 'Debug: Run to Cursor' })
