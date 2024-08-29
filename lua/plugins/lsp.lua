return {
  "neovim/nvim-lspconfig",

  config = function()
  -- Настрока языковых серверов
  local lspconfig = require('lspconfig')
  local lsputil = require('lspconfig/util')
  -- nvim-cmp поддерживает возможности LSP, поэтому следует объявить его сервером LSP
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  -- Настройка Python с использованием LSP Pyright
  lspconfig.pyright.setup({
    root_dir = lsputil.root_pattern('.git', 'pyrightconfig.json', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyproject.toml'),
    capabilities = capabilities,
  })

  -- Замените <YOUR_LSP_SERVER> на нужный lsp-сервер (для каждого нужно создавать отдельный параметр!)
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup{capabilities = capabilities}
  require('lspconfig')['pyright'].setup{capabilities = capabilities}

  -- Установка глобальных сочетаний клавиш, взаимодействующих с функциями LSP
  -- Учтите, что для работы данных команд требуется, чтобы их поддерживал LSP нужного вам ЯП
  vim.keymap.set('n', '<space>do', vim.diagnostic.open_float)
  vim.keymap.set('n', '<space>dp', vim.diagnostic.goto_prev)
  vim.keymap.set('n', '<space>dn', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist) -- Окно со всеми ошибками в файле

  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Перейти туда, где создано то, на чём находится курсор
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- Отображает подсказку для правильного использования функций и так далее (что-то духа документации)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-sh>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts) -- Переименовать текст под курсором во всем файле (буфере). Возможно, что как-то можно и во всем активном каталоге
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts) -- Быстрое действие для текста, на котором находится курсор
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })

  vim.diagnostic.config({update_in_insert = false,}) -- Отображать ошибки от LSP в Insert Mode?

  end,
}
