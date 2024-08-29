vim.fn.sign_define("DiagnosticSignError", {text = "󰅙 ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            enable_diagnostics = true,
            modified = {
                symbol = "[+]",
                highlight = "NeoTreeModified",
            },

            file_size = {
                enabled = true,
                required_width = 64, -- Минимальная ширина окна, необходимая для отображения этого столбца
            },

            type = {
                enabled = true,
                required_width = 122, -- Минимальная ширина окна, необходимая для отображения этого столбца
            },

            last_modified = {
                enabled = true,
                required_width = 88, -- Минимальная ширина окна, необходимая для отображения этого столбца
            },

            created = {
                enabled = true,
                required_width = 110, -- Минимальная ширина окна, необходимая для отображения этого столбца
            },

            symlink_target = {
                enabled = true,
            },

            window = {
                position = "left",
                width = 40,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
                mappings = {
                    ["w"] = "open", -- Открыть/Закрыть файл или директорию
                    ["ц"] = "open", -- Открыть/Закрыть файл или директорию

                    -- Предварительный просмотр файлов (для плавающего режима)
                    ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } }, -- в новом соседнем окне
                    ["З"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } }, -- в новом соседнем окне

                    -- ["P"] = "toggle_preview", -- позади окна, как будто файл уже открыт, а поверх него открыт neotree
                    -- ["З"] = "toggle_preview", -- позади окна, как будто файл уже открыт, а поверх него открыт neotree

                    ["a"] = "add", -- Создать файл (если добавить "/", то создастся директория)
                    ["ф"] = "add", -- Создать файл (если добавить "/", то создастся директория)

                    ["A"] = "add_directory", -- Создать директорию
                    ["Ф"] = "add_directory", -- Создать директорию

                    ["d"] = "delete", -- Удалить файл/директорию
                    ["в"] = "delete", -- Удалить файл/директорию

                    ["r"] = "rename", -- Переименовать файл/директорию
                    ["к"] = "rename", -- Переименовать файл/директорию

                    ["y"] = "copy_to_clipboard", -- Скопировать файл/директорию в буфер обмена
                    ["н"] = "copy_to_clipboard", -- Скопировать файл/директорию в буфер обмена

                    ["x"] = "cut_to_clipboard", -- Вырезать файл/директорию в буфер обмена
                    ["ч"] = "cut_to_clipboard", -- Вырезать файл/директорию в буфер обмена

                    ["p"] = "paste_from_clipboard", -- Вставить файл/директорию из буфера обмена в нужное место
                    ["з"] = "paste_from_clipboard", -- Вставить файл/директорию из буфера обмена в нужное место

                    ["c"] = "copy", -- Скопировать файл/директорию (можно указать путь для перемещения вручную)
                    ["с"] = "copy", -- Скопировать файл/директорию (можно указать путь для перемещения вручную)

                    ["m"] = "move", -- Переместить файл/директорию
                    ["ь"] = "move", -- Переместить файл/директорию

                    ["q"] = "close_window", -- Закрыть все окна neotree
                    ["й"] = "close_window", -- Закрыть все окна neotree

                    ["i"] = "show_file_details", -- Отобразить доп. информацию о файле/директории
                    ["ш"] = "show_file_details", -- Отобразить доп. информацию о файле/директории

                    ["?"] = "show_help", -- Открыть меню справки neotree
                    ["<esc>"] = "cancel", -- Клавиша закрытия различных окон neotree
                },
            },

            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                },
                window = {
                    mappings = {
                        ["H"] = "toggle_hidden", -- Переключатель для отображения скрытых файлов (для корректной работы измените значения параметров в filtered_items)
                        ["Р"] = "toggle_hidden", -- Переключатель для отображения скрытых файлов (для корректной работы измените значения параметров в filtered_items)

                        ["."] = "set_root", -- Отображать только содержимое выбранной директории (для выхода из данного режима нужно нажать backspace)
                    },
                },
            },
        },
    },
}
