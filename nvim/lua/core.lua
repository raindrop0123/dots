-- Clipboard
if vim.loop.os_uname().sysname == 'Darwin' then
  vim.g.clipboard = {
    name = 'macOS-clipboard',
    copy = { ['+'] = 'pbcopy', ['*'] = 'pbcopy' },
    paste = { ['+'] = 'pbpaste', ['*'] = 'pbpaste' },
    cache_enabled = 0,
  }
elseif vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = 'win32yank-wsl',
    copy = {
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
      ['+'] = 'win32yank.exe -o --lf',
      ['*'] = 'win32yank.exe -o --lf',
    },
    cache_enabled = 0,
  }
end

-- Disable Distributed Plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logipat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_syntax_completion = 1
vim.g.loaded_sql_completion = 1
-- vim.g.loaded_remote_plugins = 1
vim.g.editorconfig = 1
-- vim.g.did_load_filetypes = 1
vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu = 1

-- Option
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.backup = false
vim.opt.backupskip = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim'
vim.opt.breakat = [[\ \	;:,!?]]
vim.opt.breakindentopt = 'shift:2,min:20'
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 0
vim.opt.cmdwinheight = 1
vim.opt.colorcolumn = '80'
vim.opt.complete = '.,w,b,k'
vim.opt.completeopt = 'menuone,noselect'
vim.opt.concealcursor = 'niv'
vim.opt.conceallevel = 0
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.diffopt = 'filler,iwhite,internal,linematch:60,algorithm:patience'
vim.opt.display = 'lastline'
vim.opt.encoding = 'utf-8'
vim.opt.equalalways = false
vim.opt.errorbells = true
vim.opt.expandtab = true
vim.opt.fileformats = 'unix,mac,dos'
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99
vim.opt.formatoptions = '1jcroql'
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --hidden --vimgrep --smart-case --'
vim.opt.helpheight = 12
vim.opt.hidden = true
vim.opt.history = 2000
vim.opt.ignorecase = true
vim.opt.inccommand = 'nosplit'
vim.opt.incsearch = true
vim.opt.infercase = true
vim.opt.jumpoptions = 'stack'
vim.opt.laststatus = 2
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
vim.opt.magic = true
vim.opt.mousescroll = 'ver:3,hor:6'
vim.opt.number = true
vim.opt.previewheight = 12
vim.opt.pumblend = 0
vim.opt.pumheight = 12
vim.opt.redrawtime = 1500
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.scrolloff = 2
vim.opt.sessionoptions = 'buffers,curdir,folds,help,tabpages,winpos,winsize'
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.showbreak = '↳  '
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitkeep = 'screen'
vim.opt.splitright = true
vim.opt.startofline = false
vim.opt.swapfile = false
vim.opt.switchbuf = 'usetab,uselast'
vim.opt.synmaxcol = 2500
vim.opt.tabstop = 2
vim.opt.termguicolors = false -- Do not suuport for Apple Terminal
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 300
vim.opt.undofile = false
vim.opt.updatetime = 200
vim.opt.viewoptions = 'folds,cursor,curdir,slash,unix'
vim.opt.virtualedit = 'block'
vim.opt.visualbell = true
vim.opt.whichwrap = 'h,l,<,>,[,],~'
vim.opt.wildignore = '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**'
vim.opt.wildmode = 'list:full'
vim.opt.wildignorecase = true
vim.opt.winblend = 0
vim.opt.winminwidth = 10
vim.opt.winwidth = 30
vim.opt.wrap = false
vim.opt.wrapscan = true
vim.opt.writebackup = false

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
  group = vim.api.nvim_create_augroup('last_location', { clear = true }),
  callback = function()
    local exclude = { 'gitcommit' }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('wrap_spell', { clear = true }),
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- press 'q' to quit
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('close_with_q', { clear = true }),
  pattern = {
    'PlenaryTestPopup',
    'help',
    'lspinfo',
    'man',
    'notify',
    'qf',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'neotest-output',
    'checkhealth',
    'neotest-summary',
    'neotest-output-panel',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- Disable auto-comment when going to the next line
vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('disable_auto_comment', { clear = true }),
  callback = function()
    local current_buf = vim.api.nvim_get_current_buf()
    local formatoptions = vim.api.nvim_buf_get_option(current_buf, 'formatoptions')
    formatoptions = formatoptions:gsub('[cro]', '')
    vim.api.nvim_buf_set_option(current_buf, 'formatoptions', formatoptions)
  end,
})

-- keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {})
vim.api.nvim_set_keymap('n', '<A-[>', '<Cmd>vertical resize -5<CR>', {})
vim.api.nvim_set_keymap('n', '<A-]>', '<Cmd>vertical resize +5<CR>', {})

-- colorscheme
vim.api.nvim_command('set background=dark')
vim.api.nvim_command('colorscheme lunaperche')

-- lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },
  ui = {
    border = 'single',
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'gzip',
        'zip',
        'zipPlugin',
        'tar',
        'tarPlugin',
        'getscript',
        'getscriptPlugin',
        'vimball',
        'vimballPlugin',
        'tohtml',
        'logipat',
        'rrhelper',
        'spellfile',
        'matchit',
        'matchparen',
        'tutor',
        'man',
        'editorconfig',
        'health',
        'rplugin',
        'shada',
      },
    },
  },
})
