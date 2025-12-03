# TODO:
# - Add CoC (Conquer of Completion) configuration? (see Anthon's config)
#   - Does is include LSP support? Or needs to install smtg else? (like lsp-zeros)
# - Add ALE (Asynchronous Lint Engine) configuration? (see Anthon's config)
# - Add harpoon?
# - Add telescope?
# - Add treesitter? or something else already does the job here?
# - Add fugitive? (adds functionality to fzf too, like searching commits
# - Add ale? (For linting -- better than coc-eslint and coc-prettier?)

{pkgs, nixvim, ...}: {
  programs.neovim = {
    enable = true;
    # being able to use `vi` when something is wrong with neovim is useful
    viAlias = false;
    vimAlias = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      vim-lastplace
      vim-airline
      vim-airline-themes
      rainbow
      jellybeans-vim
 
      # Uilitie
      which-key-nvim
      vim-lastplace
      nerdtree
      copilot-vim
      vim-gitgutter
      vim-commentary
      vim-sandwich
      vim-wakatime
      text-case-nvim
      fzf-vim
      vim-fugitive
      vim-rhubarb

      # IntelliSense / Syntax (CoC Suite)
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
      
      # Linting / Formatting
      ale
    ];

    extraLuaConfig = ''
      -- ============================
      -- THEME & MACOS SYSTEM DETECTION
      -- ============================
      local function system_dark()
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
        local result = handle:read("*a")
        handle:close()
        return result:match("Dark")
      end

      if system_dark() then
        vim.cmd("colorscheme jellybeans")
        vim.g.airline_theme = "bubblegum"
      else
        vim.cmd("colorscheme morning")
        vim.g.airline_theme = "luna"
      end

      -- ============================
      -- CORE SETTINGS
      -- ============================
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
      vim.opt.termguicolors = true
      vim.opt.emoji = true
      vim.opt.scrolloff = 8
      vim.opt.ignorecase = true
      vim.opt.smartcase = true
      vim.g.rainbow_active = 1
      vim.opt.laststatus = 2

      -- ============================
      -- KEYMAPS
      -- ============================
      vim.g.mapleader = " "

      -- Moving lines
      vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, desc = "Move selected lines down" })
      vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, desc = "Move selected lines up" })
      
      -- Center screen on scroll
      vim.keymap.set("n", "<C-d>", "<C-d>zz")
      vim.keymap.set("n", "<C-u>", "<C-u>zz")

      -- Clipboard magic
      vim.keymap.set("x", "<leader>p", [["_dP]], { noremap = true, desc = "Paste over selection without losing clipboard" })
      vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { noremap = true, desc = "Copy to system clipboard" })
      vim.keymap.set("n", "<leader>Y", [["+Y]], { noremap = true, desc = "Copy line to system clipboard" })
      vim.keymap.set({"n", "v"}, "<leader>d", "\"_d", { noremap = true, desc = "Delete to void" })

      -- QUICKFIX NAVIGATION (Fixed TODO)
      -- These allow you to traverse search results (Rg) or error lists
      vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", { desc = "Next Quickfix" })
      vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", { desc = "Prev Quickfix" })
      vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz", { desc = "Next Location" })
      vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz", { desc = "Prev Location" })

      -- ============================
      -- PLUGIN CONFIGS
      -- ============================

      -- which-key
      require("which-key").setup({
	icons = { 
	  mappings = false 
	},
	win = {
	  border = "rounded",
	},
	preset = "modern",
	spec = {
	  { "<leader>f", group = "Find" },
	  { "ga", group = "Change Case", mode = { "n", "v" } },
	  { "<leader>s", group = "Surround", mode = { "n", "v" } },
	},
      })

      -- vim-sandwich
      vim.keymap.set({ "n", "x" }, "<leader>sa", "<Plug>(sandwich-add)", { desc = "Add Surround", remap = true })
      vim.keymap.set("n", "<leader>sd", "<Plug>(sandwich-delete)", { desc = "Delete Surround", remap = true })
      vim.keymap.set("n", "<leader>sr", "<Plug>(sandwich-replace)", { desc = "Replace Surround", remap = true })
      vim.keymap.set("n", "<leader>sdb", "<Plug>(sandwich-delete-auto)", { desc = "Delete Surround (Auto)", remap = true })
      vim.keymap.set("n", "<leader>srb", "<Plug>(sandwich-replace-auto)", { desc = "Replace Surround (Auto)", remap = true })

      -- text-case-nvim
      require("textcase").setup({})

      -- NERDTree
      vim.keymap.set("n", "<C-n>", "<cmd>NERDTreeToggle<CR>", { silent = true, desc = "Toggle NERDTree" })
      vim.g.NERDTreeShowHidden = 1
      
      -- FZF
      vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
      vim.keymap.set("n", "<Leader>ff", ":GFiles<CR>", { silent = true, desc = "Find git files" })
      vim.keymap.set("n", "<Leader>fg", ":Rg<CR>", { silent = true, desc = "Grep files" })
      vim.keymap.set("n", "<Leader>fb", ":Buffers<CR>", { silent = true, desc = "Find buffers" })

      -- CoC
      vim.g.coc_user_config = {
        ["diagnostic.displayByAle"] = true, -- Tell CoC to use ALE for display
      }
      -- CoC Enter key completion fix
      vim.keymap.set('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<CR>"', { noremap = true, silent = true, expr = true })
      
      -- Go To (LSP)
      vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true, desc = "Go to definition" })
      vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true, desc = "Go to references" })

      -- ALE
      vim.b.ale_fixers = {"prettier", "eslint"}
      vim.g.ale_disable_lsp = 1 -- Let CoC handle LSP/Intellisense
      vim.g.ale_fix_on_save = 1
      vim.keymap.set('n', '<F8>', '<Plug>(ale_fix)', { silent = true, desc = "Fix current file" })

      -- Native Diagnostics (Visuals)
      -- Note: CoC might override this, but this sets the symbols for Neovim's UI
      vim.fn.sign_define('DiagnosticSignError', { text = '>>', texthl = 'RedSign' })
      vim.fn.sign_define('DiagnosticSignWarn', { text = "--", texthl = 'YellowSign' })
      vim.fn.sign_define('DiagnosticSignInfo', { text = "==", texthl = 'BlueSign' })
      
      vim.keymap.set("n", "<leader>e", function()
        vim.diagnostic.open_float(0, { scope = "line" })
      end, { noremap = true, silent = true })
    '';
  };
}
