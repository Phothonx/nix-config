---@type vim.lsp.Config
return {
  cmd = {
    'clangd',
    '--background-index',
    '--clang-tidy', -- clang-tidy diagnostics (checks come from the project's .clang-tidy)
    '--header-insertion=iwyu',
    '--completion-style=detailed',
    -- no --query-driver: it disables the clang-tools wrapper's include paths (glibc + devshell
    -- NIX_CFLAGS_COMPILE), which breaks every file without a compile_commands.json
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    '.git',
  },
  init_options = {
    -- used only when the file has no compile_commands.json / compile_flags.txt entry
    fallbackFlags = {
      '-I./src',
      '-I./lib',
      '-I./include',
      '-Wall',
      '-Wextra',
    },
  },
}
