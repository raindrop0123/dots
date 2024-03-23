return {
  {
    'folke/neodev.nvim',
    lazy = true,
    event = 'LspAttach',
    opts = {},
  },
  {
    'ibhagwan/fzf-lua',
    lazy = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'FzfLua' },
    keys = {
      { '<leader><leader>', mode = 'n', '<Cmd>FzfLua commands<CR>', desc = 'Find: Commands' },
      { '<leader>fb', mode = 'n', '<Cmd>FzfLua buffers<CR>', desc = 'Find: Buffers' },
      { '<leader>ff', mode = 'n', '<Cmd>FzfLua files<CR>', desc = 'Find: Files' },
      { '<leader>fs', mode = 'n', '<Cmd>FzfLua blines<CR>', desc = 'Find: Buffer Lines' },
      { '<leader>fw', mode = 'n', '<Cmd>FzfLua live_grep<CR>', desc = 'Find: Words' },
      { '<leader>fc', mode = 'n', '<Cmd>FzfLua colorschemes<CR>', desc = 'Find: Colorschemes' },
    },
  },
  {
    'folke/trouble.nvim',
    lazy = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'TroubleToggle' },
    keys = {
      { '<leader>tT', mode = 'n', '<Cmd>TroubleToggle<CR>', desc = 'Toggle: Trouble' },
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    cmd = {
      'NvimTreeToggle',
      'NvimTreeOpen',
      'NvimTreeFindFile',
      'NvimTreeFindFileToggle',
      'NvimTreeRefresh',
    },
    keys = {
      { '<f1>', mode = 'n', '<Cmd>NvimTreeToggle<CR>', desc = 'Toggle: NvimTree' },
    },
    opts = {},
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
      'ToggleTermSendVisualSelection',
    },
    keys = {
      { '<C-t>', mode = 'n', '<Cmd>ToggleTerm<CR>', desc = 'Toggle: Terminal' },
      { '<C-t>', mode = 't', [[<C-\><C-n><Cmd>ToggleTerm<CR>]], desc = 'Toggle: Terminal' },
      { 'jk', mode = 't', [[<C-\><C-n>]], desc = 'Back to Normal' },
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
        on_open = function()
          -- Prevent infinite calls from freezing neovim.
          -- Only set these options specific to this terminal buffer.
          vim.api.nvim_set_option_value('foldmethod', 'manual', { scope = 'local' })
          vim.api.nvim_set_option_value('foldexpr', '0', { scope = 'local' })
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
        open_mapping = false, -- [[<c-\>]],
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = false,
        shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = true,
        persist_mode = false,
        insert_mappings = true, -- whether or not the open mapping applies in insert mode
        persist_size = true,
        direction = 'horizontal',
        close_on_exit = true, -- close the terminal window when the process exits
      })
    end,
  },
}
