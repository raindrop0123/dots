return {
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = 'Telescope',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-tree/nvim-web-devicons' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-telescope/telescope-project.nvim' },
      { 'nvim-telescope/telescope-frecency.nvim' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
    },
    config = function()
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
          prompt_prefix = '  ',
          selection_caret = '',
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
              preview_width = 0.65,
              results_width = 0.6,
            },
            vertical = {
              mirror = false,
            },
            width = 0.88,
            height = 0.9,
            preview_cutoff = 120,
          },
        },
        extensions = {
          aerial = {
            show_nesting = {
              ['_'] = false,
              json = true,
              yaml = true,
            },
          },
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
      require('telescope').load_extension('aerial')
    end,
  },
}
