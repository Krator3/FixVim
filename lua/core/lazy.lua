-- Установка менеджера расширений и его подключение
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Определение "leader" клавиши. В данном случае - это пробел

-- Настройка параметров менеджера плагинов (Lazy.nvim)
require("lazy").setup({
	-- Импорт всех файлов из указанных каталогов
	spec = {
		{ import = "plugins" },
		{ import = "plugins.lsp" },
	},

	-- Настройка поведения плагинов "по умолчанию"
	defaults = {
		lazy = false, -- Не загружать расширения автоматически, только при их явном вызове или же по преднастроенному событию
	},
	performance = {
		cache = {
			enabled = true, -- Включение кэширования (должно обеспечивать более быстрый запуск nvim)
        },

		reset_packpath = true, -- Сбросить путь к пакету, чтобы ускорить запуск

		rtp = {
			reset = true, -- Сбросить путь выполнения к $VIMRUNTIME и каталогу конфигурации
			paths = {}, -- Добавьте сюда любые пользовательские пути, которые вы хотите включить в rtp
			-- Список плагинов для отключения
			disabled_plugins = {
				-- "2html_plugin",
				-- "tohtml",
				-- "getscript",
				-- "getscriptPlugin",
				-- "gzip",
				-- "logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				-- "matchit",
				-- "tar",
				-- "tarPlugin",
				-- "rrhelper",
				-- "spellfile_plugin",
				-- "vimball",
				-- "vimballPlugin",
				-- "zip",
				-- "zipPlugin",
				-- "tutor",
				-- "rplugin",
				-- "syntax",
				-- "synmenu",
				-- "optwin",
				-- "compiler",
				-- "bugreport",
				-- "ftplugin",
			},
		},
	},

	-- Настройка внешней составляющей окна Lazy.nvim
	ui = {
		border = "rounded", -- Стиль/Тип обводки
		title = "Plugin Manager", -- Название окна
		title_pos = "center", -- Расположение названия ("center" | "left" | "right") ("центр" | "лево" | "право")
		-- Размер окна
		size = {
			width = 0.8, -- Ширина
			height = 0.8, -- Высота
		},
	},

		-- Определение иконок для различных типов данных
		icons = {
			cmd = " ",
			config = "",
			event = "",
			ft = " ",
			init = " ",
			import = " ",
			keys = " ",
			lazy = "󰂠 ",
			loaded = "●",
			not_loaded = "○",
			plugin = " ",
			runtime = " ",
			source = " ",
			start = "",
			task = "✔ ",
			list = {
				"●",
				"➜",
				"★",
				"‒",
			},
	},

	checker = {
		enabled = true, -- Автоматическая проверка на наличие обновлений для плагинов
		notify = true, -- Получать уведомления о появлении новых обновлений
	},

	change_detection = {
		enabled = false, -- Автоматически проверять наличие изменений в конфигурационном файле и перезагружать UI (пользовательский интерфейс)
		notify = false, -- Получать уведомление при обнаружении изменений
	},

	install = {
		colorscheme = { "kanagawa" }, -- Цветовая схема, которая будет использоваться при установке плагинов (по возможности)
		missing = true, -- Установить недостающие плагины при запуске? (Это не увеличивает время запуска)
	},
})
