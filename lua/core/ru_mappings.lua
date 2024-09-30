--[[
<leader>буква(ы) = Space (пробел) P.S: Переопределить можно в параметре vim.g.mapleader, который находится в lua/core/lazy.lua
<M-буква> = <A-буква> = Meta (Alt) (также можно исп. <m-буква> вместо <M-буква>)
<C-буква> = Ctrl
<S-буква> или <s-буква> = Shift (русские буквы писать заглавной и без <>)
<T-буква> = Meta eсли ≠ Alt
<D-буква> = Super (Win)

Для исп. нескольких символов в комбинации клавиш можно исп. только <leader> (остальные не сработают)
Для того, чтобы исп. shift и ещё какой-то модификатор, букву нужно писать заглавной (для Ctrl может не работать!)
Учтите, что клавишы, назначенные системой, будут главнее => сработает системная комбинация вместо установленной здесь
Русские сочетания клавиш добавляются здесь (для сохранения удобной структуры), хотя никто не запрещает создавать их в lua/core/mappings.lua

Встроенные команды NeoVim работают с русской раскладкой благодаря параметру vim.opt.langmap из файла /lua/core/config.lua
--]]

-- Normal mode
vim.keymap.set("i", "оо", "<Esc>")

-- Command mode
vim.keymap.set("n", "Ж", ":")

-- Работа с вкладками (буферами)
vim.keymap.set("n", "<leader>ч", ":BufferLineSortByTabs<CR>:BufferLineCloseRight<CR>") -- Закрытие всех буферов
vim.keymap.set("n", "<leader>Ч", ":BufferLinePickClose<CR>") -- Закрытие одного буфера
vim.api.nvim_set_keymap("n", "<M-с>", ":lua _G.close_and_go_right()<CR>", { noremap = true, silent = true }) -- подробнее в lua/core/utils.lua
vim.keymap.set("n", "<C-т>", ":BufferLineMoveNext<CR>") -- Переместить вкладку вперед
vim.keymap.set("n", "<C-з>", ":BufferLineMovePrev<CR>") -- Переместить вкладку назад

-- Файловый менеджер
vim.keymap.set("n", "<M-у>", ":Neotree toggle float<CR>") -- Открыть/Закрыть файловое дерево в плавающем режиме
vim.keymap.set("n", "<M-в>", ":Neotree toggle left<CR>") -- Открыть/Закрыть файловое дерево слева сбоку
-- vim.keymap.set("n", "<M-т>", ":Neotree toggle<CR>") -- Открыть/Закрыть файловое дерево (используется последний активный режим)
vim.keymap.set("n", "<leader>ы", ":Neotree show reveal<CR>") -- Показать файл в дереве (не работает в плавающем режиме)

-- Навигация
vim.keymap.set("n", "<M-л>", ":wincmd k<CR>") -- Переключиться на верхнее окно
vim.keymap.set("n", "<M-о>", ":wincmd j<CR>") -- Переключиться на нижнее окно
vim.keymap.set("n", "<M-р>", ":wincmd h<CR>") -- Переключиться на левое окно
vim.keymap.set("n", "<M-д>", ":wincmd l<CR>") -- Переключиться на правое окно

-- Перемещение
vim.keymap.set("n", "<M-Л>", ":wincmd K<CR>") -- Переместить окно вверх
vim.keymap.set("n", "<M-О>", ":wincmd J<CR>") -- Переместить окно вниз
vim.keymap.set("n", "<M-Р>", ":wincmd H<CR>") -- Переместить окно влево
vim.keymap.set("n", "<M-Д>", ":wincmd L<CR>") -- Переместить окно вправо

-- Разделение экрана
vim.keymap.set("n", "<C-м>", ":vsplit<CR>") -- Разделить экран по вертикали
vim.keymap.set("n", "<C-р>", ":split<CR>") -- Разделить экран по горизонтали

--[[ Если строка визуально разбита на несколько строк, то курсор перепрыгнет через них, так как считает, что это одна строка
При помощи настройки ниже курсор будет перемещаться по ним будто это разные строки --]]
vim.keymap.set('n', 'о', "v:count == 0 ? 'gj' : 'j'", {expr = true,})
vim.keymap.set('n', 'л', "v:count == 0 ? 'gk' : 'k'", {expr = true,})

--[[
Включить/Выключить подсветку Treesitter, то есть исп. подсветку от Treesitter или встроенную от LSP
Подсветка от Treesitter выдаёт более качественную подсветку по сравнению с LSP, но может замедлять работу Neovim в больших файлах
Благодаря этому хоткею можно переключаться между ними в зависимости от потребностей и личных приоритетов
--]]
vim.keymap.set("n", "<M-Е>", function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, { desc = "Toggle Treesitter Highlight" })

vim.keymap.set("n", "<leader>се", ":ColorizerToggle<CR>") -- Включить/Отключить подсветку цветовых кодов

vim.keymap.set("n", "<C-л>", ":m+1<CR>") -- Переместить строку под курсором на одну строку вниз
vim.keymap.set("n", "<C-о>", ":m-2<CR>") -- Переместить строку под курсором на одну строку вверх
