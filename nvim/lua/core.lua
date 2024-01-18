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

-- Disable Distribution Plugins
vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu = 1
vim.g.loaded_syntax_completion = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_sql_completion = 1
vim.g.editorconfig = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
-- vim.g.did_load_filetypes = 1
-- vim.g.loaded_remote_plugins = 1

-- Options
vim.o.autoindent = true
vim.o.autoread = true
vim.o.autowrite = true
vim.o.backspace = 'indent,eol,start'
vim.o.backup = false
vim.o.backupskip = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim'
vim.o.breakat = [[\ \	;:,!?]]
vim.o.breakindentopt = 'shift:2,min:20'
vim.o.clipboard = 'unnamedplus'
vim.o.cmdheight = 0
vim.o.cmdwinheight = 1
vim.o.colorcolumn = '80'
vim.o.complete = '.,w,b,k'
vim.o.completeopt = 'menuone,noselect'
vim.o.concealcursor = 'niv'
vim.o.conceallevel = 0
vim.o.cursorcolumn = true
vim.o.cursorline = true
vim.o.diffopt = 'filler,iwhite,internal,linematch:60,algorithm:patience'
vim.o.display = 'lastline'
vim.o.encoding = 'utf-8'
vim.o.equalalways = false
vim.o.errorbells = true
vim.o.expandtab = true
vim.o.fileformats = 'unix,mac,dos'
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.formatoptions = '1jcroql'
vim.o.grepformat = '%f:%l:%c:%m'
vim.o.grepprg = 'rg --hidden --vimgrep --smart-case --'
vim.o.helpheight = 12
vim.o.hidden = true
vim.o.history = 2000
vim.o.ignorecase = true
vim.o.inccommand = 'nosplit'
vim.o.incsearch = true
vim.o.infercase = true
vim.o.jumpoptions = 'stack'
vim.o.laststatus = 2
vim.o.linebreak = true
vim.o.list = true
vim.o.listchars = 'tab:»·,nbsp:+,trail:·,extends:→,precedes:←'
vim.o.magic = true
vim.o.mousescroll = 'ver:3,hor:6'
vim.o.number = true
vim.o.previewheight = 12
vim.o.pumblend = 0
vim.o.pumheight = 12
vim.o.redrawtime = 1500
vim.o.relativenumber = true
vim.o.ruler = true
vim.o.scrolloff = 2
vim.o.sessionoptions = 'buffers,curdir,folds,help,tabpages,winpos,winsize'
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.showbreak = '↳  '
vim.o.showcmd = false
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.sidescrolloff = 5
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitkeep = 'screen'
vim.o.splitright = true
vim.o.startofline = false
vim.o.swapfile = false
vim.o.switchbuf = 'usetab,uselast'
vim.o.synmaxcol = 2500
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.ttimeout = true
vim.o.ttimeoutlen = 300
vim.o.undofile = false
vim.o.updatetime = 200
vim.o.viewoptions = 'folds,cursor,curdir,slash,unix'
vim.o.virtualedit = 'block'
vim.o.visualbell = true
vim.o.whichwrap = 'h,l,<,>,[,],~'
vim.o.wildignore = '.git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**'
vim.o.wildmode = 'list:full'
vim.o.wildignorecase = true
vim.o.winblend = 0
vim.o.winminwidth = 10
vim.o.winwidth = 30
vim.o.wrap = false
vim.o.wrapscan = true
vim.o.writebackup = false

-- Autocmd
-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
  group = vim.api.nvim_create_augroup('last_loc', { clear = true }),
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

-- press <q> to quit
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

-- Builtin Keybindings
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window', remap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window', remap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window', remap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window', remap = true })
vim.keymap.set('n', '<A-[>', '<Cmd>vertical resize -5<CR>', { desc = 'Window Resize -5', remap = true })
vim.keymap.set('n', '<A-]>', '<Cmd>vertical resize +5<CR>', { desc = 'Window Resize +5', remap = true })

-- Colorscheme
vim.api.nvim_command('set background=dark')
vim.api.nvim_command('colorscheme desert')

-- lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = {
  git = {
    log = { '-10' },
    timeout = 300,
    url_format = 'https://github.com/%s.git',
  },
  install = {
    missing = true,
  },
  ui = {
    size = { width = 0.92, height = 0.9 },
    wrap = true,
    border = 'rounded',
    icons = {
      cmd = '',
      config = '',
      event = '',
      ft = '',
      init = '',
      import = '',
      keys = '',
      loaded = '󰄳',
      not_loaded = '󰊠',
      plugin = '',
      runtime = '',
      source = '',
      start = '',
      list = {
        '', '', '', '',
      },
    },
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      paths = {},
      disabled_plugins = {
        'gzip',
        -- 'matchit',
        -- 'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
        'man',
        'editorconfig',
        'health',
        'rplugin',
        'shada',
        'spellfile',
      },
    },
  },
}

require('lazy').setup('plugin', lazy_config)
