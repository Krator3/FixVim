return {
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = { "*" }, -- Типы файлов, в которых будет работать подсветка цветовых кодов (можно указать конкретные)
      user_default_options = {
        RGB = true, -- Поддержка #RGB
        RRGGBB = true, -- Поддержка #RRGGBB
        names = true, -- Поддержка названий цветов (например, Blue или blue, то есть синий)
        RRGGBBAA = false, -- Поддержка #RRGGBBAA
        AARRGGBB = false, -- Поддержка 0xAARRGGBB
        rgb_fn = false, -- Поддержка rgb() и rgba() функций CSS
        hsl_fn = false, -- Поддержка hsl() и hsla() функций CSS
        css = false, -- Включить все функции CSS: rgb_fn, hsl_fn, имена, RGB, RRGGBB
        css_fn = false, -- Включить все *функции* CSS: rgb_fn, hsl_fn
        -- Доступные режимы для <mode>: foreground(передний план), background(фон), virtualtext(виртуальный текст)
        mode = "background", -- Установить режим отображения
        -- Доступные методы: false / true / «normal» / «lsp» / «both»
        -- True то же самое, что и normal
        tailwind = false, -- Включить цвета попутного ветра(tailwind colors)
        -- Парсеры могут содержать значения, используемые в |user_default_options|
        sass = { enable = false, parsers = { "css" }, }, -- Включить цвета Sass
        virtualtext = "■",
        -- Обновлять значения цвета, даже если буфер не сфокусирован
        -- Примеры использования: cmp_menu, cmp_docs
        always_update = false
      },
      -- Все дополнительные параметры типов файлов применяются к типам буферов
      buftypes = {},
    },
  },
}
