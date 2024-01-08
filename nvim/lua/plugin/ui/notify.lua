return function()

  local notify = require('notify')
  local icon = {
		diagnostics = require('util.icon').get('diagnostics'),
		ui = require('util.icon').get('ui'),
	}

  require('notify').setup({
    stages = 'fade',
    on_open = function(win)
      vim.api.nvim_set_option_value('winblend', 0, { scope = 'local', win = win })
      vim.api.nvim_win_set_config(win, { zindex = 90 })
    end,
    on_close = nil,
    timeout = 3000,
    fps = 30,
    render = 'default',
    minimum_width = 50,
    level = 'INFO',
    icons = {
      ERROR = icon.diagnostics.Error,
      WARN = icon.diagnostics.Warning,
      INFO = icon.diagnostics.Information,
      DEBUG = icon.ui.Bug,
      TRACE = icon.ui.Pencil,
    },
  })
  vim.notify = notify
end
