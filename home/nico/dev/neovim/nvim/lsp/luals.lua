---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  settings = {
    Lua = {
      -- diagnostics = { globals = {'vim', "Snacks", "Mini", "MiniFiles"}, },
      format = { preview = true, },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME }
      },
    },
  },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}
