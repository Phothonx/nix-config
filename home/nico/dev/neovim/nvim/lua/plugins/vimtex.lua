return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    -- nvim --headless -c "VimtexInverseSearch %l:%c '%f'"
    vim.g.vimtex_view_method = 'zathura'
    vim.vimtex_compiler_method = 'latexrun'
    vim.g.vimtex_view_forward_search_on_start = true

    vim.api.nvim_create_autocmd("VimLeavePre", {
      pattern = "*.tex",
      callback = function()
        vim.cmd("VimtexClean!")
      end,
    })
  end,
}
