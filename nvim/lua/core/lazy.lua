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

local icon = {
  kind = require('plugin.util.icon').get('kind'),
  documents = require('plugin.util.icon').get('documents'),
  ui = require('plugin.util.icon').get('ui'),
  ui_sep = require('plugin.util.icon').get('ui', true),
  misc = require('plugin.util.icon').get('misc'),
}

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
    size = { width = 0.7, height = 0.65 },
    wrap = true,
    border = 'single',
    icons = {
      cmd = icon.misc.Code,
      config = icon.ui.Gear,
      event = icon.kind.Event,
      ft = icon.documents.Files,
      init = icon.misc.ManUp,
      import = icon.documents.Import,
      keys = icon.ui.Keyboard,
      loaded = icon.ui.Check,
      not_loaded = icon.misc.Ghost,
      plugin = icon.ui.Package,
      runtime = icon.misc.Vim,
      source = icon.kind.StaticMethod,
      start = icon.ui.Play,
      list = {
        icon.ui_sep.BigCircle,
        icon.ui_sep.BigUnfilledCircle,
        icon.ui_sep.Square,
        icon.ui_sep.ChevronRight,
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
