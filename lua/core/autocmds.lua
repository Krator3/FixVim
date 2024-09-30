-- Удалять пустой буфер, который появляется после создания файла в Neotree и открытия любого файла
vim.api.nvim_create_autocmd('BufHidden', {
  desc = 'Delete [No Name] buffers',
  callback = function(data)
    if data.file == '' and vim.bo[data.buf].buftype == '' and not vim.bo[data.buf].modified then
      vim.schedule(function()
        pcall(vim.api.nvim_buf_delete, data.buf, {})
      end)
    end
  end,
})

-- Настройка окна терминала
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    -- Приписка _local задает параметр только для текущего буфера
    vim.opt_local.number = false -- Отключаем нумерование строк
    vim.opt_local.relativenumber = false -- Отключаем относительное нумерование строк
    vim.opt_local.foldcolumn = "0" -- Оключаем сворачивание текста
    vim.opt_local.signcolumn = "no" -- Отключаем показ меток ошибок, маркеров отладки и т.д.

    vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true }) -- Esc переключает Terminal Mode в Normal Mode
    vim.cmd("startinsert") -- Запуск терминала в Insert Mode при старте вместо дефолтного Normal Mode
  end,
})

-- Обрезать лишние пробелы в концах строк
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.cmd([[
         keeppatterns %s/\s\+$//e
      ]])
    end,
    group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true }),
})

-- Отключить подсветку результатов поиска в режиме вставки (Insert Mode)
local hiGroup = vim.api.nvim_create_augroup("highlight_group", { clear = false })
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    group = hiGroup,
    command = "setlocal nohlsearch",
})
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    group = hiGroup,
    command = "setlocal hlsearch",
})

-- Абсолютные номера строк в режиме вставки (Insert Mode) и относительные номера строк в обычном режиме (Normal Mode)
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function()
        vim.opt.relativenumber = false
        vim.opt.cursorline = false
    end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
        vim.opt.relativenumber = true
        vim.opt.cursorline = true
    end,
})
