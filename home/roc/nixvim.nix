{inputs, lib, pkgs, config, ...}: {
  # imports = [
  #   nixvim.homeModules.nixvim
  # ];

  programs.nixvim = {
    enable = true;

    plugins = {

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
            installRustc = true;
            installCargo = true;
          };
        };
      };
      
      # LSP Config
      lspconfig = {
        enable = true;
        autoLoad = true;
      };
    };
  };
}
