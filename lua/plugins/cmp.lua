local cmp = require'cmp'

cmp.setup{
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)

        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Принять текущий элемент (true) или только явно выбранный элемент (false)
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {"i", "s"})
    }),

    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'nvim_lsp_signature_help' },
            { name = 'vsnip' },
            { name = 'nvim_lua' },
            { name = 'path' },
            { name = 'buffer' },
        }
    )
}

-- Установите конфигурацию для определенного типа файла
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' },
    }, {
        { name = 'buffer' },
    })
})

-- Использовать источник буфера для `/` и `?` (если вы включили `native_menu`, это больше не будет работать)
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {{ name = 'buffer'}}
})

-- Используйте cmdline и источник пути для ':' (если вы включили `native_menu`, это больше не будет работать)
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({{ name = 'path'}}, {{ name = 'cmdline'}})
})

-- Настройка конфига LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Замените <YOUR_LSP_SERVER> на нужный lsp-сервер (для каждого нужно создавать отдельный параметр)
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {capabilities = capabilities}
require('lspconfig')['pyright'].setup {capabilities = capabilities}



-- Подстановка скобок к подсказкам, которым это нужно (дополнение для nvim-autopairs)
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
