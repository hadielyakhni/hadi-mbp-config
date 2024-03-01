{ config, pkgs, ... }:

let
  # Define any custom plugins here if necessary. You can add plugins that are not
  # directly available in nixpkgs by specifying their source and build instructions.
  customVimPlugins = with pkgs.vimPlugins; {
    # Example custom plugin definition
    # myCustomPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix { ... };
  };

in
{
  programs.vim = {
    enable = true;
    enableSensible = true; # This option enables a set of sensible default settings for Vim.

    extraKnownPlugins = customVimPlugins;

    plugins = with pkgs.vimPlugins; [
      {
        names = [
          "vim-airline" # Provides an enhanced status and tabline. To customize: :help airline
          "vim-airline-themes" # Themes for vim-airline. Change theme with `let g:airline_theme='theme_name'`
          "rainbow" # Colors matching parentheses for easier readability. No further configuration required.
          "jellybeans-vim"
          "nerdtree" # Filesystem explorer. Toggle with <Ctrl-n>, customize with `:help NERDTree`.
          "fzf-vim" # Fuzzy file search integration. Invoke with :Files, :GFiles, etc.
          "vim-devicons" # Adds file icons to Vim plugins like NERDTree. Requires a patched font.
          #"coc-nvim" # IntelliSense engine. Configure with `:help coc-nvim`.
          # CoC extensions for various languages and snippets. Add more as needed.
          #"coc-json"
          #"coc-css"
          #"coc-html"
          #"coc-python"
          #"coc-snippets"
          "vim-polyglot" # Language pack supporting a wide array of languages.
          "vim-lightline-coc" # Lightweight statusline/tabline, integrates with CoC. Customize in `g:lightline`.
          "vim-gitgutter" # Shows git diff in the gutter. Customize with `:help gitgutter`.
          "ale" # Asynchronous linting/fixing framework. Configure with `:help ale`.
        ];
      }
    ];

    vimConfig = let
      # Here you can define additional Vim settings or functions as needed.
      customSettings = ''
        " NERDTree configuration - Toggle NERDTree with <Ctrl-n>
        map <C-n> :NERDTreeToggle<CR>
        let NERDTreeShowHidden=1

        " FZF configuration - Customize FZF window size
        let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

        " CoC (Conquer of Completion) configuration
        " For detailed setup and shortcuts, visit: https://github.com/neoclide/coc.nvim
        " Example: To add more CoC extensions, modify the list below
        let g:coc_global_extensions = ['coc-json', 'coc-css', 'coc-html', 'coc-python', 'coc-snippets']

        " Lightline configuration - Set colorscheme for Lightline
        let g:lightline = { 'colorscheme': 'wombat' }

        " Vim GitGutter - Enable git diff in gutter
        let g:gitgutter_enabled = 1

        " ALE Configuration - Enable fixing on save and explicit linter configuration
        let g:ale_fix_on_save = 1
        let g:ale_linters_explicit = 1
      '';
    in ''
      syntax on
      set backspace=indent,eol,start
      filetype plugin indent on
      set relativenumber
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
      ${customSettings}
      " Additional note: To customize this setup further, consider modifying the 'customSettings'
      " string with your preferred Vim settings or plugin configurations. You can also add more
      " plugins to the 'plugins' list by specifying their names. For plugin-specific configurations,
      " refer to the respective plugin's documentation.
    '';
  };
}
