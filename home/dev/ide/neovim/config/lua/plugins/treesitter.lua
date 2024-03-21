return {
  {
    "nvim-treesitter/nvim-treesitter",

    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",

    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,

    opts = {
      ensure_installed = {
        "c",
        "lua",
        "luadoc",
        "vim",
        "vimdoc",
        "python",
        "ocaml",
        "markdown",
        "regex",
      },
      highlight = { enable = true, },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
      },
    }
  }
}
