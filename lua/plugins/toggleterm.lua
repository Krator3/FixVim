require("toggleterm").setup({ open_mapping = [[<c-\>]] })

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    -- Переключение между командным режимом и перемещением по терминалу
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "jj", [[<C-\><C-n>]], opts)

    vim.keymap.set("t", "<M-t>", [[<Cmd>wincmd h<CR>]], opts) -- Открыть/Закрыть терминал
    vim.keymap.set("t", "<M-е>", [[<Cmd>wincmd h<CR>]], opts) -- Открыть/Закрыть терминал
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
