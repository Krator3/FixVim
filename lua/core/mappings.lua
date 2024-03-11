vim.g.mapleader = " "

--[[
<leader>буква(ы) = Space (пробел)
<M-буква> = <A-буква> = Meta (Alt) (также можно исп. <m-буква> вместо <M-буква>)
<C-буква> = Ctrl
<S-буква> или <s-буква> = Shift (русские буквы писать заглавной и без <>)
<T-буква> = Meta eсли ≠ Alt
<D-буква> = Super (Win)
--]]

-- Для исп. нескольких символов в комбинации клавиш можно исп. только <leader> (остальные не сработают)
-- Для того, чтобы исп. shift и ещё какой-то модификатор, букву нужно писать заглавной (для Ctrl может не работать!)
-- Учтите, что клавишы, назначенные системой, будут главнее => сработает системная комбинация вместо установленной здесь
-- Русские сочетания клавиш добавляются в lua/core/ru_mappings.lua (для сохранения удобной структуры), хотя никто не запрещает создавать их здесь

-- Навигация
vim.keymap.set("n", "<M-k>", ":wincmd k<CR>") -- Переключиться на верхнее окно
vim.keymap.set("n", "<M-j>", ":wincmd j<CR>") -- Переключиться на нижнее окно
vim.keymap.set("n", "<M-h>", ":wincmd h<CR>") -- Переключиться на левое окно
vim.keymap.set("n", "<M-l>", ":wincmd l<CR>") -- Переключиться на правое окно

-- Перемещение
vim.keymap.set("n", "<M-K>", ":wincmd K<CR>") -- Переместить окно вверх
vim.keymap.set("n", "<M-J>", ":wincmd J<CR>") -- Переместить окно вниз
vim.keymap.set("n", "<M-H>", ":wincmd H<CR>") -- Переместить окно влево
vim.keymap.set("n", "<M-L>", ":wincmd L<CR>") -- Переместить окно вправо

vim.api.nvim_set_keymap("n", "<M-c>", ":lua _G.close_and_go_right()<CR>", { noremap = true, silent = true }) -- подробнее в lua/core/utils.lua

-- Файловый менеджер
vim.keymap.set("n", "<M-e>", ":Neotree toggle float<CR>") -- Открыть/Закрыть файловое дерево в плавающем режиме
vim.keymap.set("n", "<M-d>", ":Neotree toggle left<CR>") -- Открыть/Закрыть файловое дерево слева сбоку
-- vim.keymap.set("n", "<M-n>", ":Neotree toggle<CR>") -- Открыть/Закрыть файловое дерево (используется последний активный режим)
vim.keymap.set("n", "<leader>s", ":Neotree show reveal<CR>") -- Показать файл в дереве (не работает в плавающем режиме)

-- Разделение экрана
vim.keymap.set("n", "<C-v>", ":vsplit<CR>") -- Разделить экран по вертикали (окна снизу и сверху символа <->)
vim.keymap.set("n", "<C-h>", ":split<CR>") -- Разделить экран по горизонтали (окно|окно)

-- Удаление буфера
vim.keymap.set('n', '<leader>X', ':BufferLinePickClose<CR>')
vim.keymap.set("n", "<leader>x", ":BufferLineSortByTabs<CR>:BufferLineCloseRight<CR>")

vim.keymap.set("i", "jj", "<Esc>") -- Аналог для клавишы <Esc>, чтобы не тянуть руку в даль клавиатуры
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>") -- Отключить подсветку для найденных объектов. Для поиска используется символ '/'

-- Работа с вкладками (буферами)
vim.keymap.set("n", "<C-n>", ":BufferLineMoveNext<CR>") -- Переместить вкладку вперед
vim.keymap.set("n", "<C-p>", ":BufferLineMovePrev<CR>") -- Переместить вкладку назад
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>") -- Следующий буфер
vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>") -- Предыдущий буфер
-- vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>:Neotree left show reveal<CR>") -- Следующий буфер + показать файл, на который переместились
-- vim.keymap.set("n", "<s-Tab>", ":BufferLineCyclePrev<CR>:Neotree left show reveal<CR>") -- Предыдущий буфер + показать файл, на который переместились

-- Терминал
vim.keymap.set("n", "<M-t>", ":ToggleTerm direction=float<CR>") -- Открыть терминал в плавающем режиме

vim.keymap.set("n", "<s-t>", function() require("trouble").toggle() end) -- Открыть/Закрыть список проблем (расширение <Trouble>)

--[[ Если строка визуально разбита на несколько строк, то курсор перепрыгнет через них, так как считает, что это одна строка
При помощи настройки ниже курсор будет перемещаться по ним будто это разные строки --]]
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", {expr = true,})
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", {expr = true,})

--[[
Включить/Выключить подсветку Treesitter, то есть исп. подсветку от Treesitter или встроенную от LSP
Подсветка от Treesitter выдаёт более качественную подсветку по сравнению с LSP, но может замедлять работу Neovim в больших файлах
Благодаря этому хоткею можно переключаться между ними в зависимости от потребностей и личных приоритетов
--]]
vim.keymap.set("n", "<M-T>", function() if vim.b.ts_highlight then vim.treesitter.stop() else vim.treesitter.start() end end, { desc = "Toggle Treesitter Highlight" })

vim.keymap.set("n", "<leader>ct", ":ColorizerToggle<CR>") -- Включить/Отключить подсветку цветовых кодов

vim.keymap.set("n", "<S-Down>", ":m+1<CR>") -- Переместить строку под курсором на одну строку вниз
vim.keymap.set("n", "<S-Up>", ":m-2<CR>") -- Переместить строку под курсором на одну строку вверх

vim.keymap.set("n", "<С-k>", ":m+1<CR>") -- Переместить строку под курсором на одну строку вниз
vim.keymap.set("n", "<С-j>", ":m-2<CR>") -- Переместить строку под курсором на одну строку вверх
