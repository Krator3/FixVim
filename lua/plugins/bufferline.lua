-- Для работы требуется параметр ниже (активирован в lua/core/config.lua)
-- vim.opt.termguicolors = true
return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				modified_icon = "●",
				buffer_close_icon = "✕", -- Иконка для закрытия буфера при помощи мыши ("" = отключение функционала)
				left_trunc_marker = "", -- Символ слева от имени файла, если его имя было обрезано
				right_trunc_marker = "...", -- Символ справа от имени файла, если его имя было обрезано
				numbers = "ordinal", -- Способ нумерации буферов
				max_name_length = 15, -- Кол-во отображаемых символов в названии файлов
				max_prefix_length = 6, -- Кол-во отображаемых символов в названии префикса
				persist_buffer_sort = true, -- Сохранять порядок буферов после их закрытия и повторного открытия
				enforce_regular_tabs = false, -- Добавлять отсупы для вкладок

				-- Показывать иконки для буферов
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,

				-- Настройка правил для смещения отображаемых буферов
				offsets = {
					{
						filetype = "neo-tree", -- Тип файла, для которого применяется смещение
						text = "File Tree", -- Текст, отображаемый перед именем файла или вкладки
						-- separator = true, -- Добавляет разделительную линию перед указанным типом файла
						-- padding = 5, -- Кол-во пробелов перед указанным типом файла
						highlight = "Directory", -- Тип подсветки, который будет применен
					},
				},
			},
		},
	},
}
