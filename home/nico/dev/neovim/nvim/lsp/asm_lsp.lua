---@type vim.lsp.Config
return {
  cmd = { 'asm-lsp' },
  filetypes = { 'asm', 'vmasm', 's' },
  root_markers = { '.asm-lsp.toml', '.git' },
  single_file_support = true,
  init_options = {
    assembler = "nasm",            -- valid assembler value
    instruction_set = "x86-64",
    flags = {"-f", "elf64"},
    includePaths = {"include", "lib", "src"},
  }
}
