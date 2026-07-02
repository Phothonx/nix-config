---@type vim.lsp.Config
return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'ruff.toml',
    '.ruff.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    '.git',
  },
  single_file_support = true,
  -- let basedpyright own hover; ruff only does lint + format + code actions
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
  end,
}