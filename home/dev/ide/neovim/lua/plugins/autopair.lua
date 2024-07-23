return {
  {
    "nvim-autopairs",

    event = "InsertEnter",

    after = function()
      require("nvim-autopairs").setup({
        enable_check_bracket_line = false,
        check_ts = true,
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
      })
    end,
  }
}
