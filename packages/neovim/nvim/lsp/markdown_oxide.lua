---@type vim.lsp.Config
return {
  root_markers = { '.git', '.obsidian', '.moxide.toml' },
  filetypes = { 'markdown', 'vimwiki' },
  cmd = { 'markdown-oxide' },
}
