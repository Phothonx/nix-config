-- absolute path: a relative `./.` only resolves when nvim is started from the repo
local flake = '(builtins.getFlake "git+file://' .. vim.env.HOME .. '/nix-config")'

---@type vim.lsp.Config
return {
  cmd = { 'nixd', '--inlay-hints=true', '--semantic-tokens=true' },
  settings = {
    nixd = {
      -- the flake's pinned nixpkgs instead of whatever <nixpkgs> is on NIX_PATH
      nixpkgs = { expr = 'import ' .. flake .. '.inputs.nixpkgs { }' },
      formatting = { command = { "alejandra" }, },
      options = {
        nixos = { expr = flake .. '.nixosConfigurations.avalon.options' },
      },
    },
  },
  filetypes = { 'nix' },
  root_markers = { 'flake.nix', '.git' },
}
