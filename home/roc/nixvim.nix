{inputs, lib, pkgs, config, ...}: {
  # imports = [
  #   nixvim.homeModules.nixvim
  # ];

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
      # Code Completion
      cmp = {
        enable = true;
        autoLoad = true;
      };

      cmp-nvim-lsp = {
        enable = true;
        autoLoad = true;
      };

      # LSP Config
      lspconfig = {
        enable = true;
        autoLoad = true;
      };
    };
  };
}
