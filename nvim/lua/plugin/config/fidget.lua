return function()
  require('fidget').setup({
    progress = {
      suppress_on_insert = false,
      ignore_done_already = false,
      ignore = { 'null-ls' },
      display = {
        render_limit = 5,
        done_ttl = 2,
      },
    },
    notification = {
      override_vim_notify = false,
      window = {
        winblend = 0,
        zindex = 75,
      },
    },
  })
end
