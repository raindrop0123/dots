return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    cmd = {
      'DapSetLogLevel',
      'DapShowLog',
      'DapContinue',
      'DapToggleBreakpoint',
      'DapToggleRepl',
      'DapStepOver',
      'DapStepInto',
      'DapStepOut',
      'DapTerminate',
    },
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        config = function()
          require('dapui').setup({
            force_buffers = true,
            icons = { expanded = '', collapsed = '', current_frame = '' },
            mappings = {
              -- Use a table to apply multiple mappings
              edit = 'e',
              expand = { '<CR>', '<2-LeftMouse>' },
              open = 'o',
              remove = 'd',
              repl = 'r',
              toggle = 't',
            },
            layouts = {
              {
                elements = {
                  -- Provide as ID strings or tables with 'id' and 'size' keys
                  { id = 'scopes', size = 0.3 },
                  { id = 'watches', size = 0.3 },
                  { id = 'stacks', size = 0.3 },
                  { id = 'breakpoints', size = 0.1 },
                },
                size = 0.3,
                position = 'left',
              },
              {
                elements = {
                  { id = 'repl', size = 0.45 },
                  { id = 'console', size = 0.55 },
                },
                position = 'bottom',
                size = 0.25,
              },
            },
            controls = {
              enabled = true,
              -- Display controls in this session
              element = 'repl',
              icons = {
                pause = '',
                play = '',
                step_into = '󰆹',
                step_over = '󰆷',
                step_out = '󰆸',
                step_back = '',
                run_last = '↻',
                terminate = '󰝤',
              },
            },
            floating = {
              max_height = nil, -- These can be integers or a float between 0 and 1.
              max_width = nil, -- Floats will be treated as percentage of your screen.
              border = 'single', -- Border style. Can be 'single', 'double' or 'rounded'
              mappings = {
                close = { 'q', '<Esc>' },
              },
            },
            render = { indent = 1, max_value_lines = 85 },
          })
        end,
      },
      {
        'jay-babu/mason-nvim-dap.nvim',
        config = function()
          require('mason-nvim-dap').setup({
            ensure_installed = {
              'codelldb',
              'python',
            },
            automatic_installation = false,
            handlers = {
              function(config)
                require('mason-nvim-dap').default_setup(config)
              end,
            },
          })
        end,
      },
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      vim.fn.sign_define('DapBreakpoint', { text = '󰝥', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '󰟃', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
      vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
      vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close({})
        dap.repl.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close({})
        dap.repl.close()
      end

    end,
  },
}

