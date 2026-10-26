---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim', "Snacks", "MiniFiles", "MiniIcons", "MiniTrailspace" }, },
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
  log_level = vim.lsp.protocol.MessageType.Warning,
}
