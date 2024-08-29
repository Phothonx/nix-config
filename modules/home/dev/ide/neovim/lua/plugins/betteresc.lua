return {
  {
    "better-escape.nvim",

    event = "InsertEnter",

    keys = {
      { "jk", mode = "i", desc = "Fast escape" },
      { "jj", mode = "i", desc = "Fast escape" },
    },

    after = function()
      require("better_escape").setup({
        timeout = 300;
        mapping = {
          i = { -- clear empty line with jk
            j = {
              k = function()
                vim.api.nvim_input("<esc>")
                local current_line = vim.api.nvim_get_current_line()
                if current_line:match("^%s+j$") then
                  vim.schedule(function()
                    vim.api.nvim_set_current_line("")
                  end)
                end
              end
            },
          },
        },
      })
    end,
  }
}
