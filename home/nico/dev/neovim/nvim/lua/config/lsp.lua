vim.api.nvim_create_autocmd(
  'LspAttach',
  {
    desc = 'LSP actions',
    callback = function(event)
      -- see :h lsp-defaults
      local opts = { buffer = event.buf }
      vim.keymap.set({ 'n', 'x' }, 'grf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    end,
  }
)

vim.lsp.config(
  '*',
  {
    root_markers = { '.git' },
  }
)

vim.lsp.enable({
  'basedpyright',
  'luals',
  'nixd',
  'ccls',
  'ocamllsp',
  'asm_lsp',
  'ts_ls',
  'markdown_oxide',
  'texlab',
  'bashls',
})

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },
})
