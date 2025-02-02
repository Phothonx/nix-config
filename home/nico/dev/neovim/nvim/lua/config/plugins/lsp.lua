local servers = {
  lua_ls = {
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
  },

  pyright = {
    on_attach = function(_, bufnr)
      -- fuck 4 space tabs, all my homies hate 4 space tab
      vim.api.nvim_buf_set_option(bufnr, 'shiftwidth', 2)
      vim.api.nvim_buf_set_option(bufnr, 'tabstop', 2)
      vim.api.nvim_buf_set_option(bufnr, 'softtabstop', 2)
      vim.api.nvim_buf_set_option(bufnr, 'expandtab', true)
    end,
  },

  ccls = {},

  ocamllsp = {},

  nixd = {
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
  },
}


local lspconfig = require('lspconfig')

for server, config in pairs(servers) do

  -- passing config.capabilities to blink.cmp merges with the capabilities in your
  -- `opts[server].capabilities, if you've defined it
  config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
  lspconfig[server].setup(config)

end
