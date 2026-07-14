vim.opt.runtimepath:append(vim.fn.stdpath("config") .. "/parser")

vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if lang then
      pcall(vim.treesitter.start, ev.buf, lang)

      vim.schedule(function()
        if vim.api.nvim_buf_is_valid(ev.buf) then
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end)
    end
  end,
})
