{ pkgs, ... }:
{
  programs.nixvim = {

    extraPlugins = with pkgs; [
      vimPlugins.iron-nvim
    ];

    plugins = {
      nvim-tree = {
        enable = true;
      };

      lualine = {
        enable = true;
        theme = "nightfly";
        globalstatus = true;
        componentSeparators = { 
          right = "";
          left = "";
        };
      };
      bufferline = {
        enable = true;
        alwaysShowBufferline = false;
        diagnostics = "nvim_lsp";
        numbers = "buffer_id";
        offsets = [
          {
            filetype = "NvimTree";
            text = "File Explorer";
            text_align = "left";
            separator = false;
          }
        ];
        showBufferCloseIcons = false;
        showCloseIcon = false;
        indicator.style = null;
      };

      nvim-autopairs = {
        enable = true;
        checkTs = true;
      };

      auto-save = {
        enable = true;
      };

      toggleterm = {
        enable = true;
        autochdir = true;
        insertMappings = false;
        settings.openMapping = "<leader>t";
        direction = "float";
        floatOpts = {
          border = "curved";
        };
      };

      molten = {
        enable = true;
        settings = {
          auto_image_popup = true;
        };
      };

      leap = {
        enable = true;
      };

      indent-blankline = {
        enable = true;
        settings = {
          exclude = {
            buftypes = [
              "terminal"
              "quickfix"
            ];
            filetypes = [
              ""
              "checkhealth"
              "help"
              "lspinfo"
              "TelescopePrompt"
              "TelescopeResults"
              "yaml"
            ];
          };
          indent.char = "│"; #  `▎`,`│`
          scope.enabled = false;
        };
      };

      better-escape = {
        enable = true;
        mapping = [ "jj" "jk" ];
      };

      which-key = {
        enable = true;
        operators = {
          gc = "Comments";
        };
      };

      treesitter = {
        enable = true;
        # folding = true;
        indent = true;
        incrementalSelection = {
          enable = true;
        };
      };

      lsp = {
        enable = true;
        servers = {
          pyright.enable = true;
          clangd.enable = true;
          ocamllsp.enable = true;
          nixd.enable = true;
        };
        keymaps = {
          #diagnostic = {
          #  "<leader>j" = "goto_next";
          #  "<leader>k" = "goto_prev";
          #};
          #silent = true;
          #lspBuf = {
          #  K = "hover";
          #  gD = "references";
          #  gd = "definition";
          #  gi = "implementation";
          #  gt = "type_definition";
          #};
        };
      };

      cmp = 
      let
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      in
      {
        enable = true;
        cmdline = {
          "/" = {
            mapping = mapping;
            sources = [
              { name = "buffer"; }
            ];
          };
          ":" = {
            mapping = mapping;
            sources = [
              { name = "path"; }
              {
                name = "cmdline";
                option = {
                  ignore_cmds = [
                    "Man"
                    "!"
                  ];
                };
              }
            ];
          };
        };
        settings = {
          mapping = mapping;
          snippet = {
            expand = "function(args) require('luasnip').lsp_expand(args.body) end";
            };
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "path"; }
            { name = "buffer"; }
          ];
          performance.max_view_entries = 10;
        };
      };
    };
  };
}
