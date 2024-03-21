return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",

    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    keys = {
      { "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview" },
      { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "Show Markdown Preview" },
    },

    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_echo_preview_url = 1
    end,
  },
}
