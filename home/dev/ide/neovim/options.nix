{ ... }:
{
  programs.nixvim = {
    opts = {

      # STARTUP
      swapfile = false;
      undofile = true;

      # QOL
      clipboard = "unnamedplus";
      ignorecase = true;
      showmode = false;
      termguicolors = true;
      timeoutlen = 300;
      updatetime = 250;
      mouse = "a"; 

      # INDENT
      smartindent = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;

      # NAVIGATION
      cursorline = true;
      number = true;
      numberwidth = 2;
      signcolumn = "yes";
      wrap = false;
      scrolloff = 8;
      sidescrolloff = 8;
      splitbelow = true;
      splitright = true;
    };

    extraConfigLua = ''
      vim.opt.shortmess:append "IcA"
      vim.opt.whichwrap:append("<,>,h,l,[,]") 

      local view = require("iron.view")
      require("iron.core").setup({
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
          repl_open_cmd = view.split.vertical.botright(80)
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
      })
    '';
  };
}
