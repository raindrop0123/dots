if not vim.g.vscode then
  require('core.global')
  require('core.clipboard')
  require('core.autocmd')
  require('core.option')
  require('core.disable_distribution_plugin')
  require('core.mapping')
  require('core.lazy')
end
