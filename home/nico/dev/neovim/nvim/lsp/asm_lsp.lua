---@type vim.lsp.Config
return {
  cmd = { 'asm-lsp' },
  filetypes = { 'asm', 'vmasm', 's' },
  root_markers = { '.asm-lsp.toml', '.git' },
  single_file_support = true,
}
