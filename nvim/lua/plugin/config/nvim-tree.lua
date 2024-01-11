return function()

  local icon = {
    diagnostics = require('util.icon').get('diagnostics'),
    documents = require('util.icon').get('documents'),
    git = require('util.icon').get('git'),
    ui = require('util.icon').get('ui'),
  }

  require('nvim-tree').setup({
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
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
          default = icon.documents.Default, --
          symlink = icon.documents.Symlink, --
          bookmark = icon.ui.Bookmark,
          git = {
            unstaged = icon.git.Mod_alt,
            staged = icon.git.Add, --󰄬
            unmerged = icon.git.Unmerged,
            renamed = icon.git.Rename, --󰁔
            untracked = icon.git.Untracked, -- "󰞋"
            deleted = icon.git.Remove, --
            ignored = icon.git.Ignore, --◌
          },
          folder = {
            arrow_open = icon.ui.ArrowOpen,
            arrow_closed = icon.ui.ArrowClosed,
            -- arrow_open = "",
            -- arrow_closed = "",
            default = icon.ui.Folder,
            open = icon.ui.FolderOpen,
            empty = icon.ui.EmptyFolder,
            empty_open = icon.ui.EmptyFolderOpen,
            symlink = icon.ui.SymlinkFolder,
            symlink_open = icon.ui.FolderOpen,
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
      enable = false,
      show_on_dirs = false,
      debounce_delay = 50,
      icons = {
        hint = icon.diagnostics.Hint_alt,
        info = icon.diagnostics.Information_alt,
        warning = icon.diagnostics.Warning_alt,
        error = icon.diagnostics.Error_alt,
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
end
