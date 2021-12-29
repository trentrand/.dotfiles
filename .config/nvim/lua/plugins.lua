local execute = vim.api.nvim_command -- to execute Neovim commands
local cmd = vim.cmd	-- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn	-- to call Vim functions e.g. fn.bufnr()

-- Auto install packer.nvim if necessary
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

-- Auto compile when there are changes in plugins.lua
cmd 'autocmd BufWritePost plugins.lua source <afile> | PackerCompile'

require('packer').startup(function ()
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Themes
  use 'sainnhe/everforest'
  use 'swalladge/paper.vim'

  -- Language server
  use 'neovim/nvim-lspconfig'
  use {
    'kabouzeid/nvim-lspinstall',
    config = [[require('config/lspinstall')]]
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = [[require('config/treesitter')]]
  }
  -- use {
  --   'lewis6991/spellsitter.nvim',
  --   config = function()
  --     require('spellsitter').setup()
  --   end
  -- }
  use {
    'hrsh7th/nvim-compe',
    config = [[require('config/compe')]]
  }
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require("todo-comments").setup()
    end
  }
  use 'ruanyl/vim-gh-line'

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Navigation
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = [[require('config/telescope')]]
  }
  -- use 'nvim-telescope/telescope-fzf-writer.nvim'
  use 'scrooloose/nerdtree'

  -- Editing
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'

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
