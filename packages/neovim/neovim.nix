{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.neovim = inputs.wrappers.wrappers.neovim.wrap {
      inherit pkgs;

      settings.config_directory = ./nvim;

      # read from lua with require(vim.g.nix_info_plugin_name)(nil, "info", <key>)
      info = {
        # snacks.picker frecency/history db (ffi-loaded, not found on its own)
        sqlite3_path = "${pkgs.sqlite.out}/lib/libsqlite3.so";
      };

      specs.plugins = {
        data = with pkgs.vimPlugins; [
          # COLORSHEMES
          catppuccin-nvim

          # MINI & SNACKS
          mini-nvim
          snacks-nvim

          # TS: parsers + queries (the nvim runtime only bundles a handful)
          (nvim-treesitter.withPlugins (p:
            with p; [
              bash
              bibtex
              c
              css
              html
              java
              javascript
              json
              latex
              lua
              markdown
              markdown_inline
              nix
              ocaml
              python
              query
              regex
              rust
              toml
              tsx
              typescript
              vim
              vimdoc
              yaml
            ]))

          # OTHER
          vimwiki
          friendly-snippets
          blink-cmp
          flash-nvim
          which-key-nvim
          claudecode-nvim
        ];
      };

      runtimePkgs = with pkgs; [
        # PACKAGES
        imagemagick # snacks.image
        ghostscript # snacks.image (pdf)
        zathura # texlab forward search
        biber

        # LSP & tools
        markdown-oxide
        ccls
        lua-language-server
        basedpyright
        ruff
        texlab
        ocamlPackages.ocaml-lsp
        nixd
        alejandra
        asm-lsp
        typescript-language-server
        bash-language-server
        shellcheck # bashls diagnostics
        shfmt # bashls formatting
        jdt-language-server
      ];
    };
  };
}
