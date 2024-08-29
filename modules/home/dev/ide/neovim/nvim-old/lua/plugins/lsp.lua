return {
    {
    "folke/neodev.nvim",

    config = function (_, opts)
      require("neodev").setup(opts)
    end,

    opts = {}
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {"folke/neodev.nvim",},

    lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall" },

    config = function()
      require("neodev").setup({}) -- Neodev
      -- Setup language servers.
      local lspconfig = require('lspconfig')
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local servers = { 'ccls', 'pyright', 'ocamllsp', "nil_ls" }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
        }
      end

      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = {'vim'}
            }
          }
        }
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function()
          local bufmap = function(mode, lhs, rhs)
            local opts = {buffer = true}
            vim.keymap.set(mode, lhs, rhs, opts)
          end
          -- Displays hover information about the symbol under the cursor
          bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
          -- Jump to the definition
          bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
          -- Jump to declaration
          bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
          -- Lists all the implementations for the symbol under the cursor
          bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
          -- Jumps to the definition of the type symbol
          bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
          -- Lists all the references 
          bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
          -- Displays a function's signature information
          bufmap('n', 'gy', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
          -- Renames all references to the symbol under the cursor
          bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
          -- Selects a code action available at the current cursor position
          bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
          -- Show diagnostics in a floating window
          bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
          -- Move to the previous diagnostic
          bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
          -- Move to the next diagnostic
          bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
        end
      })
    end,
  }
}
