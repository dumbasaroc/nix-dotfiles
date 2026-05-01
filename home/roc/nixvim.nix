{inputs, lib, pkgs, config, ...}: {
  # imports = [
  #   nixvim.homeModules.nixvim
  # ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "barbar.nvim"
  ];
  
  programs.nixvim = {
    enable = true;

    # Language Servers
    lsp = {
      inlayHints.enable = true;
      servers = {
        clangd = {
          enable = true;
        };

        lua_ls = {
          enable = true;
        };

        rust_analyzer = {
          enable = true;
        };
      };
    };

    plugins = {

      # Barbar - Tabs
      barbar = {
        enable = true;
        autoLoad = true;

        keymaps = {

        };
      };

      # Code Completion
      cmp = {
        enable = true;
        autoLoad = true;

        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
          ];

          mapping = {
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<CR>" = "cmp.mapping.confirm({select = true})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          };
        };

        settings.completion.autocomplete = [
          "require('cmp.types').cmp.TriggerEvent.TextChanged"
        ];
      };

      cmp-nvim-lsp = {
        enable = true;
        autoLoad = true;
      };

      cmp_luasnip = {
        enable = true;
        autoLoad = true;
      };

      # LSP Config
      lspconfig = {
        enable = true;
        autoLoad = true;
      };

      luasnip = {
        enable = true;
        autoLoad = true;
      };

      # Telescope - File Browser
      telescope = {
        enable = true;
        autoLoad = true;

        extensions = {
          file-browser.enable = true;
        };
      };

      # Web Devicons - needed for Telescope, Barbar
      web-devicons = {
        enable = true;
        autoLoad = true;
      };
    };
  };
}
