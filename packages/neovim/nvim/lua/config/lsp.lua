vim.api.nvim_create_autocmd(
  'LspAttach',
  {
    desc = 'LSP actions',
    callback = function(event)
      -- see :h lsp-defaults for the builtin grn/gra/grr/gri/K/... maps
      local opts = { buffer = event.buf }
      vim.keymap.set({ 'n', 'x' }, 'grf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if not client then return end

      -- highlight other occurrences of the symbol under the cursor
      if client:supports_method('textDocument/documentHighlight') then
        local hl = vim.api.nvim_create_augroup('lsp_doc_hl_' .. event.buf, { clear = true })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          group = hl, buffer = event.buf, callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          group = hl, buffer = event.buf, callback = vim.lsp.buf.clear_references,
        })
      end

      -- inlay hints on by default (toggle with <leader>uh)
      if client:supports_method('textDocument/inlayHint') then
        vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
      end

      -- format on save with whatever capable server is attached
      if client:supports_method('textDocument/formatting') then
        local fmt = vim.api.nvim_create_augroup('lsp_fmt_' .. event.buf, { clear = true })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = fmt, buffer = event.buf,
          callback = function() vim.lsp.buf.format({ bufnr = event.buf }) end,
        })
      end
    end,
  }
)

vim.lsp.config(
  '*',
  {
    -- advertise blink.cmp's completion capabilities to every server
    -- (blink only exposes the helper; it does not wire this up itself)
    capabilities = require('blink.cmp').get_lsp_capabilities(),
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
  severity_sort = true,
  -- compact inline text on non-focused lines, full multi-line on the cursor line
  virtual_text = { current_line = false },
  virtual_lines = { current_line = true },
})
