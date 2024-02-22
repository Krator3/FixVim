vim.loader.enable()

-- Базовая настройка
require("core.plugins")
require("core.color")
require("core.config")
require("core.autocmds")
require("core.utils")
require("core.ru_mappings")
require("core.mappings")

-- Настройка расширений
require("plugins.dashboard")
require("plugins.neotree")
require("plugins.mason")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.treesitter")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.autopairs")
require("plugins.toggleterm")
require("plugins.trouble")
require("plugins.colortils")
require("plugins.colorizer")

-- В данном файле инициализации происходит подключение файлов конфигурации
-- Также стоит отметить, что добавлять расширение .lua для файла и папку lua не нужно, так как NeoVim понимает это автоматически
-- Важно, что вместо require("папка.файл") можно использовать require("папка/файл") если вам так удобнее
-- Учтите, что порядок подключения может иметь значение! (Например, если вы попытаетесь активировать цветовую тему до её загрузки будет выдана ошибка)
