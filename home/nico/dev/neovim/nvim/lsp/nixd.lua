---@type vim.lsp.Config
return {
  cmd = { 'nixd', '--inlay-hints=true', '--semantic-tokens=true' },
  settings = {
    nixd = {
      nixpkgs = { expr = "import <nixpkgs> { }", },
      formatting = { command = { "alejandra" }, },
      options = {
        nixos = { expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.avalon.options', },
      },
    },
  },
  filetypes = { 'nix' },
  single_file_support = true,
  root_markers = { 'flake.nix', '.git' },
}
