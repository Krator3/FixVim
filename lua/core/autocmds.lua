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
