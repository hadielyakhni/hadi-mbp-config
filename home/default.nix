{ username, ...}:
{
  imports =
    [
      ./btop.nix
      ./direnv.nix
      ./editorconfig.nix
      ./fd.nix
      ./ffmpeg.nix
      # ./flutter.nix
      ./gh.nix
      ./git.nix
      ./gpg.nix
      ./htop.nix
      ./iproute2mac.nix
      ./minecraft.nix
      ./nushell.nix
      ./platformio.nix
      ./radare2.nix
      ./ripgrep.nix
      ./ruby.nix
      ./telegram.nix
      ./tmux.nix
      ./utm.nix
      ./vim.nix
      ./vscode.nix
      ./wget.nix
      ./wkhtmltopdf.nix
      ./wireguard.nix
      ./zsh.nix
    ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";


    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "23.11";
  };

  # allow unfree packages to be installed
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
