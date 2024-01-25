return {
  {
    'folke/trouble.nvim',
    lazy = true,
    cmd = { 'Trouble', 'TroubleToggle', 'TroubleRefresh' },
    config = function()
      require('trouble').setup({
        position = 'bottom',
        height = 20,
        width = 50,
        icons = true,
        mode = 'document_diagnostics',
        group = true,
        padding = true,
        action_keys = {
          close = 'q',
          cancel = '<Esc>',
          refresh = 'r',
          jump = { '<CR>', '<TAB>' },
          open_split = { '<C-x>' },
          open_vsplit = { '<C-v>' },
          open_tab = { '<C-t>' },
          jump_close = { 'o' },
          toggle_mode = 'm',
          toggle_preview = 'P',
          hover = 'K',
          preview = 'p',
          close_folds = { 'zM', 'zm' },
          open_folds = { 'zR', 'zr' },
          toggle_fold = { 'zA', 'za' },
          previous = 'k',
          next = 'j',
        },
        indent_lines = true,
        auto_open = false,
        auto_close = false,
        auto_preview = true,
        auto_fold = false,
        auto_jump = { 'lsp_definitions' },
        signs = {
          other = '',
        },
        use_diagnostic_signs = false,
      })
    end,
  },
  {
    'folke/which-key.nvim',
    lazy = true,
    event = 'VeryLazy',
    config = function()
      require('which-key').setup({
        plugins = {
          presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = true,
            g = true,
          },
        },
        icons = {
          breadcrumb = '',
          separator = '│',
          group = '+',
        },
        window = {
          border = 'single',
          position = 'bottom',
          margin = { 1, 0, 1, 0 },
          padding = { 1, 1, 1, 1 },
          winblend = 0,
        },
      })
    end,
  },
  {
    'sindrets/diffview.nvim',
    lazy = true,
    cmd = { 'DiffviewOpen', 'DiffviewClose' },
    config = true,
  },
  {
    'nvim-tree/nvim-tree.lua',
    cmd = {
      'NvimTreeToggle',
      'NvimTreeOpen',
      'NvimTreeFindFile',
      'NvimTreeFindFileToggle',
      'NvimTreeRefresh'
    },
    config = function()
      require('nvim-tree').setup({
        auto_reload_on_write = true,
        create_in_closed_folder = false,
        disable_netrw = true,
        hijack_cursor = true,
        hijack_netrw = false,
        hijack_unnamed_buffer_when_opening = true,
        open_on_tab = false,
        respect_buf_cwd = false,
        sort_by = 'name',
        sync_root_with_cwd = true,
        view = {
          adaptive_size = false,
          centralize_selection = false,
          width = 30,
          side = 'left',
          preserve_window_proportions = false,
          number = false,
          relativenumber = false,
          signcolumn = 'yes',
          float = {
            enable = false,
            open_win_config = {
              relative = 'editor',
              border = 'rounded',
              width = 30,
              height = 30,
              row = 1,
              col = 1,
            },
          },
        },
        renderer = {
          add_trailing = false,
          group_empty = true,
          highlight_git = true,
          full_name = false,
          highlight_opened_files = 'none',
          special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md', 'CMakeLists.txt' },
          symlink_destination = true,
          indent_markers = {
            enable = true,
            icons = {
              corner = '└ ',
              edge = '│ ',
              item = '│ ',
              none = '  ',
            },
          },
          root_folder_label = ':.:s?.*?/..?',
          icons = {
            webdev_colors = true,
            git_placement = 'after',
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
            padding = ' ',
            symlink_arrow = ' 󰁔 ',
            glyphs = {
              default = '',
              symlink = '',
              bookmark = '󰃃',
              git = {
                unstaged = '',
                staged = '',
                unmerged = '󰘬',
                renamed = '',
                untracked = '󰞋',
                deleted = '',
                ignored = '',
              },
              folder = {
                arrow_open = '',
                arrow_closed = '',
                default = '',
                open = '',
                empty = '',
                empty_open = '',
                symlink = '',
                symlink_open = '',
              },
            },
          },
        },
        hijack_directories = {
          enable = true,
          auto_open = true,
        },
        update_focused_file = {
          enable = true,
          update_root = true,
          ignore_list = {},
        },
        filters = {
          dotfiles = false,
          custom = { '.DS_Store' },
          exclude = {},
        },
        actions = {
          use_system_clipboard = true,
          change_dir = {
            enable = true,
            global = false,
          },
          open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
              enable = true,
              chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
              exclude = {
                filetype = { 'notify', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
                buftype = { 'terminal', 'help' },
              },
            },
          },
          remove_file = {
            close_window = true,
          },
        },
        diagnostics = {
          enable = true,
          show_on_dirs = false,
          debounce_delay = 50,
          icons = {
            hint = '󰌶',
            info = '',
            warning = '󰀪',
            error = '󰅚',
          },
        },
        filesystem_watchers = {
          enable = true,
          debounce_delay = 50,
        },
        git = {
          enable = true,
          ignore = false,
          show_on_dirs = true,
          timeout = 400,
        },
        trash = {
          cmd = 'gio trash',
          require_confirm = true,
        },
        live_filter = {
          prefix = '[FILTER]: ',
          always_show_folders = true,
        },
        log = {
          enable = false,
          truncate = false,
          types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
          },
        },
      })
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    lazy = true,
    cmd = {
      'ToggleTerm',
      'ToggleTermSetName',
      'ToggleTermToggleAll',
      'ToggleTermSendVisualLines',
      'ToggleTermSendCurrentLine',
      'ToggleTermSendVisualSelection'
    },
    config = function()
      require('toggleterm').setup({
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
          border = 'rounded',
        },
      })
    end,
  },
  {
    'folke/flash.nvim',
    lazy = true,
    event = { 'CursorHold', 'CursorHoldI' },
    config = function()
      require('flash').setup({
        labels = 'asdfghjklqwertyuiopzxcvbnm',
        label = {
          -- allow uppercase labels
          uppercase = true,
          -- add a label for the first match in the current window.
          -- you can always jump to the first match with `<CR>`
          current = true,
          -- for the current window, label targets closer to the cursor first
          distance = true,
        },
        modes = {
          search = { enabled = false },
          -- options used when flash is activated through
          -- `f`, `F`, `t`, `T`, `;` and `,` motions
          char = {
            enabled = true,
            -- hide after jump when not using jump labels
            autohide = false,
            -- show jump labels
            jump_labels = false,
            -- set to `false` to use the current line only
            multi_line = true,
            -- When using jump labels, don't use these keys
            -- This allows using those keys directly after the motion
            label = { exclude = 'hjkliardc' },
          },
        },
      })
    end,
  },
}
