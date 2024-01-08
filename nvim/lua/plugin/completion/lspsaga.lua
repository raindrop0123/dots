return function()

  local icon = {
    cmp = require('util.icon').get('cmp', true),
    diagnostics = require('util.icon').get('diagnostics', true),
    kind = require('util.icon').get('kind', true),
    type = require('util.icon').get('type', true),
    ui = require('util.icon').get('ui', true),
  }

  -- sidebar icon
  local diagnostic_icon = {
    Error = icon.diagnostics.Error_alt,
    Warn = icon.diagnostics.Warning_alt,
    Info = icon.diagnostics.Information_alt,
    Hint = icon.diagnostics.Hint_alt,
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
      border = 'rounded',
      devicon = true,
      title = true,
      lines = { '┗', '┣', '┃', '━', '┏' },
      expand = icon.ui.ArrowClosed,
      collapse = icon.ui.ArrowOpen,
      imp_sign = icon.kind.Implementation,
      kind = {
        -- Class = { icon.kind.Class, 'LspKindClass' },
        -- Constant = { icon.kind.Constant, 'LspKindConstant' },
        -- Constructor = { icon.kind.Constructor, 'LspKindConstructor' },
        -- Enum = { icon.kind.Enum, 'LspKindEnum' },
        -- EnumMember = { icon.kind.EnumMember, 'LspKindEnumMember' },
        -- Event = { icon.kind.Event, 'LspKindEvent' },
        -- Field = { icon.kind.Field, 'LspKindField' },
        -- File = { icon.kind.File, 'LspKindFile' },
        -- Function = { icon.kind.Function, 'LspKindFunction' },
        -- Interface = { icon.kind.Interface, 'LspKindInterface' },
        -- Key = { icon.kind.Keyword, 'LspKindKey' },
        -- Method = { icon.kind.Method, 'LspKindMethod' },
        -- Module = { icon.kind.Module, 'LspKindModule' },
        -- Namespace = { icon.kind.Namespace, 'LspKindNamespace' },
        -- Number = { icon.kind.Number, 'LspKindNumber' },
        -- Operator = { icon.kind.Operator, 'LspKindOperator' },
        -- Package = { icon.kind.Package, 'LspKindPackage' },
        -- Property = { icon.kind.Property, 'LspKindProperty' },
        -- Struct = { icon.kind.Struct, 'LspKindStruct' },
        -- TypeParameter = { icon.kind.TypeParameter, 'LspKindTypeParameter' },
        -- Variable = { icon.kind.Variable, 'LspKindVariable' },
        -- Array = { icon.type.Array, 'LspKindArray' },
        -- Boolean = { icon.type.Boolean, 'LspKindBoolean' },
        -- Null = { icon.type.Null, 'LspKindNull' },
        -- Object = { icon.type.Object, 'LspKindObject' },
        -- String = { icon.type.String, 'LspKindString' },
        -- TypeAlias = { icon.kind.TypeAlias, 'LspKindTypeAlias' },
        -- Parameter = { icon.kind.Parameter, 'LspKindParameter' },
        -- StaticMethod = { icon.kind.StaticMethod, 'LspKindStaticMethod' },
        -- Text = { icon.kind.Text, 'LspKindText' },
        -- Snippet = { icon.kind.Snippet, 'LspKindSnippet' },
        -- Folder = { icon.kind.Folder, 'LspKindFolder' },
        -- Unit = { icon.kind.Unit, 'LspKindUnit' },
        -- Value = { icon.kind.Value, 'LspKindValue' },
      },
    },
    scroll_preview = {
      scroll_down = '<C-d>',
      scroll_up = '<C-u>',
    },
    request_timeout = 3000,
  })
end
