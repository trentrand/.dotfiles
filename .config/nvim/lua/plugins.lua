local execute = vim.api.nvim_command -- to execute Neovim commands
local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()

-- Auto install packer.nvim if nccessary
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end

-- Auto compile when there are changes in plugins.lua
cmd("autocmd BufWritePost plugins.lua source <afile> | PackerCompile")

require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")

	-- Themes
	use("sainnhe/everforest")
	use("https://git.sr.ht/~swalladge/paper.vim")

	-- Language server
	use({
		"williamboman/nvim-lsp-installer",
		{
			"neovim/nvim-lspconfig",
			config = function()
				require("nvim-lsp-installer").setup({})
				require("config/lsp")
			end,
		},
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = [[require('config/treesitter')]],
	})
	use({
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			-- local lsp_formatting = function(bufnr)
			-- 	vim.lsp.buf.formatting_sync({
			-- 		filter = function(client)
			-- 			-- apply whatever logic you want (in this example, we'll only use null-ls)
			-- 			return client.name == "null-ls"
			-- 		end,
			-- 		bufnr = bufnr,
			-- 	})
			-- end

			-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			require("null-ls").setup({
				-- on_attach = function(client, bufnr)
				-- 	if client.name == "tsserver" then
				-- 		client.server_capabilities.document_formatting = false -- 0.7 and earlier
				-- 		client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
				-- 	end
				-- 	if client.supports_method("textDocument/formatting") then
				-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				-- 		vim.api.nvim_create_autocmd("BufWritePre", {
				-- 			group = augroup,
				-- 			buffer = bufnr,
				-- 			callback = function()
				-- 				lsp_formatting(bufnr)
				-- 			end,
				-- 		})
				-- 	end
				-- end,
				sources = {
					-- eslint
					require("null-ls").builtins.diagnostics.eslint,
					require("null-ls").builtins.formatting.stylua,
					require("null-ls").builtins.formatting.eslint_d,
					require("null-ls").builtins.code_actions.eslint_d,
					-- git commit message linting
					require("null-ls").builtins.diagnostics.gitlint,
					-- english language
					require("null-ls").builtins.completion.spell,
				},
			})
		end,
	})

	use({
		"hrsh7th/nvim-cmp",
		config = [[require('config/cmp')]],
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-emoji",
      'David-Kunz/cmp-npm',
      'nvim-lua/plenary.nvim', -- for cmp-npm
		},
	})
	use("miguelmota/cairo.vim")
	-- use({
	-- 	"folke/todo-comments.nvim",
	-- 	requires = "nvim-lua/plenary.nvim",
	-- 	config = function()
	-- 		require("todo-comments").setup()
	-- 	end,
	-- })
	-- use("ruanyl/vim-gh-line")
	use({
		"danilamihailov/beacon.nvim",
		config = function()
			vim.cmd([[highlight Beacon guibg=black ctermbg=25]])
		end,
	})

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	-- Navigation
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
		config = [[require('config/telescope')]],
	})
	-- use 'nvim-telescope/telescope-fzf-writer.nvim'
	-- use("scrooloose/nerdtree")
  use { "https://github.com/tpope/vim-vinegar.git" } -- enhance netrw file explorer
  use { "nvim-telescope/telescope-file-browser.nvim" }
  -- vim.api.nvim_exec([[
  --   command! Finder call luaeval('!open '.expand("%:p:h"))
  -- ]], false)

	-- Editing
	use("tpope/vim-commentary")
	use({
    "tpope/vim-fugitive",
    requires = {
      { "tpope/vim-rhubarb" }
    }
  })
	use("tpope/vim-surround")
	use({
		"ggandor/leap.nvim",
		config = function()
			require("leap").setup({
				highlight_ahead_of_time = true,
				highlight_unlabeled = false,
				case_sensitive = false,
				-- Groups of characters that should match each other.
				-- E.g.: { "([{<", ")]}>", "'\"`", }
				character_classes = {},
				-- Leaving the appropriate list empty effectively disables "smart" mode,
				-- and forces auto-jump to be on or off.
				-- safe_labels = { . . . },
				-- labels = { . . . },
				-- These keys are captured directly by the plugin at runtime.
				special_keys = {
					repeat_search = "<enter>",
					next_match = "<enter>",
					prev_match = "<tab>",
					next_group = "<space>",
					prev_group = "<tab>",
					eol = "<space>",
				},
			})
		end,
	})

	-- View
	use("junegunn/goyo.vim")
	use({
    "airblade/vim-gitgutter",
    config = function()
			local opts = { noremap = true, silent = true }

			vim.keymap.set("n", "]\\", ":GitGutterLineHighlightsToggle<CR>", opts)
			vim.keymap.set("n", "[\\", ":GitGutterLineHighlightsToggle<CR>", opts)
			vim.keymap.set("n", "]n", ":GitGutterNextHunk<CR>", opts)
      vim.keymap.set("n",'[n', ':GitGutterPrevHunk<CR>', opts)
    end
  })
	use({
		"numToStr/Navigator.nvim",
		requires = {
			{ "christoomey/vim-tmux-navigator" },
		},
		config = function()
			require("Navigator").setup()

			local opts = { noremap = true, silent = true }
			local function set_keymap(...)
				vim.api.nvim_set_keymap("n", ...)
			end

			vim.g.tmux_navigator_no_mappings = true
			set_keymap("<C-h>", ":TmuxNavigateLeft<CR>", opts)
			set_keymap("<C-j>", ":TmuxNavigateDown<CR>", opts)
			set_keymap("<C-k>", ":TmuxNavigateUp<CR>", opts)
			set_keymap("<C-l>", ":TmuxNavigateRight<CR>", opts)
			set_keymap("<C-\\>", ":TmuxNavigatePrevious<CR>", opts)

			set_keymap("gn", ":bn<CR>", opts)
			set_keymap("gp", ":bp<CR>", opts)
		end,
	})
	use({
		"thaerkh/vim-workspace",
		config = function()
			vim.g.workspace_autocreate = 1
			vim.g.workspace_session_directory = "/Users/trand/.config/nvim/sessions/"
			vim.g.workspace_session_disable_on_args = 1
			vim.g.workspace_persist_undo_history = 1
			vim.g.workspace_autosave_always = 1
			vim.g.workspace_autosave_untrailspaces = 0
			vim.g.workspace_autosave_untrailtabs = 0
			vim.g.workspace_autosave_ignore = { "gitcommit" }
		end,
	})

	-- Fun
	use("alec-gibson/nvim-tetris")
	use("seandewar/nvimesweeper")

	--[[ Unused Plugins
  Plug 'oguzbilgic/vim-gdiff'
  Plug 'airblade/vim-gitgutter'
  Plug 'https://github.com/ElHacker/vim-gitstatus.git'
  Plug 'tpope/vim-repeat'
  Plug 'sheerun/vim-polyglot'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'chrisbra/unicode.vim'
  Plug 'jesseleite/vim-agriculture'
  Plug 'suan/vim-instant-markdown'
  Plug 'Freedzone/kerbovim'
  Plug 'cstrahan/vim-capnp'
  Plug 'b4winckler/vim-objc'
  --]]
end)
