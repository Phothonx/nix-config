{ ... }:
let
  def = {
    mode = ["n" "v"];
    options.silent = true;
  };
in
{
  programs.nixvim.keymaps = 
    [
    # Nvim Tree
    {
      key = "<leader>e";
      action = "<cmd>:NvimTreeFocus<CR>";
      options.desc = "Nvim Tree Focus";
    }

    # SnipRun
    {
      key = "<leader>ss";
      action = "<cmd>:SnipRun<CR>";
      options.desc = "Snip Run";
    }
    {
      key = "<leader>sr";
      action = "<cmd>:SnipReset<CR>";
      options.desc = "Snip Reset";
    }
    {
      key = "<leader>sq";
      action = "<cmd>:SniClose<CR>";
      options.desc = "Snip Close";
    }
 
    # Resize with arrows
    {
      key = "<C-Up>";
      action = ":resize -2<CR>";
      options.desc =  "Resize Up";
    }
    {
      key = "<C-Down>";
      action = ":resize +2<CR>";
      options.desc =  "Resize Down";
    }
    {
      key = "<C-Left>";
      action = ":vertical resize -2<CR>";
      options.desc =  "Resize Left";
    }
    {
      key = "<C-Right>";
      action = ":vertical resize +2<CR>";
      options.desc =  "Resize Right";
    }

    # Navigate BUffers
    {
      key = "<tab>";
      action = "<cmd>BufferLineCycleNext<CR>";
      options.desc = "Buffer Cycle Next";
    }
    {
      key = "<S-tab>";
      action = "<cmd>BufferLineCyclePrev<CR>";
      options.desc = "Buffer Cycle Previous";
    }
    {
      key = "<leader>q";
      action = "<cmd>bp<bar>sp<bar>bn<bar>bd<CR>";
      options.desc = "Buffer Close";
    } 
    ];
}
