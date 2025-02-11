{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # (vscode-with-extensions.override {
    #   vscodeExtensions = with vscode-extensions; [
    #     bbenoist.nix
    #     ms-python.python
    #     ms-azuretools.vscode-docker
    #     ms-vscode-remote.remote-ssh
    #     astro-build.astro-vscode
    #     github.copilot
    #   ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    #     {
    #       name = "owl-vision";
    #       publisher = "Odoo";
    #       version = "0.1.0";
    #       sha256 = "sha256-VbCKx8WvCx94m+2nHnF0hpgL0o0xNCyH6FZY88ccVL4=";
    #     }
    #   ];
    # })
  ];
}
