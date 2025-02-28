# TODO:
# - Add CoC (Conquer of Completion) configuration? (see Anthon's config)
#   - Does is include LSP support? Or needs to install smtg else? (like lsp-zeros)
# - Add ALE (Asynchronous Lint Engine) configuration? (see Anthon's config)
# - Add vim-polygot? (see Anthon's config)
# - Add harpoon?
# - Add telescope? or fzf-vim? or both?
# - Add treesitter? or something else already does the job here?
# - Add undotree?
# - Add git integration (fugitive)? or gitgutter is enough?

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
      # fzf-vim -- Fuzzy file search integration. Invoke with :Files, :GFiles, etc. :Rg for ripgrep.
      copilot-vim
      vim-gitgutter # Shows git diff in the gutter. Customize with `:help gitgutter`.
      vim-commentary # Commenting plugin. Use `gcc` to comment out a line, `gc` to comment out the target of a motion.
      vim-surround
    ];
    extraConfig = ''
	colorscheme jellybeans
	let g:rainbow_active = 1
	set laststatus=2
	let g:airline_theme='bubblegum'
	" NERDTree configuration - Toggle NERDTree with <Ctrl-n>

	map <C-n> :NERDTreeToggle<CR>
	let NERDTreeShowHidden=1

	" Lightline configuration - Set colorscheme for Lightline
	let g:lightline = { 'colorscheme': 'wombat' }

	" Vim GitGutter - Enable git diff in gutter
	let g:gitgutter_enabled = 1
    '';
    extraLuaConfig = ''
	-- CONFIGS --
	vim.cmd("syntax on")
	vim.opt.backspace = { "indent", "eol", "start" }
	vim.cmd("filetype plugin indent on")
	vim.opt.wrap = false
	vim.opt.linebreak = true
	vim.opt.breakindent = true
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.cursorline = true
	vim.opt.cursorcolumn = true
	vim.opt.showmatch = true
	vim.opt.matchtime = 2
	vim.opt.termguicolors = true
	vim.opt.emoji = true
	vim.opt.scrolloff = 8
	-- TODO: set search (in)sensitivity

    	-- KEYMAPS --
    	vim.g.mapleader = " "

	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
	vim.keymap.set("n", "<C-d>", "<C-d>zz")
	vim.keymap.set("n", "<C-u>", "<C-u>zz")

	-- do not lose the clipboard content after pasting.
	vim.keymap.set("x", "<leader>p", [["_dP]])

	-- copy to system clipboard.
	vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
	vim.keymap.set("n", "<leader>Y", [["+Y]])
	
	-- don't save into the clipboard. (clipboard has a better
	-- name in nvim world, buffer or register or smth :P)
	
	vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")
	
	-- TODO vim quickfix stuff... what is quickfix???
	-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
	-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
	-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
	-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

	vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
    '';
  };
}
