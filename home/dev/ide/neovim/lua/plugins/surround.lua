return {
  {
    "nvim-surround",

    event = "InsertEnter",

    after = function()
      require("nvim-surround").setup()
    end,
  }
}
