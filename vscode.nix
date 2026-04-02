# VSCode Configuration

{ config, lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        # Theming/Aesthetics
        pkief.material-icon-theme
        
        # Nix
        jnoortheen.nix-ide
        # arrterian.nix-env-selector
	oops418.nix-env-picker

        # ClangD
        llvm-vs-code-extensions.vscode-clangd

        # Rust
        rust-lang.rust-analyzer
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "andromeda";
          publisher = "EliverLara";
	  version = "1.10.0";
	  sha256 = "sha256-W84m9b3Dzq2LjUpa/0hzSWbVokaxI4IDEaCySWDF9Uk=";
        }
      ];
    })
  ];

}
