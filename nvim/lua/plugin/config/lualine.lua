return function()

  local colors = {
    rosewater = '#f5e0dc',
    flamingo = '#f2cdcd',
    pink = '#f5c2e7',
    mauve = '#cba6f7',
    red = '#f38ba8',
    maroon = '#eba0ac',
    peach = '#fab387',
    yellow = '#f9e2af',
    green = '#a6e3a1',
    teal = '#94e2d5',
    sky = '#89dceb',
    sapphire = '#74c7ec',
    blue = '#89b4fa',
    lavender = '#b4befe',
    text = '#cdd6f4',
    subtext1 = '#bac2de',
    subtext0 = '#a6adc8',
    overlay2 = '#9399b2',
    overlay1 = '#7f849c',
    overlay0 = '#6c7086',
    surface2 = '#585b70',
    surface1 = '#45475a',
    surface0 = '#313244',
    base = '#1e1e2e',
    mantle = '#181825',
    crust = '#11111b'
  }

  require('lualine').setup({
    options = {
      icons_enabled = true,
      theme = {
        normal = {
          a = { fg = colors.blue, bg = colors.base, gui = 'bold' },
          b = { fg = colors.text, bg = colors.crust },
          c = { fg = colors.text, bg = colors.crust },
        },
        command = {
          a = { fg = colors.peach, bg = colors.base, gui = 'bold' },
        },
        insert = {
          a = { fg = colors.green, bg = colors.base, gui = 'bold' },
        },
        visual = {
          a = { fg = colors.flamingo, bg = colors.base, gui = 'bold' },
        },
        terminal = {
          a = { fg = colors.teal, bg = colors.base, gui = 'bold' },
        },
        replace = {
          a = { fg = colors.red, bg = colors.base, gui = 'bold' },
        },
        inactive = {
          a = { fg = colors.subtext0, bg = colors.crust, gui = 'bold' },
          b = { fg = colors.subtext0, bg = colors.crust },
          c = { fg = colors.subtext0, bg = colors.crust },
        },
      },
      disabled_filetypes = {
        statusline = { 'alpha' }
      },
      component_separators = { left = '', right = '' }, --  , |
      section_separators = { left = '', right = '' }, --  ,  
    },
    sections = {
      lualine_a = {
        'mode',
        {
          'searchcount',
          maxcount = 999,
          timeout = 500,
        },
      },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = {
        {
          'filename',
          file_status = true,
          newfile_status = true,
          path = 3,
        },
      },
      lualine_x = {
        {
          function()
            local buf_ft = vim.api.nvim_get_option_value('filetype', { scope = 'local' })
            local clients = vim.lsp.get_active_clients()
            local lsp_lists = {}
            local available_servers = {}
            if next(clients) == nil then
              return ' 󱚧 ' -- No server available
            end
            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes
              local client_name = client.name
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                -- Avoid adding servers that already exists.
                if not lsp_lists[client_name] then
                  lsp_lists[client_name] = true
                  table.insert(available_servers, client_name)
                end
              end
            end
            return next(available_servers) == nil and ' 󱚧 ' or string.format('%s[%s]', ' 󱜙 ', table.concat(available_servers, ', '))
          end,
          color = { fg = colors.yellow, gui = 'bold' },
        },
        'encoding',
        'fileformat',
        'filetype',
        'progress',
      },
      lualine_y = {},
      lualine_z = { 'location' }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {
      'quickfix',
      'nvim-tree',
      'nvim-dap-ui',
      'toggleterm',
      'fugitive',
    },
  })

end
