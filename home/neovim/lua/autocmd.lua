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
    pattern = "nix",
    callback = function()
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2 -- this is for autoindenting
        vim.opt.softtabstop = 2
    end
})

-- autocmd("FileType", {
--     pattern = {"text", "markdown"},
--     command = "set colorcolumn=80"
-- })

autocmd("TextYankPost", {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})

autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)

        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
            vim.cmd("norm zz")
        end
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
        local recorded_register = vim.fn.reg_recorded()
        if recorded_register then
            vim.notify("Finished recording.", vim.log.levels.INFO, { title = "Macro" })
        end
    end,
})
