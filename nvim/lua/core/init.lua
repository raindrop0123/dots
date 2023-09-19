local global = require('core.global')

-- Clipboard
if global.is_mac then
  vim.g.clipboard = {
    name = 'macOS-clipboard',
    copy = { ['+'] = 'pbcopy', ['*'] = 'pbcopy' },
    paste = { ['+'] = 'pbpaste', ['*'] = 'pbpaste' },
    cache_enabled = 0,
  }
elseif global.is_wsl then
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

-- Disabled built-in plugin
vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu = 1
-- vim.g.did_load_filetypes = 1
vim.g.loaded_syntax_completion = 1
vim.g.loaded_spellfile_plugin = 1
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwFileHandlers = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrwSettings = 1
vim.g.netrw_liststyle = 3
vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_sql_completion = 1
vim.g.editorconfig = 1
-- vim.g.loaded_remote_plugins = 1


-- GUI setup
vim.api.nvim_set_option_value("guifont", "JetBrainsMono Nerd Font:h15", {})
vim.g.neovide_refresh_rate = 120
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_no_idle = true
vim.g.neovide_cursor_animation_length = 0.03
vim.g.neovide_cursor_trail_length = 0.05
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_vfx_opacity = 200.0
vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
vim.g.neovide_cursor_vfx_particle_speed = 20.0
vim.g.neovide_cursor_vfx_particle_density = 5.0

-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- load configurations
require('core.lazy')
require('core.autocmd')
require('core.option')
require('core.mapping')
require('plugin.util.mapping')

-- set background and colorscheme
vim.api.nvim_command('set background=dark')
vim.api.nvim_command('colorscheme catppuccin')
