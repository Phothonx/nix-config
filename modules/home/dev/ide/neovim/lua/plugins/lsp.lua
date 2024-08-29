return {
  {
    "nvim-lspconfig",

    event = { "BufReadPost", "BufNewFile" },

    after = function()
      local lspconfig = require("lspconfig")
      local servers = { "ccls", "pyright", "ocamllsp", "nil_ls", "lua_ls", "marksman" }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({})
      end

      vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint", {text = "󰌵", texthl = "DiagnosticSignHint"})
    end,
  }
}
