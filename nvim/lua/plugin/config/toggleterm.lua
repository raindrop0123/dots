local config = {
  size = function(term)
    if term.direction == 'horizontal' then
      return 15
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.40
    end
  end,
  highlights = {
    Normal = {
      link = 'Normal',
    },
    NormalFloat = {
      link = 'NormalFloat',
    },
    FloatBorder = {
      link = 'FloatBorder',
    },
  },
  direction = 'float',
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
  },
}

return function()
  require('toggleterm').setup(config)
end
