local autocmd = vim.api.nvim_create_autocmd

autocmd("TermOpen", {
    pattern = "*",
    command = "set norelativenumber signcolumn=no"
})

autocmd("BufWritePost", {
    pattern = "*picom.conf",
    command = "!pkill picom && picom -b",
})

autocmd("BufWritePre", {
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

autocmd("FileType", {
    pattern = "json",
    command = "nnoremap <leader>f :.!jq .<CR>"
})

autocmd("FileType", {
    pattern = {"text", "markdown"},
    command = "set colorcolumn=80"
})

local yank_group = vim.api.nvim_create_augroup('HighlightYank', {})

autocmd("TextYankPost", {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 50,
        })
    end,
})

-- Needs more work

-- autocmd("BufReadPost", {
--     pattern = '*',
--     callback = function()
--         local cursor_pos = vim.api.nvim_win_get_cursor(0)
--         local line = cursor_pos[1]
--         local column = cursor_pos[2]
--
--         vim.api.nvim_buf_set_mark(1, ".", line, column, {})
--     end,
-- })

-- It's not quite pure lua but it works
autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        vim.api.nvim_exec('silent! normal! g`"zv', false)
    end,
})

autocmd("RecordingEnter", {
    pattern = "*",
    callback = function()
        local recording_register = vim.fn.reg_recording()

        vim.notify("Recording to @" .. recording_register, vim.log.levels.INFO, { title = "Macro" })
    end,
})

autocmd("RecordingLeave", {
    pattern = "*",
    callback = function()
        vim.notify("Finished recording.", vim.log.levels.INFO, { title = "Macro" })
    end,
})
