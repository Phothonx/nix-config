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
    '';
  };
}
