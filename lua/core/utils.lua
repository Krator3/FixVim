-- Функция для правильного и более удобного (функционального) закрытия буфера
_G.close_and_go_right = function()
	local current_buf = vim.api.nvim_get_current_buf()
	local buf_list = vim.fn.getbufinfo({ buflisted = 1 })

	-- Если только один буфер, закрываем и создаем новый
	if #buf_list == 1 then
		vim.cmd("enew") -- открывает новый пустой буфер
		vim.cmd("bdelete! " .. current_buf)
		return
	end

	-- -- Если только один буфер, ничего не делаем
	-- if #buf_list == 1 then
	-- 	return
	-- end

	-- Находим следующий или предыдущий буфер
	local next_bufnr
	for i, buf in ipairs(buf_list) do
		if buf.bufnr == current_buf then
			if i == #buf_list then
				-- Если текущий буфер последний, идем к предыдущему
				next_bufnr = buf_list[i - 1].bufnr
			else
				-- Иначе идем к следующему
				next_bufnr = buf_list[i % #buf_list + 1].bufnr
			end
			break
		end
	end

	-- Переходим к выбранному буферу и закрываем текущий
	vim.cmd("buffer " .. next_bufnr)
	vim.cmd("bdelete! " .. current_buf)
end
