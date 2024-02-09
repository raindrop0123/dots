return {
  {
    'akinsho/bufferline.nvim',
    lazy = true,
    event = 'VeryLazy',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Tree',
            text_align = 'center',
            padding = 0,
          },
        },
      },
      highlights = {
        buffer_selected = { italic = false },
        diagnostic_selected = { italic = false },
        hint_selected = { italic = false },
        pick_selected = { italic = false },
        pick_visible = { italic = false },
        pick = { italic = false },
      },
    },
  },
  {
    'rcarriga/nvim-notify',
    lazy = true,
    event = 'VeryLazy',
    opts = {
      stages = 'static',
      timeout = 4000,
      fps = 20,
    },
    init = function()
      vim.notify = require('notify')
    end,
  },
  {
    'folke/paint.nvim',
    lazy = true,
    event = 'VeryLazy',
    opts = {
      highlights = {
        {
          -- filter can be a table of buffer options that should match,
          -- or a function called with buf as param that should return true.
          -- The example below will paint @something in comments with Constant
          filter = { filetype = 'lua' },
          pattern = '%s*%-%-%-%s*(@%w+)',
          hl = 'Constant',
        },
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        globalstatus = true,
        disabled_filetypes = {
          statusline = { 'alpha', 'dashboard', 'starter' }
        },
        component_separators = { left = '', right = '' }, -- , , │, , , , 
        section_separators = { left = '', right = '' }, -- , , , 
      },
      sections = {
        lualine_a = {
          {
            'mode',
            icon = '',
          },
        },
        lualine_c = {
          {
            'filename',
          },
          {
            function()
              return '%='
            end,
          },
          {
            function()
              local buf_ft = vim.api.nvim_get_option_value('filetype', { scope = 'local' })
              local clients = vim.lsp.get_active_clients()
              local lsp_lists = {}
              local available_servers = {}
              if next(clients) == nil then
                return '󱚧'
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
              return next(available_servers) == nil and '󱚧' or string.format('%s [%s]', '󱜙', table.concat(available_servers, ', '))
            end,
          },
        },
      },
      extensions = {
        'quickfix',
        'nvim-tree',
        'nvim-dap-ui',
        'toggleterm',
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    event = 'VeryLazy',
    main = 'ibl',
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      exclude = {
        filetypes = {
          '', -- for all buffers without a file type
          'big_file_disabled_ft',
          'dashboard',
          'git',
          'gitcommit',
          'help',
          'json',
          'log',
          'markdown',
          'NvimTree',
          'vimwiki',
        },
      },
    },
  },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = function()
      local logo = [[
      ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
      ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
      ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
      ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ 
      ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
      ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
      ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
      ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   
      ░    ░  ░    ░ ░        ░   ░         ░   
      ░                  
      ]]
      logo = string.rep('\n', 8) .. logo .. '\n\n\n'

      local opt = {
        theme = 'doom',
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, '\n'),
          -- stylua: ignore
          center = {
            { action = 'FzfLua files', desc = ' Find file', icon = ' ', key = 'space f f' },
            { action = 'FzfLua live_grep', desc = ' Find text', icon = ' ', key = 'space f w' },
            { action = 'FzfLua colorschemes', desc = ' Find colorscheme', icon = ' ', key = 'space f c' },
            { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'space t l' },
            { action = 'ene | startinsert', desc = ' New file', icon = ' ', key = 'n' },
            { action = 'qa', desc = ' Quit', icon = ' ', key = 'q' },
          },
          footer = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
          end,
        },
      }

      for _, button in ipairs(opt.config.center) do
        button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
        button.key_format = '  %s'
      end

      if vim.o.filetype == 'lazy' then
        vim.cmd.close()
        vim.api.nvim_create_autocmd('User', {
          pattern = 'DashboardLoaded',
          callback = function()
            require('lazy').show()
          end,
        })
      end

      return opt
    end,
  }
}
