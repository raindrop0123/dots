return function()
  local icon = { ui = require('plugin.util.icon').get('ui') }
  require('telescope').setup({
    defaults = {
      mappings = {
        i = {
          ['<C-g>'] = require('telescope.actions').close,
        },
      },
      vimgrep_arguments = {
        'rg',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
      },
      initial_mode = 'insert',
      prompt_prefix = ' ' .. icon.ui.Telescope .. ' ',
      selection_caret = icon.ui.ChevronRight,
      scroll_strategy = 'limit',
      results_title = false,
      layout_strategy = 'horizontal',
      path_display = { 'absolute' },
      selection_strategy = 'reset',
      sorting_strategy = 'ascending',
      color_devicons = true,
      file_ignore_patterns = { '.git/', '.cache', 'build/', '%.class', '%.pdf', '%.mkv', '%.mp4', '%.zip' },
      layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          mirror = false,
        },
        width = 0.85,
        height = 0.92,
        preview_cutoff = 120,
      },
    },
    extensions = {
      fzf = {
        fuzzy = false,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
      frecency = {
        show_scores = true,
        show_unindexed = true,
        ignore_patterns = { '*.git/*', '*/tmp/*' },
      },
      live_grep_args = {
        auto_quoting = true,
      },
    },
  })

  require('telescope').load_extension('frecency')
  require('telescope').load_extension('fzf')
  require('telescope').load_extension('live_grep_args')
  require('telescope').load_extension('notify')
  require('telescope').load_extension('project')
  require('telescope').load_extension('file_browser')
end
