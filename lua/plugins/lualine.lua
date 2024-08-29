return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        icons_enabled = true, -- Включить поддержку иконок?
        theme = 'auto', -- Тема для <lualine>

        -- <left> относится к левым разделам (a, b, c), а <right> относится к правым разделам (x, y, z)
        component_separators = { left = '', right = '|' }, -- Разделители для компонентов
        section_separators = { left = '', right = '' }, -- Разделители для разделов (секций)

        -- Типы файлов, для которых не будет отображаться панель <lualine>
        disabled_filetypes = {
          statusline = {'neo-tree','dashboard'},
          winbar = {},
        },

        ignore_focus = {},
        always_divide_middle = true, -- Сохранить фиксированное пространство между двумя частями <lualine> (всегда разделять середину)
        globalstatus = false, -- Определяет, должен ли <lualine> быть общим для всех окон

        -- Интервал обновления данных в <lualine> в миллисекундах
        refresh = {
          -- 1000 миллисекунд = 1 секунда
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },

      --[[
      Визуальная демонстрация размещения компонентов на панели <lualine>
      +-------------------------------------------------+
      | A | B | C                             X | Y | Z |
      +-------------------------------------------------+
      --]]

      -- Содержимое <statusline> для активного (текущего) окна
      sections = {
        -- Настройка компонентов слева
        lualine_a = {'mode'},
        lualine_b = {
          'branch',
          'diff', -- добавлено = <+>, изменено = <~>, удалено = <->
        },
        lualine_c = {
          {'filename', path = 3}, -- 0: Только имя файла
                                  -- 1: Относительный путь
                                  -- 2: Абсолютный путь
                                  -- 3: Абсолютный путь с тильдой вместо домашнего каталога
                                  -- 4: Имя файла и родительский каталог с тильдой вместо домашнего каталога
          {
            'diagnostics',
            sources = { 'nvim_diagnostic', 'nvim_lsp' }, -- Источники для диагностики
            sections = { 'error', 'warn', 'info', 'hint' }, -- Отображаемые типы информации
            diagnostics_color = {
              -- Определение расцветки для различных типов диагностической информации
              error = 'DiagnosticError',
              warn = 'DiagnosticWarn',
              info = 'DiagnosticInfo',
              hint = 'DiagnosticHint',
            },
            -- symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' }, -- символы для обозначения типов информации
            symbols = { error = '󰅙 ', warn = ' ', info = '', hint = ' ' }, -- символы для обозначения типов информации
            colored = true, -- Использовать установленные расцветки?
            update_in_insert = true, -- Обновлять диагностические данные в Insert Mode?
            always_visible = false, -- Отображать диагностику даже если нет данных?
          },
        },
        -- Настройка компонентов справа
        lualine_x = {'filetype', 'encoding', 'fileformat', 'filesize'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
      },

      -- Содержимое <statusline> для неактивных окон, с которыми пользователь не взаимодействует на данный момент
      inactive_sections = {
        -- Настройка компонентов слева
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{'filename', path = 3}},
        -- Настройка компонентов справа
        lualine_x = {'filetype', 'encoding', 'fileformat', 'filesize'},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
  },
}
--[[
Доступные компоненты:
• branch (Отображает текущую ветку Git)
• buffers (Показывает доступные на данный момент буферы)
• diagnostics (Отображает текущую информацию об ошибках, предупреждениях и так далее в соответствии с выбранным источником диагностической информации)
• diff (Отображает статус изменений файла Git [добавлено, изменено, удалено и т.д.])
• encoding (Отображает кодировку файла)
• fileformat (Отображает текущий формат файла: unix[], dos[], mac[])
• filename (Отображает название файла)
• filesize (Отображает размер файла)
• filetype (Отображает тип файла)
• hostname (Отображает имя хоста, то есть ПК)
• location (Отображает текущее местоположение курсора в файле в формате <строка:столбец>)
• mode (Отображает текущий режим работы Neovim)
• progress (Отображает прогресс в процентах[%] в файле)
• searchcount (Отображает кол-во совпадений для поиска, когда опция hlsearch активирована)
• selectioncount (Отображает количество выбранных[выделенных] символов или строк)
• tabs (Отображает список доступных вкладок)
• windows (Отображает список доступных окон)
• datetime (Отображает текущую дату и время)
--]]
