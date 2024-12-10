return {
  {
    "Vigemus/iron.nvim",

    main = "iron.core",

    cmd = "IronRepl",

    ft = { "ml", "mli", "py" },

    keys = {
      {"<space>rs", "<cmd>IronRepl<cr>", desc = "Start iron Repl" },
      {"<space>rr", "<cmd>IronRestart<cr>", desc = "Restart Iron"},
      {"<space>rf", "<cmd>IronFocus<cr>", desc = "Focus Iron window"},
      {"<space>rh", "<cmd>IronHide<cr>", desc = "Hide Iron window"},
    },

    opts = {
      config = {
        scratch_repl = true,
        repl_definition = {
          ml = {
            command = {"utop"}
          },
          py = {
            command = {"python"}
          },
        },
        repl_open_cmd = "vertical botright 80 split",
      },

      keymaps = {
        send_motion = "<space>sc",
        visual_send = "<space>sc",
        send_file = "<space>sf",
        send_line = "<space>sl",
        send_until_cursor = "<space>su",
        send_mark = "<space>sm",
        mark_motion = "<space>mc",
        mark_visual = "<space>mc",
        remove_mark = "<space>md",
        cr = "<space>s<cr>",
        interrupt = "<space>s<space>",
        exit = "<space>sq",
        clear = "<space>cl",
      },

      highlight = {
        italic = true
      },

      ignore_blank_lines = true,
    },

  },
}