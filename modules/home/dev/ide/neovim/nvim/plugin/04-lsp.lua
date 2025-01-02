local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- fuck 4 space tabs, all my homies hate 4 space tab
    vim.api.nvim_buf_set_option(bufnr, 'shiftwidth', 2)
    vim.api.nvim_buf_set_option(bufnr, 'tabstop', 2)
    vim.api.nvim_buf_set_option(bufnr, 'softtabstop', 2)
    vim.api.nvim_buf_set_option(bufnr, 'expandtab', true)
  end,
})


lspconfig.ccls.setup({
  capabilities = capabilities,
})

lspconfig.ocamllsp.setup({
  capabilities = capabilities,
})

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      format = {
        preview = true,
      },
    },
  },
}

lspconfig.nixd.setup({
  capabilities = capabilities,
  cmd = { "nixd" },
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
