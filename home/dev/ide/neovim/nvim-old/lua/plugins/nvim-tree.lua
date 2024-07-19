return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons", },
    
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys= { { "<leader>e", "<cmd>NvimTreeFocus<cr>", desc = "NvimTree" }, },

    init = function()
      -- disable netrw at the very start of your init.lua
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1      
      -- optionally enable 24-bit colour
      vim.opt.termguicolors = true
      -- autoclose https://github.com/ppwwyyxx
      vim.api.nvim_create_autocmd("QuitPre", {
        callback = function()
          local invalid_win = {}
          local wins = vim.api.nvim_list_wins()
          for _, w in ipairs(wins) do
            local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
            if bufname:match("NvimTree_") ~= nil then
              table.insert(invalid_win, w)
            end
          end
          if #invalid_win == #wins - 1 then
            -- Should quit, so we close all invalid windows.
            for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
          end
        end
      })
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,

    opts = {
      hijack_cursor = true,
      reload_on_bufenter = true,
      view = {
        width = {
          min = 25,
          max = 40,
        },
      },
      renderer = {
        highlight_opened_files = "all",
        indent_markers = { enable = true, },
        icons = { show = { folder_arrow = false, }, },
      },
      git = { enable = true, },
      diagnostics = { enable = true, },
      modified = { enable = true, },
    }
  }
}
