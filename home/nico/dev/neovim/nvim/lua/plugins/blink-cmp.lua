return {
  "saghen/blink.cmp",
  deps = { "echasnovski/mini.nvim", },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    enabled = function() return not vim.tbl_contains({ "markdown", "norg", "txt" }, vim.bo.filetype) end,

    keymap = { preset = 'default' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 500 },
      list = { selection = { preselect = false, } },
      menu = {
        auto_show = true,
        draw = {
          padding = { 0, 1 }, -- padding only on right side
          components = {
            kind_icon = {
              text = function(ctx) return ' ' .. ctx.kind_icon .. ctx.icon_gap .. ' ' end
            }
          }
        }
      }
    },

    sources = {
      -- default = { 'lsp', 'path', 'snippets', 'buffer' },
      default = function(ctx)
        local success, node = pcall(vim.treesitter.get_node)
        if success and node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
          return { 'buffer', 'path' }
        elseif vim.bo.filetype == 'lua' then
          return { 'lsp', 'path' }
        else
          return { 'lsp', 'path', 'snippets', 'buffer' }
        end
      end,

      providers = {
        buffer = {
          opts = {
            -- or (recommended) filter to only "normal" buffers
            get_bufnrs = function()
              return vim.tbl_filter(function(bufnr)
                return vim.bo[bufnr].buftype == ''
              end, vim.api.nvim_list_bufs())
            end
          }
        }
      },
    },

    fuzzy = {
      implementation = "prefer_rust_with_warning",
      sorts = { 'exact', 'score', 'sort_text', },
    },

    cmdline = {
      keymap = { preset = "inherit", },
      completion = {
        list = { selection = { preselect = false, } },
        menu = { auto_show = true, },
      },
    },
  },
  opts_extend = { "sources.default" }
}
