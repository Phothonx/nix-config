---@type vim.lsp.Config
return {
  cmd = { 'asm-lsp' },
  filetypes = { 'asm', 'vmasm' },
  root_markers = { '.asm-lsp.toml', '.git' },
  init_options = {
    flags = {"-f", "elf64"},
    includePaths = {"include", "lib", "src"},
  }
}
