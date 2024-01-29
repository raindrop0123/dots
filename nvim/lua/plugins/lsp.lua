return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = 'InsertEnter',
    dependencies = {
      {
        'j-hui/fidget.nvim',
        config = function()
          require('fidget').setup({
            progress = {
              suppress_on_insert = false, -- Suppress new messages while in insert mode
              ignore_done_already = false, -- Ignore new tasks that are already complete
              ignore = { 'null-ls' }, -- List of LSP servers to ignore
              display = {
                render_limit = 5, -- How many LSP messages to show at once
                done_ttl = 2, -- How long a message should persist after completion
                done_icon = '', -- Icon shown when all LSP progress tasks are complete
              },
            },
            notification = {
              override_vim_notify = false, -- Automatically override vim.notify() with Fidget
              window = {
                winblend = 0, -- Background color opacity in the notification window
                zindex = 75, -- Stacking priority of the notification window
              },
            },
          })
        end,
      },
      {
        'williamboman/mason.nvim',
        config = function()
          require('mason').setup({
            ui = {
              border = 'single',
              width = 0.9,
              height = 0.88,
              icons = {
                package_pending = '',
                package_installed = '󰄳',
                package_uninstalled = '󰊠',
              },
              keymaps = {
                toggle_server_expand = '<CR>',
                install_server = 'i',
                update_server = 'u',
                check_server_version = 'c',
                update_all_servers = 'U',
                check_outdated_servers = 'C',
                uninstall_server = 'X',
                cancel_installation = '<C-c>',
              },
            },
          })
        end,
      },
      {
        'williamboman/mason-lspconfig.nvim',
        config = function()
          require('mason-lspconfig').setup({
            ensure_installed = {
              'clangd',
              'lua_ls',
              'pylsp',
              'bashls',
            },
          })
        end,
      },
      {
        'ray-x/lsp_signature.nvim',
        config = function()
          require('lsp_signature').setup({
            bind = true,
            -- TODO: Remove the following line when nvim-cmp#1613 gets resolved
            check_completion_visible = false,
            floating_window = true,
            floating_window_above_cur_line = true,
            hi_parameter = 'Search',
            hint_enable = true,
            transparency = nil, -- disabled by default, allow floating win transparent value 1~100
            wrap = true,
            zindex = 45, -- avoid overlap with nvim.cmp
            handler_opts = { border = 'single' },
          })
        end,
      },
    },
    config = function()
      require('lspconfig.ui.windows').default_options.border = 'single'
      require('lspconfig').clangd.setup({})
      require('lspconfig').bashls.setup({
        cmd = { 'bash-language-server', 'start' },
        filetypes = { 'bash', 'sh' },
      })
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
              disable = { 'different-requires' },
            },
            workspace = {
              library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
              },
              maxPreload = 100000,
              preloadFileSize = 10000,
            },
            format = { enable = false },
            telemetry = { enable = false },
            -- Do not override treesitter lua highlighting with lua_ls's highlighting
            semantic = { enable = false },
          },
        },
      })
      require('lspconfig').pylsp.setup({
        cmd = { 'pylsp' },
        filetypes = { 'python' },
        settings = {
          pylsp = {
            plugins = {
              -- Lint
              ruff = {
                enabled = true,
                select = {
                  -- enable pycodestyle
                  'E',
                  -- enable pyflakes
                  'F',
                },
                ignore = {
                  -- ignore E501 (line too long)
                  -- 'E501',
                  -- ignore F401 (imported but unused)
                  -- 'F401',
                },
                extendSelect = { 'I' },
                severities = {
                  -- Hint, Information, Warning, Error
                  F401 = 'I',
                  E501 = 'I',
                },
              },
              flake8 = { enabled = false },
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              mccabe = { enabled = false },

              -- Code refactor
              rope = { enabled = true },

              -- Formatting
              black = { enabled = true },
              pyls_isort = { enabled = false },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
            },
          },
        },
      })
      vim.api.nvim_command([[LspStart]])
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    lazy = true,
    event = 'LspAttach',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local diagnostic_icon = {
        Error = '󰅚',
        Warn = '󰀪',
        Info = '',
        Hint = '󰌶',
      }
      for type, sidebar_icon in pairs(diagnostic_icon) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = sidebar_icon, texthl = hl })
      end

      require('lspsaga').setup({
        symbol_in_winbar = {
          enable = true,
          hide_keyword = false,
          show_file = true,
          folder_level = 1,
          color_mode = true,
          delay = 100,
        },
        callhierarchy = {
          layout = 'float',
          keys = {
            edit = 'e',
            vsplit = 'v',
            split = 's',
            tabe = 't',
            quit = 'q',
            shuttle = '[]',
            toggle_or_req = 'u',
            close = '<Esc>',
          },
        },
        code_action = {
          num_shortcut = true,
          only_in_cursor = false,
          show_server_name = true,
          extend_gitsigns = false,
          keys = {
            quit = 'q',
            exec = '<CR>',
          },
        },
        diagnostic = {
          show_code_action = true,
          jump_num_shortcut = true,
          max_width = 0.5,
          max_height = 0.6,
          text_hl_follow = true,
          border_follow = true,
          extend_relatedInformation = true,
          show_layout = 'float',
          show_normal_height = 10,
          max_show_width = 0.9,
          max_show_height = 0.6,
          diagnostic_only_current = false,
          keys = {
            exec_action = 'r',
            quit = 'q',
            toggle_or_jump = '<CR>',
            quit_in_show = { 'q', '<Esc>' },
          },
        },
        hover = {
          max_width = 0.5,
          max_height = 0.7,
          open_link = 'gl',
        },
        implement = {
          enable = true,
          sign = true,
          virtual_text = true,
          priority = 100,
        },
        lightbulb = {
          enable = true,
          sign = true,
          virtual_text = true,
          debounce = 10,
          sign_priority = 20,
        },
        rename = {
          in_select = false,
          auto_save = false,
          project_max_width = 0.5,
          project_max_height = 0.5,
          keys = {
            quit = '<C-c>',
            exec = '<CR>',
            select = 'x',
          },
        },
        beacon = {
          enable = true,
          frequency = 8,
        },
        ui = {
          border = 'single',
          devicon = true,
          title = true,
          lines = { '┗', '┣', '┃', '━', '┏' },
          expand = '',
          collapse = '',
          imp_sign = '',
          kind = {
            Class = { '󰠱 ', 'LspKindClass' },
            Constant = { '󰏿 ', 'LspKindConstant' },
            Constructor = { ' ', 'LspKindConstructor' },
            Enum = { ' ', 'LspKindEnum' },
            EnumMember = { ' ', 'LspKindEnumMember' },
            Event = { ' ', 'LspKindEvent' },
            Field = { '󰇽 ', 'LspKindField' },
            File = { '󰈙 ', 'LspKindFile' },
            Function = { '󰊕 ', 'LspKindFunction' },
            Interface = { ' ', 'LspKindInterface' },
            Key = { '󰌋 ', 'LspKindKey' },
            Method = { '󰆧 ', 'LspKindMethod' },
            Module = { ' ', 'LspKindModule' },
            Namespace = { '󰌗 ', 'LspKindNamespace' },
            Number = { ' ', 'LspKindNumber' },
            Operator = { '󰆕 ', 'LspKindOperator' },
            Package = { ' ', 'LspKindPackage' },
            Property = { '󰜢 ', 'LspKindProperty' },
            Struct = { ' ', 'LspKindStruct' },
            TypeParameter = { '󰅲 ', 'LspKindTypeParameter' },
            Variable = { ' ', 'LspKindVariable' },
            Array = { '󰅪 ', 'LspKindArray' },
            Boolean = { ' ', 'LspKindBoolean' },
            Null = { '󰟢 ', 'LspKindNull' },
            Object = { '󰅩 ', 'LspKindObject' },
            String = { '󰉿 ', 'LspKindString' },
            TypeAlias = { ' ', 'LspKindTypeAlias' },
            Parameter = { ' ', 'LspKindParameter' },
            StaticMethod = { ' ', 'LspKindStaticMethod' },
            Macro = { ' ', 'LspKindMacro' },
            Text = { '󰉿 ', 'LspKindText' },
            Snippet = { ' ', 'LspKindSnippet' },
            Folder = { '󰉋 ', 'LspKindFolder' },
            Unit = { ' ', 'LspKindUnit' },
            Value = { '󰎠 ', 'LspKindValue' },
          },
        },
        scroll_preview = {
          scroll_down = '<C-d>',
          scroll_up = '<C-u>',
        },
        request_timeout = 3000,
      })
    end,
  },
}
