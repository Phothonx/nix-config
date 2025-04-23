return {
  "whonore/Coqtail",
  ft = { "v" },
  cmd = { "RocqStart", "Rocq", "Coq" },
  keys = {
    { "<leader>cc", mode = {"n"}, "<CMD>RocqStart<CR>", desc = "Launch Coqtail in the current buffer" },
  },
}
