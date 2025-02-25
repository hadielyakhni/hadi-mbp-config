# TODO:
# - Add CoC (Conquer of Completion) configuration? (see Anthon's config)
# - Add ALE (Asynchronous Lint Engine) configuration? (see Anthon's config)
# - Add vim-polygot? (see Anthon's config)
# - Add vim-surround?

{pkgs, nixvim, ...}: {
  programs.neovim = {
    enable = true;
    # being able to use `vi` when something is wrong with neovim is useful
    viAlias = false;
    vimAlias = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      vim-lastplace
      vim-airline # Provides an enhanced status and tabline. To customize: :help airline
      vim-airline-themes # Themes for vim-airline. Change theme with `let g:airline_theme='theme_name'`
      rainbow # Colors matching parentheses. No further configuration required.
      jellybeans-vim
      nerdtree # Filesystem explorer. Toggle with <Ctrl-n>, customize with `:help NERDTree`.
      fzf-vim # Fuzzy file search integration. Invoke with :Files, :GFiles, etc. :Rg for ripgrep.
      copilot-vim
      vim-gitgutter # Shows git diff in the gutter. Customize with `:help gitgutter`.
      vim-commentary # Commenting plugin. Use `gcc` to comment out a line, `gc` to comment out the target of a motion.
    ];
    extraConfig = ''
      syntax on
      set backspace=indent,eol,start
      filetype plugin indent on
      set nowrap
      set linebreak
      set breakindent
      set number! relativenumber!
      set cursorline
      set cursorcolumn
      set showmatch
      set matchtime=2
      set termguicolors
      set emoji
      colorscheme jellybeans
      let g:rainbow_active = 1
      set laststatus=2
      let g:airline_theme='bubblegum'
      " NERDTree configuration - Toggle NERDTree with <Ctrl-n>
      map <C-n> :NERDTreeToggle<CR>
      let NERDTreeShowHidden=1

      " FZF and Ripgrep integration for enhanced searching
      let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
      " Use Ripgrep with FZF for searching

      " Lightline configuration - Set colorscheme for Lightline
      let g:lightline = { 'colorscheme': 'wombat' }

      " Vim GitGutter - Enable git diff in gutter
      let g:gitgutter_enabled = 1
    '';
  };
}
