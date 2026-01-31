---@type vim.lsp.Config
return {
  cmd = { 'ccls' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = { ".git", ".ccls"},
  init_options = {
    clang = {
      extraArgs = {
        "-I./src",
        "-I./lib",
        "-I./include",
        "-std=c99",
        "-Wall",
        "-Wextra",
        -- battlefield immersion options
        -- "-Wpedantic",
        -- "-fsanitize=address,undefined,leak",
      },
    },
  },
}
