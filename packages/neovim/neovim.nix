{inputs, ...}: {
  perSystem = {pkgs, ...}: {
    packages.neovim = inputs.wrappers.wrappers.neovim.wrap {
      inherit pkgs;

      settings.config_directory = ./nvim;

      specs.plugins = {
        data = with pkgs.vimPlugins; [
          # COLORSHEMES
          catppuccin-nvim

          # DEPS
          nvim-web-devicons

          # MINI & SNACKS
          mini-nvim
          snacks-nvim

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
        claude-code # CLI spawned by claudecode.nvim
        gcc
        tree-sitter
        cmake
        git
        curl
        fzf
        imagemagick
        sqlite
        mermaid-cli
        ghostscript
        trashy
        luarocks
        zathura
        biber
        pstree
        xdotool

        # LSP
        markdown-oxide
        stylua
        ccls
        lua-language-server
        basedpyright
        texlab
        ocamlPackages.ocaml-lsp
        nixd
        asm-lsp
        typescript-language-server
        bash-language-server

        # TS
        (pkgs.tree-sitter.withPlugins (ps:
          with ps; [
            tree-sitter-nix
            tree-sitter-lua
            tree-sitter-c
            tree-sitter-vim
            tree-sitter-bash
            tree-sitter-python
            tree-sitter-rust
            tree-sitter-javascript
            tree-sitter-typescript
            tree-sitter-json
            tree-sitter-toml
            tree-sitter-yaml
            tree-sitter-markdown
            tree-sitter-markdown-inline
          ]))
      ];
    };
  };
}
