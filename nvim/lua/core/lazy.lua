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

local lazy_settings = {
  git = {
    log = { '-10' },
    timeout = 300,
    url_format = 'https://github.com/%s.git',
  },
  install = {
    missing = true,
  },
  ui = {
    size = { width = 0.85, height = 0.7 },
    wrap = true,
    border = 'rounded',
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
        'matchit',
        'matchparen',
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

require('lazy').setup('plugin', lazy_settings)
