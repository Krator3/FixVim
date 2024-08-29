return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false, -- Загрузка темы сразу во время запуска nvim
        priority = 1000, -- Повышение приоритета, чтобы загрузить тему перед всеми остальными плагинами
        config = function()
            require("kanagawa").load("wave") -- Активация цветовой схемы
        end,
    },
}
