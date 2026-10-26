-- vimwiki buffers are markdown underneath
vim.treesitter.language.register("markdown", "vimwiki")

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    if not pcall(vim.treesitter.start, args.buf) then return end
    -- TS indent only where the parser ships an indents query (not latex, ...),
    -- otherwise keep the ftplugin/smartindent behaviour
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if lang and vim.treesitter.query.get(lang, "indents") then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
