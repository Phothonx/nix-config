return {
  "benlubas/molten-nvim",
  dependencies = { "3rd/image.nvim" },
  build = ":UpdateRemotePlugins",
  cmd = {
    "MoltenInfo",
    "MoltenInit",
    "MoltenRestart",
  },
  keys = {
    { "<localleader>mi", mode = {"n"}, ":MoltenInit<CR>", desc = "Initialize the plugin" },
    { "<localleader>e",  mode = {"n"}, ":MoltenEvaluateOperator<CR>", desc = "Run operator selection" },
    { "<localleader>rl", mode = {"n"}, ":MoltenEvaluateLine<CR>", desc = "Evaluate line" },
    { "<localleader>rr", mode = {"n"}, ":MoltenReevaluateCell<CR>", desc = "Re-evaluate cell" },
    { "<localleader>r",  mode = {"v"}, ":<C-u>MoltenEvaluateVisual<CR>gv", desc = "Evaluate visual selection" },
    { "<localleader>rd", mode = {"n"}, ":MoltenDelete<CR>", desc = "molten delete cell" },
    { "<localleader>oh", mode = {"n"}, ":MoltenHideOutput<CR>", desc = "hide output" },
    { "<localleader>os", mode = {"n"}, ":noautocmd MoltenEnterOutput<CR>", desc = "show/enter output" },
    { "<localleader>ob", mode = {"n"}, ":MoltenOpenInBrowser<CR>", desc = "Open in browser" },
  },
  init = function()
    vim.g.molten_open_cmd = "firefox"
    vim.g.molten_auto_open_output = false
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_output_win_border = { "", "━", "", "" }
    vim.g.molten_output_show_more = true
  end,
}
