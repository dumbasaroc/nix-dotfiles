{inputs, lib, pkgs, config, ...}: {
  # imports = [
  #   nixvim.homeModules.nixvim
  # ];

  programs.nixvim = {
    enable = true;

    # Language Servers
    lsp = {
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
      # LSP Config
      lspconfig = {
        enable = true;
        autoLoad = true;
      };
    };
  };
}
