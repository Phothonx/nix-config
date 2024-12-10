local lspconfig = require("lspconfig")

local servers = { "ccls", "ruff", "ocamllsp" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({})
end

lspconfig["lua_ls"].setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}

lspconfig["nixd"].setup({
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
      },
      options = {
        nixos = {
          expr = "(builtins.getFlake \"self\").nixosConfigurations.avalon.options",
        },
      },
    },
  },
})
