---@type vim.lsp.Config
return {
  cmd = { 'ccls' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = { ".git", ".ccls"}
}
