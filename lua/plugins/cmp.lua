return {
    "hrsh7th/nvim-cmp",
	dependencies = {
      {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
      },
	  {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      },
	},

	config = function()
        local cmp = require("cmp")
        require("luasnip.loaders.from_vscode").lazy_load()

        local kind_icons = {
            Text = " ",
            Method = "󰆧",
            Function = "ƒ ",
            Constructor = " ",
            Field = "󰜢 ",
            Variable = " ",
            Constant = " ",
            Class = " ",
            Interface = "󰜰 ",
            Struct = " ",
            Enum = "了 ",
            EnumMember = " ",
            Module = "",
            Property = " ",
            Unit = " ",
            Value = "󰎠 ",
            Keyword = "󰌆 ",
            Snippet = " ",
            File = " ",
            Folder = " ",
            Color = " ",
        }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },

            -- Настройка параметров окна <cmp>
            window = {
                completion = cmp.config.window.bordered(), -- Отображение рамки окна подсказок
                documentation = cmp.config.window.bordered(), -- Отображение рамки окна документации к подсказкам
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Прокрутить документацию вверх
                ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Прокрутить документацию вниз
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Принять текущий элемент (true) или только явно выбранный элемент (false)

                -- Перейти к следующей подсказке
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end, {"i", "s"}),

                -- Перейти к предыдущей подсказке
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, {"i", "s"})
            }),

            completion = {
                completeopt = "menu,menuone,noselect",
            },

            -- Источники для подсказок (порядок имеет значение)
            sources = {
                { name = 'nvim_lsp' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'nvim_lua' },
                { name = "luasnip" },
                { name = 'buffer' },
                { name = 'path' },
            },

            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },

            formatting = {
			format = function(entry, vim_item)
				vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- Таким образом значки объединяются с названием вида элемента
				vim_item.menu = ({
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
					nvim_lua = "[NvimAPI]",
					path = "[Path]",
				})[entry.source.name]
				return vim_item
			end,
            },
        })

        -- Использовать источник буфера для `/` и `?` (если вы включили `native_menu`, это больше не будет работать)
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {{ name = 'buffer'}}
        })

        -- Используйте cmdline и источник пути для ':' (если вы включили `native_menu`, это больше не будет работать)
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({{ name = 'path'}}, {{ name = 'cmdline'}}),
            matching = { disallow_symbol_nonprefix_matching = false },
        })

        -- Подключение LSP для работы автокомплита
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- Замените <YOUR_LSP_SERVER> на нужный lsp-сервер (для каждого нужно создавать отдельный параметр)
        -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup{capabilities = capabilities}
        require('lspconfig')['pyright'].setup{capabilities = capabilities}

        -- Подстановка скобок к подсказкам, которым это нужно (дополнение для nvim-autopairs)
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
	end,
}
