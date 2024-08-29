return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
		  "hrsh7th/cmp-nvim-lsp",
		  "hrsh7th/cmp-buffer",
		  "hrsh7th/cmp-path",
		  "hrsh7th/cmp-cmdline",
		  "saadparwaiz1/cmp_luasnip",
		  { "L3MON4D3/LuaSnip", version = "v2.*", dependencies = { "rafamadriz/friendly-snippets" },},
    },

    event = { "InsertEnter", "CmdlineEnter" },

    config = function(_, opts)
      local cmp = require("cmp")

      require("luasnip.loaders.from_vscode").lazy_load()

      vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
      require("cmp").setup(opts)

      -- `:` cmdline setup.
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })
    end,

    opts = function()
      local luasnip = require("luasnip")
      local cmp = require("cmp")
      local select_opts = {behavior = cmp.SelectBehavior.Select}

      return {
        snippet = {
          expand = function(args)
             luasnip.lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {},
        mapping = {
          ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
          ['<Down>'] = cmp.mapping.select_next_item(select_opts),
          ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
          ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-y>'] = cmp.mapping.confirm({select = true}),
          ['<CR>'] = cmp.mapping.confirm({select = false}),
          ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1
            if cmp.visible() then
              cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
              fallback()
            else
              cmp.complete()
            end
          end, {'i', 's'}),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item(select_opts)
            else
              fallback()
            end
          end, {'i', 's'}),
        },
        sources = {
          { name = 'nvim_lsp', keyword_length = 2 },
          { name = 'luasnip', keyword_length = 2 }, -- For luasnip users.
          { name = 'buffer', keyword_length = 3 },
          { name = "path", keyword_length = 4 },
        }
      }
    end,
  }
}
