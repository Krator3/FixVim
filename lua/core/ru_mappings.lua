--[[
<leader>буква(ы) = Space (пробел)
<M-буква> = <A-буква> = Meta (Alt) (также можно исп. <m-буква> вместо <M-буква>)
<C-буква> = Ctrl
<S-буква> или <s-буква> = Shift (русские буквы писать заглавной и без <>)
<T-буква> = Meta eсли ≠ Alt
<D-буква> = Super (Win)
--]]

-- Для исп. нескольких символов в комбинации клавиш можно исп. только <leader> (остальные не сработают)
-- Для того, чтобы исп. shift и ещё какой-то модификатор, букву нужно писать заглавной
-- Учтите, что клавишы, назначенные системой, будут главнее => сработает системная комбинация вместо установленной здесь
-- Русские сочетания клавиш добавляются здесь (для сохранения удобной структуры), хотя никто не запрещает создавать их в lua/core/mappings.lua

-- Normal mode
vim.keymap.set("i", "оо", "<Esc>")

-- Command mode
vim.keymap.set("n", "Ж", ":")

-- Insert mode
vim.keymap.set("n", "ф", "a")
vim.keymap.set("n", "щ", "o")
vim.keymap.set("n", "Щ", "O")
vim.keymap.set("n", "ш", "i")
vim.keymap.set("v", "с", "c")

-- Перемещение влево
vim.keymap.set("n", "р", "h")
vim.keymap.set("v", "р", "h")

-- Перемещение вниз
vim.keymap.set("n", "о", "j")
vim.keymap.set("v", "о", "j")

-- Перемещение вверх
vim.keymap.set("n", "л", "k")
vim.keymap.set("v", "л", "k")

-- Перемещение вправо
vim.keymap.set("n", "д", "l")
vim.keymap.set("v", "д", "l")

-- Удаление
vim.keymap.set("n", "в", "d")
vim.keymap.set("v", "в", "d")
vim.keymap.set("n", "вв", "dd")
vim.keymap.set("n", "ч", "x")

-- Вставка
vim.keymap.set("n", "з", "p")
vim.keymap.set("v", "з", "p")

-- Отмена действия
vim.keymap.set("n", "г", "u")

-- Копирование
vim.keymap.set("n", "нн", "yy")
vim.keymap.set("n", "н", "y")
vim.keymap.set("v", "н", "yy")

-- Замена replace
vim.keymap.set("n", "к", "r")

-- Работа с вкладками (буферами)
vim.keymap.set("n", "<leader>ч", ":BufferLineSortByTabs<CR>:BufferLineCloseRight<CR>") -- Закрытие всех буферов
vim.keymap.set("n", "<leader>Ч", ":BufferLinePickClose<CR>") -- Закрытие одного буфера
vim.api.nvim_set_keymap("n", "<M-с>", ":lua _G.close_and_go_right()<CR>", { noremap = true, silent = true }) -- подробнее в lua/core/utils.lua
vim.keymap.set("n", "<C-т>", ":BufferLineMoveNext<CR>") -- Переместить вкладку вперед
vim.keymap.set("n", "<C-з>", ":BufferLineMovePrev<CR>") -- Переместить вкладку назад

-- Выделение
vim.keymap.set("n", "м", "v")
vim.keymap.set("v", "м", "v")
vim.keymap.set("n", "М", "V")
vim.keymap.set("v", "М", "V")

-- Файловый менеджер
vim.keymap.set("n", "<M-у>", ":Neotree toggle float<CR>") -- Открыть/Закрыть файловое дерево в плавающем режиме
vim.keymap.set("n", "<M-в>", ":Neotree toggle left<CR>") -- Открыть/Закрыть файловое дерево слева сбоку
-- vim.keymap.set("n", "<M-т>", ":Neotree toggle<CR>") -- Открыть/Закрыть файловое дерево (используется последний активный режим)
vim.keymap.set("n", "<leader>ы", ":Neotree show reveal<CR>") -- Показать файл в дереве (не работает в плавающем режиме)

-- Навигация
vim.keymap.set("n", "<C-л>", ":wincmd k<CR>") -- Переключиться на верхнее окно
vim.keymap.set("n", "<C-о>", ":wincmd j<CR>") -- Переключиться на нижнее окно
vim.keymap.set("n", "<C-р>", ":wincmd h<CR>") -- Переключиться на левое окно
vim.keymap.set("n", "<C-д>", ":wincmd l<CR>") -- Переключиться на правое окно

-- В начало и конец файла
vim.keymap.set("n", "пп", "gg")
vim.keymap.set("v", "пп", "gg")
vim.keymap.set("n", "П", "G")
vim.keymap.set("v", "П", "G")

--[[ Если строка визуально разбита на несколько строк, то курсор перепрыгнет через них, так как считает, что это одна строка
При помощи настройки ниже курсор будет перемещаться по ним будто это разные строки --]]
vim.keymap.set('n', 'о', "v:count == 0 ? 'gj' : 'j'", {expr = true,})
vim.keymap.set('n', 'л', "v:count == 0 ? 'gk' : 'k'", {expr = true,})

-- Терминал
vim.keymap.set("n", "<M-е>", ":ToggleTerm direction=float<CR>") -- Открыть терминал в плавающем режиме

vim.keymap.set("n", "Е", function() require("trouble").toggle() end) -- Открыть/Закрыть список проблем (расширение <Trouble>)

--[[
Включить/Выключить подсветку Treesitter, то есть исп. подсветку от Treesitter или встроенную от LSP
Подсветка от Treesitter выдаёт более качественную подсветку по сравнению с LSP, но может замедлять работу Neovim в больших файлах
Благодаря этому хоткею можно переключаться между ними в зависимости от потребностей и личных приоритетов
--]]
vim.keymap.set("n", "<M-Е>", function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, { desc = "Toggle Treesitter Highlight" })


vim.keymap.set("n", "<leader>се", ":ColorizerToggle<CR>") -- Включить/Отключить подсветку цветовых кодов

vim.keymap.set("n", "<M-л>", ":m+1<CR>") -- Переместить строку под курсором на одну строку вниз
vim.keymap.set("n", "<M-о>", ":m-2<CR>") -- Переместить строку под курсором на одну строку вверх
