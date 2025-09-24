# TODO:
# - Add CoC (Conquer of Completion) configuration? (see Anthon's config)
#   - Does is include LSP support? Or needs to install smtg else? (like lsp-zeros)
# - Add ALE (Asynchronous Lint Engine) configuration? (see Anthon's config)
# - Add harpoon?
# - Add telescope?
# - Add treesitter? or something else already does the job here?
# - Add fugitive? (adds functionality to fzf too, like searching commits
# - Add ale? (For linting -- better than coc-eslint and coc-prettier?)
# - Add vim-which-key? (for keybindings reminders)

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
      copilot-vim
      vim-gitgutter # Shows git diff in the gutter. Customize with `:help gitgutter`.
      vim-commentary # Commenting plugin. Use `gcc` to comment out a line, `gc` to comment out the target of a motion.
      vim-surround
      vim-wakatime
      vim-abolish
      fzf-vim
      vim-fugitive
      vim-rhubarb
      # to be revisited and maybe removed #
      coc-nvim
      coc-tsserver
      coc-json
      coc-css
      coc-html
      coc-pyright
      coc-snippets
      coc-docker
      coc-markdownlint
      coc-sh
      vim-lightline-coc
      ale
    ];
    extraConfig = ''
	let g:rainbow_active = 1
	set laststatus=2
	" NERDTree configuration - Toggle NERDTree with <Ctrl-n>

	map <C-n> :NERDTreeToggle<CR>
	let NERDTreeShowHidden=1
    '';
    extraLuaConfig = ''
	-- THEME BASED ON SYSTEM MODE
      local function system_dark()
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
	local result = handle:read("*a")
	handle:close()
      	if result:match("Dark") then
	  return true
	else
	  return false
	end
      end

      if system_dark() then
        vim.cmd("colorscheme jellybeans")
        vim.g.airline_theme = "bubblegum"
        vim.g.lightline = { colorscheme = "wombat" }
      else
        vim.cmd("colorscheme morning")      -- light theme
        vim.g.airline_theme = "luna"
        vim.g.lightline = { colorscheme = "solarized_light" }
      end

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

	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, desc = "Move the selected lines down" })
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, desc = "Move the selected lines up" })
	vim.keymap.set("n", "<C-d>", "<C-d>zz")
	vim.keymap.set("n", "<C-u>", "<C-u>zz")

	-- do not lose the clipboard content after pasting.
	vim.keymap.set("x", "<leader>p", [["_dP]], { noremap = true, desc = "Paste without replacing the clipboard" })

	-- copy to system clipboard.
	vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { noremap = true, desc = "Copy to system clipboard" })
	vim.keymap.set("n", "<leader>Y", [["+Y]], { noremap = true, desc = "Copy line to system clipboard" })
	
	-- don't save into the clipboard.
	vim.keymap.set({"n", "v"}, "<leader>d", "\"_d", { noremap = true, desc = "Delete without saving into the clipboard" })
	vim.keymap.set({"n", "v"}, "<leader>D", "\"_D", { noremap = true, desc = "Delete to the end of the line without saving into the clipboard" })
	vim.keymap.set({"n", "v"}, "<leader>c", "\"_c", { noremap = true, desc = "Change without saving into the clipboard" })
	vim.keymap.set({"n", "v"}, "<leader>C", "\"_C", { noremap = true, desc = "Change to the end of the line without saving into the clipboard" })
	
	-- TODO vim quickfix stuff... what is quickfix???
	-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
	-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
	-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
	-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

	vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { noremap = true, desc = "Search and replace the word under the cursor" })

	-- FZF --
	vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
	vim.keymap.set("n", "<Leader>ff", ":GFiles<CR>", { silent = true, desc = "FZF git files" })
	vim.keymap.set("n", "<Leader>fg", ":Rg<CR>", {  silent = true, desc = "FZF git grep" })
	vim.keymap.set("n", "<Leader>fl", ":BLines<CR>", {  silent = true, desc = "FZF lines in the buffer" })
	vim.keymap.set("n", "<Leader>fb", ":Buffers<CR>", { silent = true, desc = "FZF buffers" })
	vim.keymap.set("n", "<Leader>fr", ":History<CR>", { silent = true, desc = "FZF history" })
	vim.keymap.set("n", "<Leader>fh", ":Helptags<CR>", { silent = true, desc = "FZF help tags" })

	-- COC --
	-- vim.g.coc_global_extensions = { 'coc-json', 'coc-css', 'coc-html', 'coc-python', 'coc-snippets', 'coc-docker', 'coc-yaml' }
	-- see: https://github.com/neoclide/coc.nvim/blob/master/doc/coc.txt
	vim.g.coc_user_config = {
	  ["diagnostic.displayByAle"] = true,
	}
	vim.keymap.set( 'i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"', { noremap = true, silent = true, expr = true })
	vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true, desc = "Go to definition" })
	vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true, desc = "Go to type definition" })
	vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true, desc = "Go to implementation" })
	vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true, desc = "Go to references" })

	-- ALE --
	-- see: https://github.com/dense-analysis/ale/blob/master/doc/ale.txt
	vim.g.ale_fix_on_save = 1
	vim.b.ale_fixers = {"prettier", "eslint"}
	vim.keymap.set('n', '<F8>', '<Plug>(ale_fix)', { silent = true, desc = "Fix the current file" })
	vim.keymap.set("n", "<C-k>", "<Plug>(ale_previous_wrap)", { silent = true, desc = "Go to the previous error" })
	vim.keymap.set("n", "<C-j>", "<Plug>(ale_next_wrap)", { silent = true, desc = "Go to the next error" })

	-- DIAGNOSTICS --
	-- see: https://neovim.io/doc/user/diagnostic.html
	vim.fn.sign_define('DiagnosticSignError', { text = '>>', texthl = 'RedSign' })
	vim.fn.sign_define('DiagnosticSignWarn', { text = "--", texthl = 'YellowSign' })
	vim.fn.sign_define('DiagnosticSignInfo', { text = "==", texthl = 'BlueSign' })
	vim.keymap.set("n", "<leader>e", function()
	  vim.diagnostic.open_float(0, { scope = "line" })
	end, { noremap = true, silent = true })
    '';
  };
}

